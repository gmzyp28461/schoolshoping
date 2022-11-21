package com.shoping.project.shop.controller;

import java.io.IOException;
import java.util.List;

import com.shoping.common.utils.file.FileUploadUtils;
import com.shoping.common.utils.uuid.IdUtils;
import com.shoping.framework.config.RuoYiConfig;
import com.shoping.project.shop.domain.MineGoods;
import com.shoping.project.shop.service.IMineGoodsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import com.shoping.framework.aspectj.lang.annotation.Log;
import com.shoping.framework.aspectj.lang.enums.BusinessType;
import com.shoping.project.shop.domain.MineBanner;
import com.shoping.project.shop.service.IMineBannerService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 轮播图Controller
 *
 * @author javac
 * @date 2021-11-11
 */
@Controller
@RequestMapping("/shop/banner")
public class MineBannerController extends BaseController
{
    private String prefix = "shop/banner";

    @Autowired
    private IMineBannerService mineBannerService;

    @Autowired
    private IMineGoodsService mineGoodsService;

    @RequiresPermissions("shop:banner:view")
    @GetMapping()
    public String banner()
    {
        return prefix + "/banner";
    }

    /**
     * 查询轮播图列表
     */
    @RequiresPermissions("shop:banner:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineBanner mineBanner)
    {
        startPage();
        List<MineBanner> list = mineBannerService.selectMineBannerList(mineBanner);
        if (list!=null&&list.size()>0) {
            for (MineBanner banner : list) {
                banner.setGoods(mineGoodsService.selectMineGoodsByUuid(banner.getGoodsId()));
            }
        }
        return getDataTable(list);
    }

    /**
     * 导出轮播图列表
     */
    @RequiresPermissions("shop:banner:export")
    @Log(title = "轮播图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineBanner mineBanner)
    {
        List<MineBanner> list = mineBannerService.selectMineBannerList(mineBanner);
        ExcelUtil<MineBanner> util = new ExcelUtil<MineBanner>(MineBanner.class);
        return util.exportExcel(list, "轮播图数据");
    }

    /**
     * 新增轮播图
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
        MineGoods goods = new MineGoods();
        goods.setState("10");
        List<MineGoods>  list = mineGoodsService.selectMineGoodsList(goods);
        mmap.put("list", list);
        return prefix + "/add";
    }

    /**
     * 新增保存轮播图
     */
    @RequiresPermissions("shop:banner:add")
    @Log(title = "轮播图", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineBanner mineBanner, @RequestParam("photoFile") MultipartFile file)throws IOException
    {
        if (!file.isEmpty()) {
            String photo = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
            mineBanner.setUrl(photo);
        }
        mineBanner.setCreateBy(getLoginName());
        return toAjax(mineBannerService.insertMineBanner(mineBanner));
    }

    /**
     * 修改轮播图
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") String uuid, ModelMap mmap)
    {
        MineBanner mineBanner = mineBannerService.selectMineBannerByUuid(uuid);
        mmap.put("mineBanner", mineBanner);


        MineGoods goods = new MineGoods();
        goods.setState("10");
        List<MineGoods>  list = mineGoodsService.selectMineGoodsList(goods);
        mmap.put("list", list);

        return prefix + "/edit";
    }

    /**
     * 修改保存轮播图
     */
    @RequiresPermissions("shop:banner:edit")
    @Log(title = "轮播图", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineBanner mineBanner, @RequestParam("photoFile") MultipartFile file) throws IOException {

        if (!file.isEmpty()) {
            String photo = FileUploadUtils.upload(RuoYiConfig.getUploadPath(), file);
            mineBanner.setUrl(photo);
        }
        mineBanner.setUpdateBy(getLoginName());
        return toAjax(mineBannerService.updateMineBanner(mineBanner));
    }

    /**
     * 删除轮播图
     */
    @RequiresPermissions("shop:banner:remove")
    @Log(title = "轮播图", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineBannerService.deleteMineBannerByUuids(ids));
    }
}
