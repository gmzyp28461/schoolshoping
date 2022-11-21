package com.shoping.project.shop.service;

import java.util.List;
import com.shoping.project.shop.domain.MineBanner;

/**
 * 轮播图Service接口
 *
 * @author javac
 * @date 2021-11-11
 */
public interface IMineBannerService
{
    /**
     * 查询轮播图
     *
     * @param uuid 轮播图主键
     * @return 轮播图
     */
    public MineBanner selectMineBannerByUuid(String uuid);

    /**
     * 查询轮播图列表
     *
     * @param mineBanner 轮播图
     * @return 轮播图集合
     */
    public List<MineBanner> selectMineBannerList(MineBanner mineBanner);

    /**
     * 新增轮播图
     *
     * @param mineBanner 轮播图
     * @return 结果
     */
    public int insertMineBanner(MineBanner mineBanner);

    /**
     * 修改轮播图
     *
     * @param mineBanner 轮播图
     * @return 结果
     */
    public int updateMineBanner(MineBanner mineBanner);

    /**
     * 批量删除轮播图
     *
     * @param uuids 需要删除的轮播图主键集合
     * @return 结果
     */
    public int deleteMineBannerByUuids(String uuids);

    /**
     * 删除轮播图信息
     *
     * @param uuid 轮播图主键
     * @return 结果
     */
    public int deleteMineBannerByUuid(String uuid);
}
