package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineCollectMapper;
import com.shoping.project.shop.domain.MineCollect;
import com.shoping.project.shop.service.IMineCollectService;
import com.shoping.common.utils.text.Convert;

/**
 * 商品收藏Service业务层处理
 *
 * @author shoping
 * @date 2021-12-04
 */
@Service
public class MineCollectServiceImpl implements IMineCollectService
{
    @Autowired
    private MineCollectMapper mineCollectMapper;

    /**
     * 查询商品收藏
     *
     * @param uuid 商品收藏主键
     * @return 商品收藏
     */
    @Override
    public MineCollect selectMineCollectByUuid(String uuid)
    {
        return mineCollectMapper.selectMineCollectByUuid(uuid);
    }

    /**
     * 查询商品收藏列表
     *
     * @param mineCollect 商品收藏
     * @return 商品收藏
     */
    @Override
    public List<MineCollect> selectMineCollectList(MineCollect mineCollect)
    {
        return mineCollectMapper.selectMineCollectList(mineCollect);
    }

    /**
     * 新增商品收藏
     *
     * @param mineCollect 商品收藏
     * @return 结果
     */
    @Override
    public int insertMineCollect(MineCollect mineCollect)
    {
        mineCollect.setCreateTime(DateUtils.getNowDate());
        return mineCollectMapper.insertMineCollect(mineCollect);
    }

    /**
     * 修改商品收藏
     *
     * @param mineCollect 商品收藏
     * @return 结果
     */
    @Override
    public int updateMineCollect(MineCollect mineCollect)
    {
        mineCollect.setUpdateTime(DateUtils.getNowDate());
        return mineCollectMapper.updateMineCollect(mineCollect);
    }

    /**
     * 批量删除商品收藏
     *
     * @param uuids 需要删除的商品收藏主键
     * @return 结果
     */
    @Override
    public int deleteMineCollectByUuids(String uuids)
    {
        return mineCollectMapper.deleteMineCollectByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除商品收藏信息
     *
     * @param uuid 商品收藏主键
     * @return 结果
     */
    @Override
    public int deleteMineCollectByUuid( MineCollect collect)
    {
        return mineCollectMapper.deleteMineCollectByUuid(collect);
    }
}
