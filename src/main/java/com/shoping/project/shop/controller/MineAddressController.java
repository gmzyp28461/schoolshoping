package com.shoping.project.shop.controller;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shoping.framework.aspectj.lang.annotation.Log;
import com.shoping.framework.aspectj.lang.enums.BusinessType;
import com.shoping.project.shop.domain.MineAddress;
import com.shoping.project.shop.service.IMineAddressService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

/**
 * 订单地址Controller
 *
 * @author javac
 * @date 2021-11-11
 */
@Controller
@RequestMapping("/shop/address")
public class MineAddressController extends BaseController
{
    private String prefix = "shop/address";

    @Autowired
    private IMineAddressService mineAddressService;

    @RequiresPermissions("shop:address:view")
    @GetMapping()
    public String address()
    {
        return prefix + "/address";
    }

    /**
     * 查询订单地址列表
     */
    @RequiresPermissions("shop:address:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineAddress mineAddress)
    {
        startPage();
        List<MineAddress> list = mineAddressService.selectMineAddressList(mineAddress);
        return getDataTable(list);
    }

    /**
     * 导出订单地址列表
     */
    @RequiresPermissions("shop:address:export")
    @Log(title = "订单地址", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineAddress mineAddress)
    {
        List<MineAddress> list = mineAddressService.selectMineAddressList(mineAddress);
        ExcelUtil<MineAddress> util = new ExcelUtil<MineAddress>(MineAddress.class);
        return util.exportExcel(list, "订单地址数据");
    }

    /**
     * 新增订单地址
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单地址
     */
    @RequiresPermissions("shop:address:add")
    @Log(title = "订单地址", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineAddress mineAddress)
    {
        return toAjax(mineAddressService.insertMineAddress(mineAddress));
    }

    /**
     * 修改订单地址
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") String uuid, ModelMap mmap)
    {
        MineAddress mineAddress = mineAddressService.selectMineAddressByUuid(uuid);
        mmap.put("mineAddress", mineAddress);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单地址
     */
    @RequiresPermissions("shop:address:edit")
    @Log(title = "订单地址", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineAddress mineAddress)
    {
        return toAjax(mineAddressService.updateMineAddress(mineAddress));
    }

    /**
     * 删除订单地址
     */
    @RequiresPermissions("shop:address:remove")
    @Log(title = "订单地址", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineAddressService.deleteMineAddressByUuids(ids));
    }
}
