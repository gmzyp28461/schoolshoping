package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineAddressMapper;
import com.shoping.project.shop.domain.MineAddress;
import com.shoping.project.shop.service.IMineAddressService;
import com.shoping.common.utils.text.Convert;

/**
 * 订单地址Service业务层处理
 *
 * @author javac
 * @date 2021-11-11
 */
@Service
public class MineAddressServiceImpl implements IMineAddressService
{
    @Autowired
    private MineAddressMapper mineAddressMapper;

    /**
     * 查询订单地址
     *
     * @param uuid 订单地址主键
     * @return 订单地址
     */
    @Override
    public MineAddress selectMineAddressByUuid(String uuid)
    {
        return mineAddressMapper.selectMineAddressByUuid(uuid);
    }

    /**
     * 查询订单地址列表
     *
     * @param mineAddress 订单地址
     * @return 订单地址
     */
    @Override
    public List<MineAddress> selectMineAddressList(MineAddress mineAddress)
    {
        return mineAddressMapper.selectMineAddressList(mineAddress);
    }

    /**
     * 新增订单地址
     *
     * @param mineAddress 订单地址
     * @return 结果
     */
    @Override
    public int insertMineAddress(MineAddress mineAddress)
    {
        mineAddress.setCreateTime(DateUtils.getNowDate());
        return mineAddressMapper.insertMineAddress(mineAddress);
    }

    /**
     * 修改订单地址
     *
     * @param mineAddress 订单地址
     * @return 结果
     */
    @Override
    public int updateMineAddress(MineAddress mineAddress)
    {
        return mineAddressMapper.updateMineAddress(mineAddress);
    }

    /**
     * 批量删除订单地址
     *
     * @param uuids 需要删除的订单地址主键
     * @return 结果
     */
    @Override
    public int deleteMineAddressByUuids(String uuids)
    {
        return mineAddressMapper.deleteMineAddressByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除订单地址信息
     *
     * @param uuid 订单地址主键
     * @return 结果
     */
    @Override
    public int deleteMineAddressByUuid(String uuid)
    {
        return mineAddressMapper.deleteMineAddressByUuid(uuid);
    }
}
