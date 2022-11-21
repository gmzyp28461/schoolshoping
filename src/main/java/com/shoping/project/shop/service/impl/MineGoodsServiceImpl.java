package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineGoodsMapper;
import com.shoping.project.shop.domain.MineGoods;
import com.shoping.project.shop.service.IMineGoodsService;
import com.shoping.common.utils.text.Convert;

/**
 * 商品Service业务层处理
 *
 * @author javac
 * @date 2021-11-11
 */
@Service
public class MineGoodsServiceImpl implements IMineGoodsService
{
    @Autowired
    private MineGoodsMapper mineGoodsMapper;

    /**
     * 查询商品
     *
     * @param uuid 商品主键
     * @return 商品
     */
    @Override
    public MineGoods selectMineGoodsByUuid(Long uuid)
    {
        return mineGoodsMapper.selectMineGoodsByUuid(uuid);
    }

    /**
     * 查询商品列表
     *
     * @param mineGoods 商品
     * @return 商品
     */
    @Override
    public List<MineGoods> selectMineGoodsList(MineGoods mineGoods)
    {
        return mineGoodsMapper.selectMineGoodsList(mineGoods);
    }

    /**
     * 新增商品
     *
     * @param mineGoods 商品
     * @return 结果
     */
    @Override
    public int insertMineGoods(MineGoods mineGoods)
    {
        mineGoods.setCreateTime(DateUtils.getNowDate());
        return mineGoodsMapper.insertMineGoods(mineGoods);
    }

    /**
     * 修改商品
     *
     * @param mineGoods 商品
     * @return 结果
     */
    @Override
    public int updateMineGoods(MineGoods mineGoods)
    {
        mineGoods.setUpdateTime(DateUtils.getNowDate());
        return mineGoodsMapper.updateMineGoods(mineGoods);
    }

    /**
     * 批量删除商品
     *
     * @param uuids 需要删除的商品主键
     * @return 结果
     */
    @Override
    public int deleteMineGoodsByUuids(String uuids)
    {
        return mineGoodsMapper.deleteMineGoodsByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除商品信息
     *
     * @param uuid 商品主键
     * @return 结果
     */
    @Override
    public int deleteMineGoodsByUuid(Long uuid)
    {
        return mineGoodsMapper.deleteMineGoodsByUuid(uuid);
    }
}
