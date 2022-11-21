package com.shoping.project.shop.controller;

import java.io.IOException;
import java.util.List;

import com.shoping.common.constant.UserConstants;
import com.shoping.common.utils.StringUtils;
import com.shoping.common.utils.file.FileUploadUtils;
import com.shoping.framework.config.RuoYiConfig;
import com.shoping.framework.web.domain.Ztree;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.shoping.framework.aspectj.lang.annotation.Log;
import com.shoping.framework.aspectj.lang.enums.BusinessType;
import com.shoping.project.shop.domain.MineType;
import com.shoping.project.shop.service.IMineTypeService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 分类Controller
 *
 * @author shoping
 * @date 2021-12-04
 */
@Controller
@RequestMapping("/shop/type")
public class MineTypeController extends BaseController
{
    private String prefix = "shop/type";

    @Autowired
    private IMineTypeService mineTypeService;

    @RequiresPermissions("shop:type:view")
    @GetMapping()
    public String type()
    {
        return prefix + "/type";
    }

    /**
     * 查询分类列表
     */
    @RequiresPermissions("shop:type:list")
    @PostMapping("/list")
    @ResponseBody
    public List<MineType> list(MineType mineType)
    {

        List<MineType> list = mineTypeService.selectMineTypeList(mineType);
        return list;
    }

    /**
     * 导出分类列表
     */
    @RequiresPermissions("shop:type:export")
    @Log(title = "分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineType mineType)
    {
        List<MineType> list = mineTypeService.selectMineTypeList(mineType);
        ExcelUtil<MineType> util = new ExcelUtil<MineType>(MineType.class);
        return util.exportExcel(list, "分类数据");
    }

    /**
     * 新增分类
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
    {

        if (!getSysUser().isAdmin())
        {
            parentId = getSysUser().getDeptId();
        }
        MineType mineType = mineTypeService.selectMineTypeByTypeId(parentId);
        if (mineType!=null){
            mmap.put("type", mineType);
        }else{
            MineType type = new MineType();
            type.setTypeId(0l);
            type.setTypeName("父级");
            mmap.put("type", type);
        }

        return prefix + "/add";
    }

    /**
     * 新增保存分类
     */
    @RequiresPermissions("shop:type:add")
    @Log(title = "分类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineType mineType, @RequestParam("photoFile") MultipartFile file)throws IOException
    {

        if (UserConstants.DEPT_NAME_NOT_UNIQUE.equals(mineTypeService.checkTypeNameUnique(mineType)))
        {
            return error("新增类型'" + mineType.getTypeName() + "'失败，类型名称已存在");
        }
        if (!file.isEmpty()) {
            String photo = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
            mineType.setCoverImg(photo);
        }
        return toAjax(mineTypeService.insertMineType(mineType));
    }

    /**
     * 修改分类
     */
    @GetMapping("/edit/{typeId}")
    public String edit(@PathVariable("typeId") Long typeId, ModelMap mmap)
    {
        MineType mineType = mineTypeService.selectMineTypeByTypeId(typeId);
        if (StringUtils.isNotNull(mineType) && 0L == mineType.getParentId())
        {
            mineType.setParentName("无");
        }
        mmap.put("mineType", mineType);
        return prefix + "/edit";
    }

    /**
     * 修改保存分类
     */
    @RequiresPermissions("shop:type:edit")
    @Log(title = "分类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineType mineType, @RequestParam("photoFile") MultipartFile file) throws IOException {

        if (!file.isEmpty()) {
            String photo = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
            mineType.setCoverImg(photo);
        }
        return toAjax(mineTypeService.updateMineType(mineType));
    }

    /**
     * 删除分类
     */
    @RequiresPermissions("shop:type:remove")
    @Log(title = "分类", businessType = BusinessType.DELETE)
    @GetMapping( "/remove/{typeId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable Long typeId)
    {
        return toAjax(mineTypeService.deleteMineTypeByTypeId(typeId));
    }


    /**
     * 校验类型名称
     */
    @PostMapping("/checkTypeNameUnique")
    @ResponseBody
    public String checkTypeNameUnique(MineType mineType)
    {
        return mineTypeService.checkTypeNameUnique(mineType);
    }



    /**
     * 选择部门树
     *
     * @param typeId ID
     * @param excludeId 排除ID
     */
    @GetMapping(value = { "/selectTypeTree/{typeId}", "/selectTypeTree/{typeId}/{excludeId}" })
    public String selectTypeTree(@PathVariable("typeId") Long typeId,
                                 @PathVariable(value = "excludeId", required = false) String excludeId, ModelMap mmap)
    {

        MineType mineType = mineTypeService.selectMineTypeByTypeId(typeId);
        if (mineType!=null){
            mmap.put("type", mineType);
        }else{
            MineType type = new MineType();
            type.setTypeId(0l);
            type.setTypeName("父级");
            mmap.put("type", type);
        }
        mmap.put("excludeId", excludeId);
        return prefix + "/tree";
    }


    /**
     * 加载部门列表树
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        MineType type = new MineType();
        List<Ztree> ztrees = mineTypeService.selectTypeTree(type);
        return ztrees;
    }

    /**
     * 加载部门列表树（排除下级）
     */
    @GetMapping("/treeData/{excludeId}")
    @ResponseBody
    public List<Ztree> treeDataExcludeChild(@PathVariable(value = "excludeId", required = false) Long excludeId)
    {
        MineType type = new MineType();
        type.setExcludeId(excludeId);
        List<Ztree> ztrees = mineTypeService.selectTypeTreeExcludeChild(type);
        return ztrees;
    }
}
