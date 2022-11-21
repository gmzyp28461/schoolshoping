package com.shoping.api.v1;

import com.shoping.common.exception.AppBusinessException;
import com.shoping.common.utils.RedisCache;
import com.shoping.common.utils.StringUtils;
import com.shoping.common.utils.uuid.IdUtils;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.framework.web.page.TableDataInfo;
import com.shoping.project.shop.domain.*;
import com.shoping.project.shop.service.*;
import com.shoping.project.system.user.domain.User;
import com.shoping.project.system.user.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.math.BigDecimal;
import java.util.*;

/**
 * @ClassName SysConfigController
 * @Description:
 * @Author javac
 * @Date 2021/11/11
 **/
@Api("小程序信息")
@Controller
@RequestMapping("/app/v1/mini")
public class AppShopController extends BaseController {

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private IMineBannerService bannerService;

    @Autowired
    private IMineTypeService typeService;

    @Autowired
    private IMineGoodsService goodsService;

    @Autowired
    private IMineCartService cartService;

    @Autowired
    private IMineOrderService orderService;

    @Autowired
    private IUserService userService;

    @Autowired
    private IMineCollectService collectService;

    @Autowired
    private IMineCommentService commentService;

    @Autowired
    private IMinePartnerApplyService minePartnerApplyService;

    @Autowired
    private IMineBalanceService mineBalanceService;

    @ApiOperation(value = "轮播图信息", notes = "轮播图信息")
    @PostMapping(value = "/getBanner", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult getBanner() {
        List<MineBanner> list =  bannerService.selectMineBannerList(new MineBanner());
        return AjaxResult.success(list);
    }


    @ApiOperation(value = "分类", notes = "分类")
    @PostMapping(value = "/getType", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult getType(MineType mineType) {
        List<MineType> list =  typeService.selectMineTypeList(mineType);
        return AjaxResult.success(list);
    }

    @ApiOperation(value = "购物车列表", notes = "购物车列表")
    @PostMapping(value = "/getCart", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult getCart(MineCart mineCart) {
        User user = getCurrentAppUserToken();
        mineCart.setUserId(user.getUserId());
        List<MineCart> list =  cartService.selectMineCartList(mineCart);
        return AjaxResult.success(list);
    }


    @ApiOperation(value = "保存购物车、取消购物车", notes = "保存购物车 save、取消购物车 cancel")
    @PostMapping(value = "/optCart/{type}/{goodsId}", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult optCart(@PathVariable String type,@PathVariable Long goodsId) {
        User user =  getCurrentAppUserToken();
        MineCart cart = new MineCart();
        cart.setUserId(user.getUserId());
        cart.setGoodsId(goodsId);
        if (type.equals("save")){
            List<MineCart> list =  cartService.selectMineCartList(cart);

            if(list!=null&&list.size()>0){
                throw new AppBusinessException("购物车已存在");
            }
            if(list!=null&&list.size()>=50){
                throw new AppBusinessException("购物车太多啦");
            }

            cart.setCreateBy(user.getUserId().toString());
            cartService.insertMineCart(cart);


        }else if (type.equals("cancel")){
            cartService.deleteMineCartByUuid(cart);
        }
        return AjaxResult.success();
    }


    @ApiOperation(value = "首页推荐列表", notes = "首页推荐列表")
    @PostMapping(value = "/getRecomGoodsList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<MineGoods> getRecomGoodsList() {
        String token =getToken();
        long userId=0l;
        if (StringUtils.isNotEmpty(token)){
            User user = (User) redisCache.getCacheObject("user_"+token);
            if (StringUtils.isNotNull(user)){
                userId = user.getUserId();
            }
        }
        List<MineGoods> list = recommend(userId);
        return list;
    }

    @ApiOperation(value = "商品列表", notes = "商品列表")
    @PostMapping(value = "/getGoodsList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public TableDataInfo getGoodsList(MineGoods goods) {
        startPage();
        List<MineGoods> list = goodsService.selectMineGoodsList(goods);
        return getDataTable(list);
    }


    @ApiOperation(value = "商品详细", notes = "商品详细")
    @PostMapping(value = "/detailById/{uuid}", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult detailById(@PathVariable Long uuid) {
        MineGoods goods = new MineGoods();
        String token =getToken();
        User user = (User) redisCache.getCacheObject("user_"+token);
        if (StringUtils.isNotNull(user)) {
            goods.setStatusToken(user.getUserId().toString());
        }

        goods.setUuid(uuid);
        List<MineGoods> list = goodsService.selectMineGoodsList(goods);
        if (list!=null&&list.size()>0){
            goods=list.get(0);
            if (StringUtils.isEmpty(token)){
                goods.setCollectStatus("star-o");
            }
            return AjaxResult.success(goods);
        }else{
            return AjaxResult.error("数据错误");
        }
    }


    @ApiOperation(value = "订单列表", notes = "订单列表")
    @PostMapping(value = "/getOrderList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public TableDataInfo getOrderList(MineOrder order) {
        User user = getCurrentAppUserToken();
        order.setUserId(user.getUserId());
        order.setDelFlag("0");
        order.setOrderCodeType("1");
        startPage();
        List<MineOrder> list =  orderService.selectMineOrderList(order);
        return getDataTable(list);
    }

    @ApiOperation(value = "订单详细", notes = "订单详细")
    @PostMapping(value = "/orderDetail/{uuid}", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult orderDetail(@PathVariable String uuid)
    {
        return AjaxResult.success(orderService.selectMineOrderByUuid(uuid));
    }

    @ApiOperation(value = "删除订单", notes = "删除订单")
    @PostMapping(value = "/removeOrder/{uuid}", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult removeOrder(@PathVariable String uuid)
    {
        User user = getCurrentAppUserToken();
        return toAjax(orderService.deleteMineOrderByUuid(uuid));
    }
    @ApiOperation(value = "确认收货", notes = "确认收货")
    @PostMapping(value = "/sureOrder/{uuid}", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult sureOrder(@PathVariable String uuid)
    {
        User user = getCurrentAppUserToken();
        MineOrder mineOrder = new MineOrder();
        mineOrder.setUuid(uuid);
        mineOrder.setPayStatus("50");
        mineOrder.setReceivingDate(new Date());
        return toAjax(orderService.updateMineOrder(mineOrder));
    }


    @ApiOperation(value = "收藏列表", notes = "收藏列表")
    @PostMapping(value = "/getCollectList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public TableDataInfo getCollectList(MineCollect collect) {
        User user =  getCurrentAppUserToken();
        collect.setUserId(user.getUserId());
        startPage();
        List<MineCollect> list = collectService.selectMineCollectList(collect);
        return getDataTable(list);
    }

    @ApiOperation(value = "保存收藏、取消收藏", notes = "保存收藏 save、取消收藏 cancel")
    @PostMapping(value = "/optCollect/{type}/{goodId}", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult optCollect(@PathVariable String type,@PathVariable long goodId) {
        User user =  getCurrentAppUserToken();
        MineCollect collect = new MineCollect();
        collect.setUserId(user.getUserId());
        collect.setGoodsId(goodId);
        if (type.equals("save")){
            collect.setCreateBy(user.getUserId().toString());
            collectService.insertMineCollect(collect);
        }else if (type.equals("cancel")){
            collectService.deleteMineCollectByUuid(collect);
        }
        return AjaxResult.success();
    }


    @ApiOperation(value = "评论列表", notes = "评论列表")
    @PostMapping(value = "/getCommentList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<MineComment> getCommentList(MineComment comment) {
        List<MineComment> list = commentService.selectMineCommentList(comment);
        return list;
    }

    @ApiOperation(value = "我的评论列表", notes = "评论列表")
    @PostMapping(value = "/getMyCommentList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public TableDataInfo getMyCommentList(MineComment comment) {
        User user =  getCurrentAppUserToken();
        comment.setUserId(user.getUserId());
        startPage();
        List<MineComment> list = commentService.selectMineCommentList(comment);
        return getDataTable(list);
    }


    @ApiOperation(value = "评论保存", notes = "评论保存")
    @PostMapping(value = "/commentSave", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult commentSave(String commstr,String orderId) {
        // comment+"#wxg#"+element.goodsId+"@wxg@";

        User user =  getCurrentAppUserToken();

        if (StringUtils.isEmpty(commstr)){
            throw new AppBusinessException("评论不能为空");
        }

        String arr[] = commstr.split("@wxg@");
        if (arr!=null&&arr.length>0){
            for (String str:arr ) {
                String com[] =str.split("#wxg#");

                MineComment comment = new MineComment();
                comment.setUuid(IdUtils.simpleUUID());
                comment.setGoodsId(com[1]);
                comment.setContent(com[0]);
                comment.setUserId(user.getUserId());
                comment.setCreateBy(user.getUserId().toString());
                commentService.insertMineComment(comment);

            }
        }



        //更新订单评论
        MineOrder order = new MineOrder();
        order.setUuid(orderId);
        order.setCommStatus("1");
        orderService.updateMineOrder(order);

        return AjaxResult.success();
    }

    @ApiOperation(value = "评论删除", notes = "评论删除")
    @PostMapping(value = "/commentRemove/{uuid}", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult commentRemove(@PathVariable Long uuid) {
        User user =  getCurrentAppUserToken();
        commentService.deleteMineCommentByUuid(uuid);
        return AjaxResult.success();
    }


    @ApiOperation(value = "合伙人查询", notes = "合伙人查询")
    @PostMapping(value = "/getVipList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult getVipList(MinePartnerApply apply) {
        User user =  getCurrentAppUserToken();
        apply.setUserId(user.getUserId());
        List<MinePartnerApply> list = minePartnerApplyService.selectMinePartnerApplyList(apply);
        if (list!=null&&list.size()>0){
            return  AjaxResult.success(list.get(0));
        }
        return AjaxResult.success();
    }

    @ApiOperation(value = "合伙人申请", notes = "合伙人申请")
    @PostMapping(value = "/applySave", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult applySave(MinePartnerApply apply) {
        User user =  getCurrentAppUserToken();
        apply.setUserId(user.getUserId());
        apply.setStatus("10");
        if (StringUtils.isNotNull(apply.getUuid())){
            minePartnerApplyService.updateMinePartnerApply(apply);
        }else{
            minePartnerApplyService.insertMinePartnerApply(apply);
        }
        return AjaxResult.success();
    }



    @ApiOperation(value = "佣金", notes = "佣金")
    @PostMapping(value = "/commprice", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult commprice() {
        User user =  getCurrentAppUserToken();
        MineOrder mineOrder =new MineOrder();
        mineOrder.setVipUserId(user.getUserId());
        mineOrder.setDelFlag("0");
        List<MineOrder>  list = orderService.selectMineOrderList(mineOrder);

        BigDecimal price1=new BigDecimal("0");
        if (list!=null&&list.size()>0){
            for (MineOrder order:list) {
                price1 = price1.add(order.getCommPrice());
            }
        }


        MineBalance mineBalance = new MineBalance();
        mineBalance.setUserId(user.getUserId());
        mineBalance.setStatus("20");
        List<MineBalance>  balanceList = mineBalanceService.selectMineBalanceList(mineBalance);


        BigDecimal price2=new BigDecimal("0");
        if (list!=null&&list.size()>0){
            for (MineBalance balance:balanceList) {
                price2 = price2.add(balance.getPrice());
            }
        }
        BigDecimal price3=new BigDecimal("0");
        price3 = price1.subtract(price2);

        return AjaxResult.success(price3);
    }


    @ApiOperation(value = "提现列表", notes = "提现列表")
    @PostMapping(value = "/getCommpriceList", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public List<MineBalance> getCommpriceList() {
        User user =  getCurrentAppUserToken();
        MineBalance mineBalance = new MineBalance();
        mineBalance.setUserId(user.getUserId());
        List<MineBalance> list = mineBalanceService.selectMineBalanceList(mineBalance);
        return list;
    }

    @ApiOperation(value = "提现申请", notes = "提现申请")
    @PostMapping(value = "/commpriceSave", produces = {"application/json; charset=utf-8"})
    @ResponseBody
    public AjaxResult commpriceSave(MineBalance mineBalance) {
        User user =  getCurrentAppUserToken();
        mineBalance.setUserId(user.getUserId());
        mineBalance.setStatus("10");
        List<MineBalance> list = mineBalanceService.selectMineBalanceList(mineBalance);
        if (list!=null&&list.size()>0){
            throw  new AppBusinessException("有一笔提现正在审核中，请勿再次提交");
        }

        mineBalanceService.insertMineBalance(mineBalance);

        return AjaxResult.success();
    }







    //通过计算余弦相似度并取TopN
    public  List<MineGoods> recommend(long userId){

        List<MineCollect>  likeLists;                                       //其他用户喜欢的列表

        List<User> users = userService.selectUserList(new User());                   //所有用户列表

        MineGoods goods = new MineGoods();
        goods.setState("10");//未下架
        List<MineGoods> menuList = goodsService.selectMineGoodsList(goods);               //所有列表
        int[][] curMatrix = new int[menuList.size()+6][menuList.size()+6];   //当前矩阵
        int[][] comMatrix = new int[menuList.size()+6][menuList.size()+6];   //共现矩阵
        int[] N = new int[menuList.size()+6];                              //喜欢每个物品的人数

        for(User user: users){
            if(user.getUserId()==userId) continue;                    //当前用户则跳过

            MineCollect collect = new MineCollect();
            collect.setUserId(user.getUserId());
            likeLists = collectService.selectMineCollectList(collect); //当前用户的喜欢列表

            for(int i = 0; i < menuList.size(); i++)
                for(int j = 0; j < menuList.size(); j++)
                    curMatrix[i][j] = 0;                               //清空矩阵

            for(int i = 0; i < likeLists.size(); i++){
                int pid1 = Integer.parseInt(likeLists.get(i).getGoodsId().toString());
                ++N[pid1];              //把当前用户喜欢的商品id放进数组里
                for(int j = i+1; j < likeLists.size(); j++){
                    int pid2 = Integer.parseInt(likeLists.get(j).getGoodsId().toString());
                    ++curMatrix[pid1][pid2];
                    ++curMatrix[pid2][pid1]; //两两加一
                }
            }
            //累加所有矩阵, 得到共现矩阵
            for(int i = 0; i < menuList.size(); i++){
                for(int j = 0; j < menuList.size(); j++){
                    int pid1 = Integer.parseInt(menuList.get(i).getUuid().toString()),
                            pid2 = Integer.parseInt(menuList.get(j).getUuid().toString());
                    comMatrix[pid1][pid2] += curMatrix[pid1][pid2];
                    comMatrix[pid2][pid1] += curMatrix[pid1][pid2];
                }
            }
        }


        TreeSet<MineGoods> preList = new TreeSet<MineGoods>(new Comparator<MineGoods>() {
            @Override
            public int compare(MineGoods o1, MineGoods o2) {
                if(o1.getSimilarity()!=o2.getSimilarity())
                    return (int) (o1.getSimilarity()-o2.getSimilarity())*100;
                else
                    return o1.getCollectCount()-o2.getCollectCount();
            }
        }); //预处理的列表

        MineCollect palmLike = new MineCollect();
        palmLike.setUserId(userId);
        likeLists = collectService.selectMineCollectList(palmLike);//当前用户喜欢的列表
        boolean[] used = new boolean[menuList.size()+6];  //判重数组
        for(MineCollect like: likeLists){
            int Nij = 0;                         //既喜欢i又喜欢j的人数
            double Wij;                          //相似度
            MineGoods tmp;

            int i = Integer.parseInt(like.getGoodsId().toString());
            for(MineGoods paper: menuList){
                if(like.getGoodsId() == paper.getUuid()) continue;
                int j = Integer.parseInt(paper.getUuid().toString());

                Nij = comMatrix[i][j];
                Wij = (double)Nij/Math.sqrt(N[i]*N[j]); //计算余弦相似度


                tmp = goodsService.selectMineGoodsByUuid(paper.getUuid());
                tmp.setSimilarity(Wij);


                if(used[Integer.parseInt(tmp.getUuid().toString())]) continue;
                preList.add(tmp);
                used[Integer.parseInt(tmp.getUuid().toString())] = true;


            }
        }

        List<MineGoods>  recomLists = new ArrayList<>();      //生成的推荐结果

        for(int i = 0; preList.size()>0 && i<6; i++){
            recomLists.add(preList.pollLast());
            preList.pollLast();
        }
        if(recomLists.size()<6){
            //推荐数量不满6个, 补足喜欢数最高的
            MineGoods palmMenu = new MineGoods();
            palmMenu.setTopLike("like");
            palmMenu.setState("10");
            recomLists = goodsService.selectMineGoodsList(palmMenu);
        }
        return recomLists;
    }



}
