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
import com.shoping.project.shop.domain.MineBalance;
import com.shoping.project.shop.service.IMineBalanceService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

/**
 * 提现明细Controller
 *
 * @author shoping
 * @date 2021-12-11
 */
@Controller
@RequestMapping("/shop/balance")
public class MineBalanceController extends BaseController
{
    private String prefix = "shop/balance";

    @Autowired
    private IMineBalanceService mineBalanceService;

    @RequiresPermissions("shop:balance:view")
    @GetMapping()
    public String balance()
    {
        return prefix + "/balance";
    }

    /**
     * 查询提现明细列表
     */
    @RequiresPermissions("shop:balance:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineBalance mineBalance)
    {
        startPage();
        List<MineBalance> list = mineBalanceService.selectMineBalanceList(mineBalance);
        return getDataTable(list);
    }

    /**
     * 导出提现明细列表
     */
    @RequiresPermissions("shop:balance:export")
    @Log(title = "提现明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineBalance mineBalance)
    {
        List<MineBalance> list = mineBalanceService.selectMineBalanceList(mineBalance);
        ExcelUtil<MineBalance> util = new ExcelUtil<MineBalance>(MineBalance.class);
        return util.exportExcel(list, "提现明细数据");
    }

    /**
     * 新增提现明细
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存提现明细
     */
    @RequiresPermissions("shop:balance:add")
    @Log(title = "提现明细", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineBalance mineBalance)
    {
        return toAjax(mineBalanceService.insertMineBalance(mineBalance));
    }

    /**
     * 修改提现明细
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") Long uuid, ModelMap mmap)
    {
        MineBalance mineBalance = mineBalanceService.selectMineBalanceByUuid(uuid);
        mmap.put("mineBalance", mineBalance);
        return prefix + "/edit";
    }

    /**
     * 修改保存提现明细
     */
    @RequiresPermissions("shop:balance:edit")
    @Log(title = "提现明细", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineBalance mineBalance)
    {
        return toAjax(mineBalanceService.updateMineBalance(mineBalance));
    }

    /**
     * 删除提现明细
     */
    @RequiresPermissions("shop:balance:remove")
    @Log(title = "提现明细", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineBalanceService.deleteMineBalanceByUuids(ids));
    }
}
