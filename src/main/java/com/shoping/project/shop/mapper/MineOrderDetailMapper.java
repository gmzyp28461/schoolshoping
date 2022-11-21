package com.shoping.project.shop.mapper;

import java.util.List;
import com.shoping.project.shop.domain.MineOrderDetail;

/**
 * 订单详细Mapper接口
 *
 * @author javac
 * @date 2021-11-11
 */
public interface MineOrderDetailMapper
{
    /**
     * 查询订单详细
     *
     * @param uuid 订单详细主键
     * @return 订单详细
     */
    public MineOrderDetail selectMineOrderDetailByUuid(String uuid);

    /**
     * 查询订单详细列表
     *
     * @param mineOrderDetail 订单详细
     * @return 订单详细集合
     */
    public List<MineOrderDetail> selectMineOrderDetailList(MineOrderDetail mineOrderDetail);

    /**
     * 新增订单详细
     *
     * @param mineOrderDetail 订单详细
     * @return 结果
     */
    public int insertMineOrderDetail(MineOrderDetail mineOrderDetail);

    /**
     * 修改订单详细
     *
     * @param mineOrderDetail 订单详细
     * @return 结果
     */
    public int updateMineOrderDetail(MineOrderDetail mineOrderDetail);

    /**
     * 删除订单详细
     *
     * @param uuid 订单详细主键
     * @return 结果
     */
    public int deleteMineOrderDetailByUuid(String uuid);

    /**
     * 批量删除订单详细
     *
     * @param uuids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMineOrderDetailByUuids(String[] uuids);

    public int  batchDetails(List<MineOrderDetail> detailList);
}
