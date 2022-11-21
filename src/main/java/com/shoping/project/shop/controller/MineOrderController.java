package com.shoping.project.shop.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.shoping.api.v1.pay.AppPayService;
import com.shoping.api.v1.pay.WxPayConfig;
import com.shoping.common.utils.uuid.IdUtils;
import io.swagger.annotations.Api;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shoping.framework.aspectj.lang.annotation.Log;
import com.shoping.framework.aspectj.lang.enums.BusinessType;
import com.shoping.project.shop.domain.MineOrder;
import com.shoping.project.shop.service.IMineOrderService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 订单信息Controller
 *
 * @author javac
 * @date 2021-11-11
 */
@Controller
@RequestMapping("/shop/order")
public class MineOrderController extends BaseController
{
    private String prefix = "shop/order";


    @Autowired
    private AppPayService payService;

    @Autowired
    private IMineOrderService mineOrderService;


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

    @RequiresPermissions("shop:order:view")
    @GetMapping("/{payStatus}")
    public String order(@PathVariable String payStatus, ModelMap mmap)
    {
        mmap.put("payStatus",payStatus);
        return prefix + "/order";
    }

    /**
     * 查询订单信息列表
     */
    @RequiresPermissions("shop:order:list")
    @PostMapping("/list{uuid}")
    @ResponseBody
    public TableDataInfo list(MineOrder mineOrder){
        mineOrder.setOrderCodeType("1");
        startPage();
        List<MineOrder> list = mineOrderService.selectMineOrderList(mineOrder);
        return getDataTable(list);
    }

//    @RequiresPermissions("shop:order:list")
//    @PostMapping("/list")
//    @ResponseBody
//    public TableDataInfo list(MineOrder mineOrder)
//    {
//        mineOrder.setOrderCodeType("1");
//        startPage();
//        List<MineOrder> list = mineOrderService.selectMineOrderList(mineOrder);
//        return getDataTable(list);
//    }

    /**
     * 导出订单信息列表
     */
    @RequiresPermissions("shop:order:export")
    @Log(title = "订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineOrder mineOrder)
    {
        List<MineOrder> list = mineOrderService.selectMineOrderList(mineOrder);
        ExcelUtil<MineOrder> util = new ExcelUtil<MineOrder>(MineOrder.class);
        return util.exportExcel(list, "订单信息数据");
    }

    /**
     * 新增订单信息
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单信息
     */
    @RequiresPermissions("shop:order:add")
    @Log(title = "订单信息", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineOrder mineOrder)
    {
        mineOrder.setUuid(IdUtils.simpleUUID());
        mineOrder.setCreateBy(getLoginName());
        return toAjax(mineOrderService.insertMineOrder(mineOrder));
    }

    /**
     * 修改订单信息
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") String uuid, ModelMap mmap)
    {
        MineOrder mineOrder = mineOrderService.selectMineOrderByUuid(uuid);
        mmap.put("mineOrder", mineOrder);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单信息
     */
    @RequiresPermissions("shop:order:edit")
    @Log(title = "订单信息", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineOrder mineOrder)
    {
        mineOrder.setDeliveryDate(new Date());
        return toAjax(mineOrderService.updateMineOrder(mineOrder));
    }

    /**
     * 删除订单信息
     */
    @RequiresPermissions("shop:order:remove")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineOrderService.deleteMineOrderByUuids(ids));
    }


    @GetMapping("/goRefunds/{uuid}")
    public String goRefunds(@PathVariable("uuid") String uuid, ModelMap mmap)
    {
        MineOrder mineOrder = mineOrderService.selectMineOrderByUuid(uuid);
        mmap.put("mineOrder", mineOrder);
        mmap.put("price", mineOrder.getPrice().divide(new BigDecimal("100")));
        return prefix + "/refunds";
    }

    @RequiresPermissions("shop:order:refunds")
    @PostMapping("/refunds{uuid}")
    @Log(title = "售后", businessType = BusinessType.UPDATE)
    @ResponseBody
    public  AjaxResult refunds(HttpServletRequest request,HttpServletResponse response,@PathVariable String uuid, BigDecimal price)
        throws Exception{
        WxPayConfig conf = wxPayConfig();
        MineOrder mineOrder = mineOrderService.selectMineOrderByUuid(uuid);
        int result = payService.refunds(mineOrder,conf,price);
        return toAjax(result);
    }


//    @RequiresPermissions("shop:order:refunds")
//    @PostMapping("/refunds/{uuid}")
//    @Log(title = "订单退款", businessType = BusinessType.UPDATE)
//    @ResponseBody
//    public AjaxResult refunds(HttpServletRequest request, HttpServletResponse response, @PathVariable String uuid, BigDecimal price) throws Exception {
//
//        WxPayConfig config = wxPayConfig();
//        MineOrder mineOrder = mineOrderService.selectMineOrderByUuid(uuid);
//
//        int result = payService.refunds(mineOrder,config,price);
//
//        return toAjax(result);
//    }
}
