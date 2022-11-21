package com.shoping.project.shop.mapper;

import java.util.List;
import com.shoping.project.shop.domain.MineCart;

/**
 * 购物车Mapper接口
 *
 * @author javac
 * @date 2021-11-11
 */
public interface MineCartMapper
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
     * 删除购物车
     *
     * @param uuid 购物车主键
     * @return 结果
     */
    public int deleteMineCartByUuid(MineCart cart);

    /**
     * 批量删除购物车
     *
     * @param uuids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMineCartByUuids(String[] uuids);
}
