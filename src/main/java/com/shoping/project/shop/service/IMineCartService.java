package com.shoping.project.shop.service;

import java.util.List;
import com.shoping.project.shop.domain.MineCart;

/**
 * 购物车Service接口
 *
 * @author javac
 * @date 2021-11-11
 */
public interface IMineCartService
{
    /**
     * 查询购物车
     *
     * @param uuid 购物车主键
     * @return 购物车
     */
    public MineCart selectMineCartByUuid(String uuid);

    /**
     * 查询购物车列表
     *
     * @param mineCart 购物车
     * @return 购物车集合
     */
    public List<MineCart> selectMineCartList(MineCart mineCart);

    /**
     * 新增购物车
     *
     * @param mineCart 购物车
     * @return 结果
     */
    public int insertMineCart(MineCart mineCart);

    /**
     * 修改购物车
     *
     * @param mineCart 购物车
     * @return 结果
     */
    public int updateMineCart(MineCart mineCart);

    /**
     * 批量删除购物车
     *
     * @param uuids 需要删除的购物车主键集合
     * @return 结果
     */
    public int deleteMineCartByUuids(String uuids);

    /**
     * 删除购物车信息
     *
     * @param uuid 购物车主键
     * @return 结果
     */
    public int deleteMineCartByUuid(MineCart cart);
}
