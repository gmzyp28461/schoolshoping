package com.shoping.project.shop.service;

import java.util.List;
import com.shoping.project.shop.domain.MineAddress;

/**
 * 订单地址Service接口
 *
 * @author javac
 * @date 2021-11-11
 */
public interface IMineAddressService
{
    /**
     * 查询订单地址
     *
     * @param uuid 订单地址主键
     * @return 订单地址
     */
    public MineAddress selectMineAddressByUuid(String uuid);

    /**
     * 查询订单地址列表
     *
     * @param mineAddress 订单地址
     * @return 订单地址集合
     */
    public List<MineAddress> selectMineAddressList(MineAddress mineAddress);

    /**
     * 新增订单地址
     *
     * @param mineAddress 订单地址
     * @return 结果
     */
    public int insertMineAddress(MineAddress mineAddress);

    /**
     * 修改订单地址
     *
     * @param mineAddress 订单地址
     * @return 结果
     */
    public int updateMineAddress(MineAddress mineAddress);

    /**
     * 批量删除订单地址
     *
     * @param uuids 需要删除的订单地址主键集合
     * @return 结果
     */
    public int deleteMineAddressByUuids(String uuids);

    /**
     * 删除订单地址信息
     *
     * @param uuid 订单地址主键
     * @return 结果
     */
    public int deleteMineAddressByUuid(String uuid);
}
