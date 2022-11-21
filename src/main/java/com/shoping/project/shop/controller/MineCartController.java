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
import com.shoping.project.shop.domain.MineCart;
import com.shoping.project.shop.service.IMineCartService;
import com.shoping.framework.web.controller.BaseController;
import com.shoping.framework.web.domain.AjaxResult;
import com.shoping.common.utils.poi.ExcelUtil;
import com.shoping.framework.web.page.TableDataInfo;

/**
 * 购物车Controller
 *
 * @author javac
 * @date 2021-11-11
 */
@Controller
@RequestMapping("/shop/cart")
public class MineCartController extends BaseController
{
    private String prefix = "shop/cart";

    @Autowired
    private IMineCartService mineCartService;

    @RequiresPermissions("shop:cart:view")
    @GetMapping()
    public String cart()
    {
        return prefix + "/cart";
    }

    /**
     * 查询购物车列表
     */
    @RequiresPermissions("shop:cart:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(MineCart mineCart)
    {
        startPage();
        List<MineCart> list = mineCartService.selectMineCartList(mineCart);
        return getDataTable(list);
    }

    /**
     * 导出购物车列表
     */
    @RequiresPermissions("shop:cart:export")
    @Log(title = "购物车", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(MineCart mineCart)
    {
        List<MineCart> list = mineCartService.selectMineCartList(mineCart);
        ExcelUtil<MineCart> util = new ExcelUtil<MineCart>(MineCart.class);
        return util.exportExcel(list, "购物车数据");
    }

    /**
     * 新增购物车
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存购物车
     */
    @RequiresPermissions("shop:cart:add")
    @Log(title = "购物车", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(MineCart mineCart)
    {
        return toAjax(mineCartService.insertMineCart(mineCart));
    }

    /**
     * 修改购物车
     */
    @GetMapping("/edit/{uuid}")
    public String edit(@PathVariable("uuid") String uuid, ModelMap mmap)
    {
        MineCart mineCart = mineCartService.selectMineCartByUuid(uuid);
        mmap.put("mineCart", mineCart);
        return prefix + "/edit";
    }

    /**
     * 修改保存购物车
     */
    @RequiresPermissions("shop:cart:edit")
    @Log(title = "购物车", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(MineCart mineCart)
    {
        return toAjax(mineCartService.updateMineCart(mineCart));
    }

    /**
     * 删除购物车
     */
    @RequiresPermissions("shop:cart:remove")
    @Log(title = "购物车", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(mineCartService.deleteMineCartByUuids(ids));
    }
}
