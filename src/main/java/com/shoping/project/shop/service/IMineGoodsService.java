package com.shoping.project.shop.service;

import java.util.List;
import com.shoping.project.shop.domain.MineGoods;

/**
 * 商品Service接口
 *
 * @author javac
 * @date 2021-11-11
 */
public interface IMineGoodsService
{
    /**
     * 查询商品
     *
     * @param uuid 商品主键
     * @return 商品
     */
    public MineGoods selectMineGoodsByUuid(Long uuid);

    /**
     * 查询商品列表
     *
     * @param mineGoods 商品
     * @return 商品集合
     */
    public List<MineGoods> selectMineGoodsList(MineGoods mineGoods);

    /**
     * 新增商品
     *
     * @param mineGoods 商品
     * @return 结果
     */
    public int insertMineGoods(MineGoods mineGoods);

    /**
     * 修改商品
     *
     * @param mineGoods 商品
     * @return 结果
     */
    public int updateMineGoods(MineGoods mineGoods);

    /**
     * 批量删除商品
     *
     * @param uuids 需要删除的商品主键集合
     * @return 结果
     */
    public int deleteMineGoodsByUuids(String uuids);

    /**
     * 删除商品信息
     *
     * @param uuid 商品主键
     * @return 结果
     */
    public int deleteMineGoodsByUuid(Long uuid);
}
