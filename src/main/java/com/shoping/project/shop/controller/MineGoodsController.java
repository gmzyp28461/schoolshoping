package com.shoping.project.shop.controller;

import java.io.IOException;
import java.util.List;

import com.shoping.common.utils.file.FileUploadUtils;
import com.shoping.common.utils.uuid.IdUtils;
import com.shoping.framework.config.RuoYiConfig;
import com.shoping.project.shop.domain.MineType;
import com.shoping.project.shop.service.IMineTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.shoping.framework.aspectj.lang.annotation.Log;
import com.shoping.framework.aspectj.lang.enums.BusinessType;
import com.shoping.project.shop.domain.MineGoods;
import com.shoping.project.shop.service.IMineGoodsService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 商品Controller
 *
 * @author javac
 * @date 2021-11-11
 */
@Controller
@RequestMapping("/shop/goods")
public class MineGoodsController extends BaseController
{
    private String prefix = "shop/goods";

    @Autowired
    private IMineGoodsService mineGoodsService;


    @Autowired
    private IMineTypeService mineTypeService;

    @RequiresPermissions("shop:goods:view")
    @GetMapping()
    public String goods(ModelMap mmap)
    {
        MineType mineType = new MineType();
        List<MineType>  list = mineTypeService.selectMineTypeList(mineType);
        mmap.put("list",list);
        return prefix + "/goods";
    }

    /**
     * 查询商品列表
     */
    @RequiresPermissions("shop:goods:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineGoods mineGoods)
    {
        startPage();
        List<MineGoods> list = mineGoodsService.selectMineGoodsList(mineGoods);
        return getDataTable(list);
    }

    /**
     * 导出商品列表
     */
    @RequiresPermissions("shop:goods:export")
    @Log(title = "商品", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineGoods mineGoods)
    {
        List<MineGoods> list = mineGoodsService.selectMineGoodsList(mineGoods);
        ExcelUtil<MineGoods> util = new ExcelUtil<MineGoods>(MineGoods.class);
        return util.exportExcel(list, "商品数据");
    }

    /**
     * 新增商品
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {

        MineType mineType = new MineType();
        List<MineType>  list = mineTypeService.selectMineTypeList(mineType);
        mmap.put("list",list);
        return prefix + "/add";
    }

    /**
     * 新增保存商品
     */
    @RequiresPermissions("shop:goods:add")
    @Log(title = "商品", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineGoods mineGoods, @RequestParam("photoFile") MultipartFile file)throws IOException
    {
        if (!file.isEmpty()) {
            String photo = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
            mineGoods.setUrl(photo);
        }
        mineGoods.setCreateBy(getLoginName());
        return toAjax(mineGoodsService.insertMineGoods(mineGoods));
    }

    /**
     * 修改商品
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") Long uuid, ModelMap mmap)
    {
        MineGoods mineGoods = mineGoodsService.selectMineGoodsByUuid(uuid);
        mmap.put("mineGoods", mineGoods);

        MineType mineType = new MineType();
        List<MineType>  list = mineTypeService.selectMineTypeList(mineType);
        mmap.put("list",list);
        return prefix + "/edit";
    }

    /**
     * 修改保存商品
     */
    @RequiresPermissions("shop:goods:edit")
    @Log(title = "商品", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineGoods mineGoods, @RequestParam("photoFile") MultipartFile file) throws IOException {

        if (!file.isEmpty()) {
            String photo = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
            mineGoods.setUrl(photo);
        }
        mineGoods.setUpdateBy(getLoginName());
        return toAjax(mineGoodsService.updateMineGoods(mineGoods));
    }

    /**
     * 删除商品
     */
    @RequiresPermissions("shop:goods:remove")
    @Log(title = "商品", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineGoodsService.deleteMineGoodsByUuids(ids));
    }
}
