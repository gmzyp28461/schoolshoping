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
import com.shoping.project.shop.domain.MineComment;
import com.shoping.project.shop.service.IMineCommentService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

/**
 * 评论Controller
 *
 * @author shoping
 * @date 2021-12-04
 */
@Controller
@RequestMapping("/shop/comment")
public class MineCommentController extends BaseController
{
    private String prefix = "shop/comment";

    @Autowired
    private IMineCommentService mineCommentService;

    @RequiresPermissions("shop:comment:view")
    @GetMapping()
    public String comment()
    {
        return prefix + "/comment";
    }

    /**
     * 查询评论列表
     */
    @RequiresPermissions("shop:comment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineComment mineComment)
    {
        startPage();
        List<MineComment> list = mineCommentService.selectMineCommentList(mineComment);
        return getDataTable(list);
    }

    /**
     * 导出评论列表
     */
    @RequiresPermissions("shop:comment:export")
    @Log(title = "评论", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineComment mineComment)
    {
        List<MineComment> list = mineCommentService.selectMineCommentList(mineComment);
        ExcelUtil<MineComment> util = new ExcelUtil<MineComment>(MineComment.class);
        return util.exportExcel(list, "评论数据");
    }

    /**
     * 新增评论
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存评论
     */
    @RequiresPermissions("shop:comment:add")
    @Log(title = "评论", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineComment mineComment)
    {
        return toAjax(mineCommentService.insertMineComment(mineComment));
    }

    /**
     * 修改评论
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") Long uuid, ModelMap mmap)
    {
        MineComment mineComment = mineCommentService.selectMineCommentByUuid(uuid);
        mmap.put("mineComment", mineComment);
        return prefix + "/edit";
    }

    /**
     * 修改保存评论
     */
    @RequiresPermissions("shop:comment:edit")
    @Log(title = "评论", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineComment mineComment)
    {
        return toAjax(mineCommentService.updateMineComment(mineComment));
    }

    /**
     * 删除评论
     */
    @RequiresPermissions("shop:comment:remove")
    @Log(title = "评论", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineCommentService.deleteMineCommentByUuids(ids));
    }
}
