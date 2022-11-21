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
import com.shoping.project.shop.domain.MineOrderDetail;
import com.shoping.project.shop.service.IMineOrderDetailService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

/**
 * 订单详细Controller
 *
 * @author javac
 * @date 2021-11-11
 */
@Controller
@RequestMapping("/shop/detail")
public class MineOrderDetailController extends BaseController
{
    private String prefix = "shop/detail";

    @Autowired
    private IMineOrderDetailService mineOrderDetailService;

    @RequiresPermissions("shop:detail:view")
    @GetMapping()
    public String detail()
    {
        return prefix + "/detail";
    }

    /**
     * 查询订单详细列表
     */
    @RequiresPermissions("shop:detail:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineOrderDetail mineOrderDetail)
    {
        startPage();
        List<MineOrderDetail> list = mineOrderDetailService.selectMineOrderDetailList(mineOrderDetail);
        return getDataTable(list);
    }

    /**
     * 导出订单详细列表
     */
    @RequiresPermissions("shop:detail:export")
    @Log(title = "订单详细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineOrderDetail mineOrderDetail)
    {
        List<MineOrderDetail> list = mineOrderDetailService.selectMineOrderDetailList(mineOrderDetail);
        ExcelUtil<MineOrderDetail> util = new ExcelUtil<MineOrderDetail>(MineOrderDetail.class);
        return util.exportExcel(list, "订单详细数据");
    }

    /**
     * 新增订单详细
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存订单详细
     */
    @RequiresPermissions("shop:detail:add")
    @Log(title = "订单详细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineOrderDetail mineOrderDetail)
    {
        return toAjax(mineOrderDetailService.insertMineOrderDetail(mineOrderDetail));
    }

    /**
     * 修改订单详细
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") String uuid, ModelMap mmap)
    {
        MineOrderDetail mineOrderDetail = mineOrderDetailService.selectMineOrderDetailByUuid(uuid);
        mmap.put("mineOrderDetail", mineOrderDetail);
        return prefix + "/edit";
    }

    /**
     * 修改保存订单详细
     */
    @RequiresPermissions("shop:detail:edit")
    @Log(title = "订单详细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineOrderDetail mineOrderDetail)
    {
        return toAjax(mineOrderDetailService.updateMineOrderDetail(mineOrderDetail));
    }

    /**
     * 删除订单详细
     */
    @RequiresPermissions("shop:detail:remove")
    @Log(title = "订单详细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineOrderDetailService.deleteMineOrderDetailByUuids(ids));
    }
}
