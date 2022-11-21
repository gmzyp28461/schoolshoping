package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineOrderDetailMapper;
import com.shoping.project.shop.domain.MineOrderDetail;
import com.shoping.project.shop.service.IMineOrderDetailService;
import com.shoping.common.utils.text.Convert;

/**
 * 订单详细Service业务层处理
 *
 * @author javac
 * @date 2021-11-11
 */
@Service
public class MineOrderDetailServiceImpl implements IMineOrderDetailService
{
    @Autowired
    private MineOrderDetailMapper mineOrderDetailMapper;

    /**
     * 查询订单详细
     *
     * @param uuid 订单详细主键
     * @return 订单详细
     */
    @Override
    public MineOrderDetail selectMineOrderDetailByUuid(String uuid)
    {
        return mineOrderDetailMapper.selectMineOrderDetailByUuid(uuid);
    }

    /**
     * 查询订单详细列表
     *
     * @param mineOrderDetail 订单详细
     * @return 订单详细
     */
    @Override
    public List<MineOrderDetail> selectMineOrderDetailList(MineOrderDetail mineOrderDetail)
    {
        return mineOrderDetailMapper.selectMineOrderDetailList(mineOrderDetail);
    }

    /**
     * 新增订单详细
     *
     * @param mineOrderDetail 订单详细
     * @return 结果
     */
    @Override
    public int insertMineOrderDetail(MineOrderDetail mineOrderDetail)
    {
        mineOrderDetail.setCreateTime(DateUtils.getNowDate());
        return mineOrderDetailMapper.insertMineOrderDetail(mineOrderDetail);
    }

    /**
     * 修改订单详细
     *
     * @param mineOrderDetail 订单详细
     * @return 结果
     */
    @Override
    public int updateMineOrderDetail(MineOrderDetail mineOrderDetail)
    {
        return mineOrderDetailMapper.updateMineOrderDetail(mineOrderDetail);
    }

    /**
     * 批量删除订单详细
     *
     * @param uuids 需要删除的订单详细主键
     * @return 结果
     */
    @Override
    public int deleteMineOrderDetailByUuids(String uuids)
    {
        return mineOrderDetailMapper.deleteMineOrderDetailByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除订单详细信息
     *
     * @param uuid 订单详细主键
     * @return 结果
     */
    @Override
    public int deleteMineOrderDetailByUuid(String uuid)
    {
        return mineOrderDetailMapper.deleteMineOrderDetailByUuid(uuid);
    }
}
