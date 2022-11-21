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
import com.shoping.project.shop.domain.MineCollect;
import com.shoping.project.shop.service.IMineCollectService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

/**
 * 商品收藏Controller
 *
 * @author shoping
 * @date 2021-12-04
 */
@Controller
@RequestMapping("/shop/collect")
public class MineCollectController extends BaseController
{
    private String prefix = "shop/collect";

    @Autowired
    private IMineCollectService mineCollectService;

    @RequiresPermissions("shop:collect:view")
    @GetMapping()
    public String collect()
    {
        return prefix + "/collect";
    }

    /**
     * 查询商品收藏列表
     */
    @RequiresPermissions("shop:collect:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineCollect mineCollect)
    {
        startPage();
        List<MineCollect> list = mineCollectService.selectMineCollectList(mineCollect);
        return getDataTable(list);
    }

    /**
     * 导出商品收藏列表
     */
    @RequiresPermissions("shop:collect:export")
    @Log(title = "商品收藏", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineCollect mineCollect)
    {
        List<MineCollect> list = mineCollectService.selectMineCollectList(mineCollect);
        ExcelUtil<MineCollect> util = new ExcelUtil<MineCollect>(MineCollect.class);
        return util.exportExcel(list, "商品收藏数据");
    }

    /**
     * 新增商品收藏
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存商品收藏
     */
    @RequiresPermissions("shop:collect:add")
    @Log(title = "商品收藏", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineCollect mineCollect)
    {
        return toAjax(mineCollectService.insertMineCollect(mineCollect));
    }

    /**
     * 修改商品收藏
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") String uuid, ModelMap mmap)
    {
        MineCollect mineCollect = mineCollectService.selectMineCollectByUuid(uuid);
        mmap.put("mineCollect", mineCollect);
        return prefix + "/edit";
    }

    /**
     * 修改保存商品收藏
     */
    @RequiresPermissions("shop:collect:edit")
    @Log(title = "商品收藏", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineCollect mineCollect)
    {
        return toAjax(mineCollectService.updateMineCollect(mineCollect));
    }

    /**
     * 删除商品收藏
     */
    @RequiresPermissions("shop:collect:remove")
    @Log(title = "商品收藏", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineCollectService.deleteMineCollectByUuids(ids));
    }
}
