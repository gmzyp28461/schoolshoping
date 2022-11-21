package com.shoping.project.shop.mapper;

import java.util.List;
import com.shoping.project.shop.domain.MineOrder;

/**
 * 订单信息Mapper接口
 *
 * @author javac
 * @date 2021-11-11
 */
public interface MineOrderMapper
{
    /**
     * 查询订单信息
     *
     * @param uuid 订单信息主键
     * @return 订单信息
     */
    public MineOrder selectMineOrderByUuid(String uuid);

    /**
     * 查询订单信息列表
     *
     * @param mineOrder 订单信息
     * @return 订单信息集合
     */
    public List<MineOrder> selectMineOrderList(MineOrder mineOrder);

    /**
     * 新增订单信息
     *
     * @param mineOrder 订单信息
     * @return 结果
     */
    public int insertMineOrder(MineOrder mineOrder);

    /**
     * 修改订单信息
     *
     * @param mineOrder 订单信息
     * @return 结果
     */
    public int updateMineOrder(MineOrder mineOrder);

    /**
     * 删除订单信息
     *
     * @param uuid 订单信息主键
     * @return 结果
     */
    public int deleteMineOrderByUuid(String uuid);

    /**
     * 批量删除订单信息
     *
     * @param uuids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMineOrderByUuids(String[] uuids);
}
