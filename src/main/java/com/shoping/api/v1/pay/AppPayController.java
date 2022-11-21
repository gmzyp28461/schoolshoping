package com.shoping.api.v1.pay;


import com.shoping.common.exception.AppBusinessException;
import com.shoping.common.utils.StringUtils;
import com.shoping.framework.aspectj.lang.annotation.Log;
import com.shoping.framework.aspectj.lang.enums.BusinessType;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.project.system.user.domain.User;
import com.shoping.project.system.user.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api("支付")
@Controller
@RequestMapping("/app/v1/pay")
public class AppPayController extends BaseController {

    @Autowired
    private AppPayService payService;


    @Autowired
    private IUserService userService;

    @Value("${wechat.appId}")
    public String appId;
    @Value("${wechat.mchSerialNo}")
    public String mchSerialNo;
    @Value("${wechat.apiKey}")
    public String apiKey;
    @Value("${wechat.apiV3Key}")
    public String apiV3Key;
    @Value("${wechat.mchId}")
    public String mchId;
    @Value("${wechat.notifyUrl}")
    public String notifyUrl;
    @Value("${wechat.notifyRefunds}")
    public String notifyRefunds;



    public WxPayConfig wxPayConfig() {
        WxPayConfig config = new WxPayConfig();
        config.setAppId(appId);
        config.setMchSerialNo(mchSerialNo);
        config.setApiKey(apiKey);
        config.setApiV3Key(apiV3Key);
        config.setMchId(mchId);
        config.setNotifyUrl(notifyUrl);
        config.setNotifyRefunds(notifyRefunds);
        return config;
    }


    @PostMapping("/createOrder")
    @ApiOperation(value = "订单支付", notes = "订单支付")
    @Log(title = "订单支付", businessType = BusinessType.INSERT)
    @Transactional(rollbackFor = Exception.class)
    @ResponseBody
    public AjaxResult createOrder(HttpServletRequest request,OrderForm orderForm) throws Exception {
        User sysUser = super.getCurrentAppUserToken();

        //判断有没有选择地址
        if (StringUtils.isEmpty(orderForm.getUserName())) {
            throw new AppBusinessException("请填写收货地址");
        }
        if (StringUtils.isEmpty(orderForm.getGoodsStr())) {
            throw new AppBusinessException("参数错误");
        }

       WxPayConfig config = wxPayConfig();
        sysUser = userService.selectUserById(sysUser.getUserId());


        User disUser = new User();
        if (StringUtils.isNotEmpty(orderForm.getVipcode())){
            User codeUser = new User();
            codeUser.setInviteCode(orderForm.getVipcode());
            List<User> userList= userService.selectUserList(codeUser);
            if (userList==null||userList.size()==0){
                throw new AppBusinessException("折扣码无效");
            }
            disUser.setUserId(userList.get(0).getUserId());
            disUser.setInviteCode(orderForm.getVipcode());

        }


        Map<String, Object> map = new HashMap<>();
        Map<String, Object> resultMap = payService.createOrder(orderForm, config, sysUser,disUser);
        resultMap.put("code", "200");
        resultMap.put("msg", "下单成功");
        return AjaxResult.success(resultMap);
    }


    @PostMapping("/notify")
    @ApiOperation(value = "订单支付回调", notes = "订单支付回调")
    @ResponseBody
    public Map<String, String> notify(HttpServletRequest request, HttpServletResponse response) throws Exception {
        WxPayConfig config = wxPayConfig();
        String result = payService.notify(request, response, config);
        System.out.println("===========wxpay notify message:" + result);
        Map<String, String> map = new HashMap<>();
        map.put("code", "SUCCESS");
        map.put("message", "成功");
        return map;
    }


    @PostMapping("/notifyRefunds")
    @ResponseBody
    public Map<String, String> notifyRefunds(HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, String> map = new HashMap<>();
        map.put("code", "SUCCESS");
        map.put("message", "成功");
        return map;
    }



}
