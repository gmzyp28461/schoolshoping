package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineBannerMapper;
import com.shoping.project.shop.domain.MineBanner;
import com.shoping.project.shop.service.IMineBannerService;
import com.shoping.common.utils.text.Convert;

/**
 * 轮播图Service业务层处理
 *
 * @author javac
 * @date 2021-11-11
 */
@Service
public class MineBannerServiceImpl implements IMineBannerService
{
    @Autowired
    private MineBannerMapper mineBannerMapper;

    /**
     * 查询轮播图
     *
     * @param uuid 轮播图主键
     * @return 轮播图
     */
    @Override
    public MineBanner selectMineBannerByUuid(String uuid)
    {
        return mineBannerMapper.selectMineBannerByUuid(uuid);
    }

    /**
     * 查询轮播图列表
     *
     * @param mineBanner 轮播图
     * @return 轮播图
     */
    @Override
    public List<MineBanner> selectMineBannerList(MineBanner mineBanner)
    {
        return mineBannerMapper.selectMineBannerList(mineBanner);
    }

    /**
     * 新增轮播图
     *
     * @param mineBanner 轮播图
     * @return 结果
     */
    @Override
    public int insertMineBanner(MineBanner mineBanner)
    {
        mineBanner.setCreateTime(DateUtils.getNowDate());
        return mineBannerMapper.insertMineBanner(mineBanner);
    }

    /**
     * 修改轮播图
     *
     * @param mineBanner 轮播图
     * @return 结果
     */
    @Override
    public int updateMineBanner(MineBanner mineBanner)
    {
        mineBanner.setUpdateTime(DateUtils.getNowDate());
        return mineBannerMapper.updateMineBanner(mineBanner);
    }

    /**
     * 批量删除轮播图
     *
     * @param uuids 需要删除的轮播图主键
     * @return 结果
     */
    @Override
    public int deleteMineBannerByUuids(String uuids)
    {
        return mineBannerMapper.deleteMineBannerByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除轮播图信息
     *
     * @param uuid 轮播图主键
     * @return 结果
     */
    @Override
    public int deleteMineBannerByUuid(String uuid)
    {
        return mineBannerMapper.deleteMineBannerByUuid(uuid);
    }
}
