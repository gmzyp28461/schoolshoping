package com.shoping.project.shop.controller;

import java.util.List;

import com.shoping.project.system.user.domain.User;
import com.shoping.project.system.user.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shoping.framework.aspectj.lang.annotation.Log;
import com.shoping.framework.aspectj.lang.enums.BusinessType;
import com.shoping.project.shop.domain.MinePartnerApply;
import com.shoping.project.shop.service.IMinePartnerApplyService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

/**
 * 合伙人申请记录Controller
 *
 * @author shoping
 * @date 2021-12-11
 */
@Controller
@RequestMapping("/shop/apply")
public class MinePartnerApplyController extends BaseController
{
    private String prefix = "shop/apply";

    @Autowired
    private IMinePartnerApplyService minePartnerApplyService;


    @Autowired
    private IUserService userService;

    @RequiresPermissions("shop:apply:view")
    @GetMapping()
    public String apply()
    {
        return prefix + "/apply";
    }

    /**
     * 查询合伙人申请记录列表
     */
    @RequiresPermissions("shop:apply:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MinePartnerApply minePartnerApply)
    {
        startPage();
        List<MinePartnerApply> list = minePartnerApplyService.selectMinePartnerApplyList(minePartnerApply);
        return getDataTable(list);
    }

    /**
     * 导出合伙人申请记录列表
     */
    @RequiresPermissions("shop:apply:export")
    @Log(title = "合伙人申请记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MinePartnerApply minePartnerApply)
    {
        List<MinePartnerApply> list = minePartnerApplyService.selectMinePartnerApplyList(minePartnerApply);
        ExcelUtil<MinePartnerApply> util = new ExcelUtil<MinePartnerApply>(MinePartnerApply.class);
        return util.exportExcel(list, "合伙人申请记录数据");
    }

    /**
     * 新增合伙人申请记录
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存合伙人申请记录
     */
    @RequiresPermissions("shop:apply:add")
    @Log(title = "合伙人申请记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MinePartnerApply minePartnerApply)
    {
        return toAjax(minePartnerApplyService.insertMinePartnerApply(minePartnerApply));
    }

    /**
     * 修改合伙人申请记录
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") Integer uuid, ModelMap mmap)
    {
        MinePartnerApply minePartnerApply = minePartnerApplyService.selectMinePartnerApplyByUuid(uuid);
        mmap.put("minePartnerApply", minePartnerApply);
        return prefix + "/edit";
    }

    /**
     * 修改保存合伙人申请记录
     */
    @RequiresPermissions("shop:apply:edit")
    @Log(title = "合伙人申请记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    @Transactional
    public AjaxResult editSave(MinePartnerApply minePartnerApply)
    {

        User user  = new User();
        user.setUserId(minePartnerApply.getUserId());
        if (minePartnerApply.getStatus().equals("20")){
            user.setUserType("02");
        }else{
            user.setUserType("01");
        }
        userService.updateUserInfo(user);
        return toAjax(minePartnerApplyService.updateMinePartnerApply(minePartnerApply));
    }

    /**
     * 删除合伙人申请记录
     */
    @RequiresPermissions("shop:apply:remove")
    @Log(title = "合伙人申请记录", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(minePartnerApplyService.deleteMinePartnerApplyByUuids(ids));
    }
}
