package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineCartMapper;
import com.shoping.project.shop.domain.MineCart;
import com.shoping.project.shop.service.IMineCartService;
import com.shoping.common.utils.text.Convert;

/**
 * 购物车Service业务层处理
 *
 * @author javac
 * @date 2021-11-11
 */
@Service
public class MineCartServiceImpl implements IMineCartService
{
    @Autowired
    private MineCartMapper mineCartMapper;

    /**
     * 查询购物车
     *
     * @param uuid 购物车主键
     * @return 购物车
     */
    @Override
    public MineCart selectMineCartByUuid(String uuid)
    {
        return mineCartMapper.selectMineCartByUuid(uuid);
    }

    /**
     * 查询购物车列表
     *
     * @param mineCart 购物车
     * @return 购物车
     */
    @Override
    public List<MineCart> selectMineCartList(MineCart mineCart)
    {
        return mineCartMapper.selectMineCartList(mineCart);
    }

    /**
     * 新增购物车
     *
     * @param mineCart 购物车
     * @return 结果
     */
    @Override
    public int insertMineCart(MineCart mineCart)
    {
        mineCart.setCreateTime(DateUtils.getNowDate());
        return mineCartMapper.insertMineCart(mineCart);
    }

    /**
     * 修改购物车
     *
     * @param mineCart 购物车
     * @return 结果
     */
    @Override
    public int updateMineCart(MineCart mineCart)
    {
        mineCart.setUpdateTime(DateUtils.getNowDate());
        return mineCartMapper.updateMineCart(mineCart);
    }

    /**
     * 批量删除购物车
     *
     * @param uuids 需要删除的购物车主键
     * @return 结果
     */
    @Override
    public int deleteMineCartByUuids(String uuids)
    {
        return mineCartMapper.deleteMineCartByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除购物车信息
     *
     * @param uuid 购物车主键
     * @return 结果
     */
    @Override
    public int deleteMineCartByUuid(MineCart cart)
    {
        return mineCartMapper.deleteMineCartByUuid(cart);
    }
}
