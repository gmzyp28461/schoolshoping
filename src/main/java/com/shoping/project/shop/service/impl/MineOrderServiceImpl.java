package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineOrderMapper;
import com.shoping.project.shop.domain.MineOrder;
import com.shoping.project.shop.service.IMineOrderService;
import com.shoping.common.utils.text.Convert;

/**
 * 订单信息Service业务层处理
 *
 * @author javac
 * @date 2021-11-11
 */
@Service
public class MineOrderServiceImpl implements IMineOrderService
{
    @Autowired
    private MineOrderMapper mineOrderMapper;

    /**
     * 查询订单信息
     *
     * @param uuid 订单信息主键
     * @return 订单信息
     */
    @Override
    public MineOrder selectMineOrderByUuid(String uuid)
    {
        return mineOrderMapper.selectMineOrderByUuid(uuid);
    }

    /**
     * 查询订单信息列表
     *
     * @param mineOrder 订单信息
     * @return 订单信息
     */
    @Override
    public List<MineOrder> selectMineOrderList(MineOrder mineOrder)
    {
        return mineOrderMapper.selectMineOrderList(mineOrder);
    }

    /**
     * 新增订单信息
     *
     * @param mineOrder 订单信息
     * @return 结果
     */
    @Override
    public int insertMineOrder(MineOrder mineOrder)
    {
        mineOrder.setCreateTime(DateUtils.getNowDate());
        return mineOrderMapper.insertMineOrder(mineOrder);
    }

    /**
     * 修改订单信息
     *
     * @param mineOrder 订单信息
     * @return 结果
     */
    @Override
    public int updateMineOrder(MineOrder mineOrder)
    {
        mineOrder.setUpdateTime(DateUtils.getNowDate());
        return mineOrderMapper.updateMineOrder(mineOrder);
    }

    /**
     * 批量删除订单信息
     *
     * @param uuids 需要删除的订单信息主键
     * @return 结果
     */
    @Override
    public int deleteMineOrderByUuids(String uuids)
    {
        return mineOrderMapper.deleteMineOrderByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除订单信息信息
     *
     * @param uuid 订单信息主键
     * @return 结果
     */
    @Override
    public int deleteMineOrderByUuid(String uuid)
    {
        return mineOrderMapper.deleteMineOrderByUuid(uuid);
    }
}
