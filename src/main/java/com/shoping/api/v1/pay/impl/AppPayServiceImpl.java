package com.shoping.api.v1.pay.impl;


import cn.hutool.http.ContentType;
import cn.hutool.json.JSONUtil;
import com.github.pagehelper.util.StringUtil;
import com.shoping.api.v1.pay.AppPayService;
import com.shoping.api.v1.pay.OrderForm;
import com.shoping.api.v1.pay.SignUtil;
import com.shoping.api.v1.pay.WxPayConfig;
import com.shoping.common.exception.AppBusinessException;
import com.shoping.common.utils.AmountUtils;
import com.shoping.common.utils.DateUtils;
import com.shoping.common.utils.OrderUtils;
import com.shoping.common.utils.StringUtils;
import com.shoping.common.utils.security.ShiroUtils;
import com.shoping.common.utils.text.Convert;
import com.shoping.common.utils.uuid.IdUtils;
import com.shoping.framework.aspectj.lang.annotation.Excel;
import com.shoping.framework.config.RuoYiConfig;
import com.shoping.project.shop.domain.*;
import com.shoping.project.shop.mapper.*;
import com.shoping.project.system.user.domain.User;
import com.wechat.pay.contrib.apache.httpclient.WechatPayHttpClientBuilder;
import com.wechat.pay.contrib.apache.httpclient.auth.AutoUpdateCertificatesVerifier;
import com.wechat.pay.contrib.apache.httpclient.auth.PrivateKeySigner;
import com.wechat.pay.contrib.apache.httpclient.auth.WechatPay2Credentials;
import com.wechat.pay.contrib.apache.httpclient.auth.WechatPay2Validator;
import com.wechat.pay.contrib.apache.httpclient.util.AesUtil;
import net.sf.json.JSONObject;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.KeyFactory;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.util.*;

/**
 * @ClassName AppPayServiceImpl
 * @Description:
 * @Author javac
 * @Date 2021/4/17
 **/
@Service
public class AppPayServiceImpl implements AppPayService {

    @Autowired
    private MineAddressMapper mineAddressMapper;

    @Autowired
    private MineCartMapper mineCartMapper;

    @Autowired
    private MineOrderMapper mineOrderMapper;

    @Autowired
    private MineOrderDetailMapper mineOrderDetailMapper;

    @Autowired
    private MineGoodsMapper mineGoodsMapper;

    @Autowired
    private MinePartnerApplyMapper minePartnerApplyMapper;

    @Override
    @Transactional
    public Map<String, Object> createOrder(OrderForm orderForm, WxPayConfig config, User user,User disUser) throws Exception {
        Map<String, Object> map = new HashMap<>();
        String out_trade_no = OrderUtils.getOrderCode(null);

        String orderId = IdUtils.simpleUUID();
        Date date = new Date();
        map.put("orderCode", out_trade_no);

        String orderCodeType = "1";
        String payStatus = "30";


        //********************?????????????????????????????????
        //???????????????  ????????????????????????
        String nonceStr = IdUtils.simpleUUID();
        //????????? ????????????????????????
        String timeStamp = String.valueOf(System.currentTimeMillis());
        String result = "";
        String prepay_id = "";
        String paySign = "";

        //????????????
      /*  MineCart mineCart = new MineCart();
        mineCart.setUserId(user.getUserId());
        List<MineCart>  cartList =  mineCartMapper.selectMineCartList(mineCart);//???????????????*/
        List<MineOrderDetail> detailList = new ArrayList<>();//????????????
        //??????????????????
        //?????????id+"@@@"+??????id+"@@@"+????????????+"###"
        String[] strings = Convert.toStrArray("###",orderForm.getGoodsStr());
        if (strings.length==0)
            throw  new AppBusinessException("????????????");


        BigDecimal priceAll = new BigDecimal("0");
        for (String str: strings) {
            if (StringUtil.isNotEmpty(str)){
                String[] goods = Convert.toStrArray("@@@",str);
                String cartId = goods[0];
                String goodsId =goods[1];
                String num =goods[2];

                MineGoods mineGoods = mineGoodsMapper.selectMineGoodsByUuid(Long.parseLong(goodsId));

                if (mineGoods.getStock()<=0){
                    throw  new AppBusinessException("????????????");
                }

                BigDecimal price = mineGoods.getPrice().multiply(new BigDecimal(num.toString()));
                priceAll =  priceAll.add(price);

                MineOrderDetail detail = new MineOrderDetail();
                detail.setUuid(IdUtils.simpleUUID());
                detail.setGoodsId(Long.parseLong(goodsId));
                detail.setUserId(user.getUserId());
                detail.setOrderId(orderId);
                detail.setPrice(mineGoods.getPrice());
                detail.setNum(Integer.parseInt(num));
                detail.setCreateBy(user.getUserId().toString());
                detail.setCreateTime(date);
                detailList.add(detail);

                //??????????????????
                mineGoods.setStock((mineGoods.getStock()-Long.parseLong(num)));
                mineGoodsMapper.updateMineGoods(mineGoods);

                //???????????????
                if (StringUtil.isNotEmpty(cartId)) {
                    MineCart mineCart = new MineCart();
                    mineCart.setUserId(user.getUserId());
                    mineCart.setGoodsId(Long.parseLong(goodsId));
                    mineCartMapper.deleteMineCartByUuid(mineCart);
                }
            }
        }
        String amountF = AmountUtils.changeY2F(priceAll.toString());
        BigDecimal pay = new BigDecimal(AmountUtils.changeY2F(priceAll.toString()));

        //?????????????????????

         BigDecimal discount=new BigDecimal("0");
         BigDecimal ratio=new BigDecimal("0");
         BigDecimal commPrice=new BigDecimal("0");
        if (StringUtils.isNotEmpty(orderForm.getVipcode())){
            MinePartnerApply minePartnerApply = new MinePartnerApply();
            minePartnerApply.setUserId(disUser.getUserId());
            List<MinePartnerApply> applyList = minePartnerApplyMapper.selectMinePartnerApplyList(minePartnerApply);
            if (applyList==null||applyList.size()==0){
                throw new AppBusinessException("???????????????");
            }
            if (!applyList.get(0).getStatus().equals("20")){
                throw new AppBusinessException("???????????????");
            }
            discount =applyList.get(0).getDiscount();
            ratio =applyList.get(0).getRatio();
            pay = pay.multiply(discount).divide(new BigDecimal("100"));
            commPrice = pay.multiply(ratio).divide(new BigDecimal("10000"));
        }



        //??????
        MineOrder order = new MineOrder();
        order.setUuid(orderId);
        order.setUserId(user.getUserId());
        order.setOrderCode(out_trade_no);
        order.setPrice(new BigDecimal(amountF));
        order.setPayPrice(pay);
        order.setPayTime(date);
        order.setPayStatus(payStatus);
        order.setOrderCodeType(orderCodeType);
        order.setCreateBy(user.getUserId().toString());
        order.setCreateTime(date);
        order.setVipUserId(disUser.getUserId());
        order.setVipCode(orderForm.getVipcode());
        order.setDiscount(discount);
        order.setRatio(ratio);
        order.setCommPrice(commPrice);


        //??????
        MineAddress address = new MineAddress();
        address.setUserId(user.getUserId());
        address.setOrderId(orderId);
        address.setUserName(orderForm.getUserName());
        address.setProvinceName(orderForm.getProvinceName());
        address.setCityName(orderForm.getCityName());
        address.setCountyName(orderForm.getCountyName());
        address.setDetailInfo(orderForm.getDetailInfo());
        address.setNationalCode(orderForm.getNationalCode());
        address.setTelNumber(orderForm.getTelNumber());

        mineAddressMapper.insertMineAddress(address);
        mineOrderDetailMapper.batchDetails(detailList);
        mineOrderMapper.insertMineOrder(order);


        //????????????

        map.put("appId", config.getAppId());
        map.put("timeStamp", timeStamp);
        map.put("nonceStr", nonceStr);
        map.put("package", result);
        map.put("signType", "RSA");
        map.put("paySign", paySign);


        //

        return map;
    }

    @Override
    @Transactional
    public String notify(HttpServletRequest request, HttpServletResponse response, WxPayConfig config) throws Exception {
        Map<String, String> map = new HashMap<>(12);
        String result = readData(request);
        // ???????????????????????????????????????????????????verifyNotify ??????????????????????????????
        String plainText = verifyNotify(result, config.getApiV3Key());
        System.out.println("plainText:" + plainText);
        if (StringUtil.isNotEmpty(plainText)) {
            response.setStatus(200);
            map.put("code", "SUCCESS");
            map.put("message", "SUCCESS");
        } else {
            response.setStatus(500);
            map.put("code", "ERROR");
            map.put("message", "????????????");
        }
        response.setHeader("Content-type", ContentType.JSON.toString());
        response.getOutputStream().write(JSONUtil.toJsonStr(map).getBytes(StandardCharsets.UTF_8));
        response.flushBuffer();
        if (response.getStatus() == 200) {
            String out_trade_no = JSONObject.fromObject(plainText).getString("out_trade_no");
            String transaction_id = JSONObject.fromObject(plainText).getString("transaction_id");
            String trade_state = JSONObject.fromObject(plainText).getString("trade_state");
            String trade_state_desc = JSONObject.fromObject(plainText).getString("trade_state_desc");
            String attach = JSONObject.fromObject(plainText).getString("attach");
            String success_time = JSONObject.fromObject(plainText).getString("success_time");
            String amount = JSONObject.fromObject(plainText).getString("amount");

            MineOrder mineOrder = new MineOrder();
            mineOrder.setOrderCode(out_trade_no);
            List<MineOrder> list = mineOrderMapper.selectMineOrderList(mineOrder);
            if (!list.get(0).getPayStatus().equals("30")) {
                String orderId = list.get(0).getUuid();
                MineOrder order = new MineOrder();
                order.setUuid(orderId);
                order.setPayTime(DateUtils.dateTime("yyyy-MM-dd HH:mm:ss", success_time.replace("T", " ").replace("+", " ")));
                order.setUpdateTime(new Date());
                order.setBusPayNo(transaction_id);
                order.setPayStatus("30");
                mineOrderMapper.updateMineOrder(order);
            }


            System.out.println("out_trade_no:" + out_trade_no);
            System.out.println("transaction_id:" + transaction_id);
            System.out.println("trade_state:" + trade_state);
            System.out.println("trade_state_desc:" + trade_state_desc);
            System.out.println("attach:" + attach);
            System.out.println("success_time:" + success_time);
            System.out.println("amount:" + amount);
            return out_trade_no;
        } else {
            return "";
        }
    }

    /***
     * ??????
     * @return
     * @throws IOException
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int refunds(MineOrder mineOrder, WxPayConfig config,BigDecimal price) throws IOException {

        //??????
        String resource = "apiclient_key.pem";
        String filePath = RuoYiConfig.getDownloadPath() + "/" + resource;
        PrivateKey merchantPrivateKey = getPrivateKey(filePath);

        // ?????????????????????mchId????????????,mchSerialNo????????????????????????,apiV3Key???V3?????????
        AutoUpdateCertificatesVerifier verifier = new AutoUpdateCertificatesVerifier(
                new WechatPay2Credentials(config.getMchId(), new PrivateKeySigner(config.getMchSerialNo(), merchantPrivateKey)), config.getApiV3Key().getBytes("utf-8"));

        // ?????????httpClient
        // *********************** ???????????? HttpClient ??????????????????
        HttpClient httpClient = WechatPayHttpClientBuilder.create()
                .withMerchant(config.getMchId(), config.getMchSerialNo(), merchantPrivateKey)
                .withValidator(new WechatPay2Validator(verifier)).build();
        // ??????URL
        HttpPost httpPost = new HttpPost("https://api.mch.weixin.qq.com/v3/refund/domestic/refunds");

        BigDecimal refundsPrice=price.multiply(new BigDecimal("100"));
        // ??????body??????
        String reqdata = "{"
                + "\"out_trade_no\": \"" + mineOrder.getOrderCode() + "\","
                + "\"notify_url\": \"" + config.getNotifyRefunds() + "\","
                + "\"amount\": {"
                + "\"total\": " + mineOrder.getPrice().intValue() + ","
                + "\"currency\": \"CNY\","
                + "\"refund\": " + refundsPrice.intValue()
                + "},"
                + "\"out_refund_no\": \"" + OrderUtils.getOrderCode(null) + "\","
                + "\"reason\": \"????????????\""
                + "}";

        StringEntity entity = new StringEntity(reqdata, "utf-8");
        entity.setContentType("application/json");
        httpPost.setEntity(entity);
        httpPost.setHeader("Accept", "application/json");
        //???????????????????????????
        CloseableHttpResponse response = (CloseableHttpResponse) httpClient.execute(httpPost);

        JSONObject jsonObject1 = JSONObject.fromObject(EntityUtils.toString(response.getEntity()));
        System.out.println(jsonObject1);
        try {
            int statusCode = response.getStatusLine().getStatusCode();

            if (statusCode == 200) {

                System.out.println("success,refunds body = " + EntityUtils.toString(response.getEntity()));
                JSONObject jsonObject = JSONObject.fromObject(EntityUtils.toString(response.getEntity()));
                String out_refund_no = jsonObject.getString("out_refund_no");
                String out_trade_no = jsonObject.getString("out_trade_no");
                String transaction_id = jsonObject.getString("transaction_id");

                String orderCodeRandom = OrderUtils.getOrderCode(null);
                //????????????
//        10 ?????????
//        20 ????????????
//        30 ????????????
//        40 ?????????
//        50 ??????
                MineOrder order = new MineOrder();
                String orderId = IdUtils.simpleUUID();
                order.setUuid(orderId);
                order.setPrice(new BigDecimal(String.valueOf(refundsPrice)));
                order.setOrderCode(orderCodeRandom);//?????????
                order.setPrepayId(out_refund_no);//????????????????????????
                order.setPayStatus("30");//?????????
                order.setOrderCodeType("3");//??????
                order.setPayTime(new Date());
                order.setDelFlag("0");
                order.setUserId(ShiroUtils.getUserId());
                order.setCreateBy(ShiroUtils.getUserId().toString());
                order.setCreateTime(new Date());
                order.setRemark(out_trade_no);
                order.setBusPayNo(transaction_id);
                mineOrderMapper.insertMineOrder(order);


                MineOrder orderRefunds = new MineOrder();
                orderRefunds.setUuid(mineOrder.getUuid());
                orderRefunds.setPayStatus("70");
                mineOrderMapper.updateMineOrder(orderRefunds);

                return 1;
            } else {
                return 0;
            }
        } finally {
            response.close();
        }

    }



    /**
     * ??????????????????
     *
     * @param request
     * @return
     */
    static String readData(HttpServletRequest request) {
        BufferedReader br = null;
        try {
            StringBuilder result = new StringBuilder();
            br = request.getReader();
            for (String line; (line = br.readLine()) != null; ) {
                if (result.length() > 0) {
                    result.append("\n");
                }
                result.append(line);
            }
            return result.toString();
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    /**
     * v3 ??????????????????????????????
     *
     * @param body ??????????????????
     * @param key  api ??????
     * @return ??????????????????
     * @throws Exception ????????????
     */
    static String verifyNotify(String body, String key) throws Exception {
        // ???????????????????????????
        cn.hutool.json.JSONObject resultObject = JSONUtil.parseObj(body);
        cn.hutool.json.JSONObject resource = resultObject.getJSONObject("resource");
        String cipherText = resource.getStr("ciphertext");
        String nonceStr = resource.getStr("nonce");
        String associatedData = resource.getStr("associated_data");
        AesUtil aesUtil = new AesUtil(key.getBytes(StandardCharsets.UTF_8));
        // ????????????
        return aesUtil.decryptToString(
                associatedData.getBytes(StandardCharsets.UTF_8),
                nonceStr.getBytes(StandardCharsets.UTF_8),
                cipherText
        );
    }

    /**
     * ???????????????
     *
     * @param filename ??????????????????  (required)
     * @return ????????????
     */
    public static PrivateKey getPrivateKey(String filename) throws IOException {

        String content = new String(Files.readAllBytes(Paths.get(filename)), "utf-8");
        try {
            String privateKey = content.replace("-----BEGIN PRIVATE KEY-----", "")
                    .replace("-----END PRIVATE KEY-----", "")
                    .replaceAll("\\s+", "");

            KeyFactory kf = KeyFactory.getInstance("RSA");
            return kf.generatePrivate(
                    new PKCS8EncodedKeySpec(Base64.getMimeDecoder().decode(privateKey)));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("??????Java???????????????RSA", e);
        } catch (InvalidKeySpecException e) {
            throw new RuntimeException("?????????????????????");
        }
    }

}
