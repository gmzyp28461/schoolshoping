package com.shoping.project.shop.mapper;

import java.util.List;
import com.shoping.project.shop.domain.MineCollect;

/**
 * 商品收藏Mapper接口
 *
 * @author shoping
 * @date 2021-12-04
 */
public interface MineCollectMapper
{
    /**
     * 查询商品收藏
     *
     * @param uuid 商品收藏主键
     * @return 商品收藏
     */
    public MineCollect selectMineCollectByUuid(String uuid);

    /**
     * 查询商品收藏列表
     *
     * @param mineCollect 商品收藏
     * @return 商品收藏集合
     */
    public List<MineCollect> selectMineCollectList(MineCollect mineCollect);

    /**
     * 新增商品收藏
     *
     * @param mineCollect 商品收藏
     * @return 结果
     */
    public int insertMineCollect(MineCollect mineCollect);

    /**
     * 修改商品收藏
     *
     * @param mineCollect 商品收藏
     * @return 结果
     */
    public int updateMineCollect(MineCollect mineCollect);

    /**
     * 删除商品收藏
     *
     * @param uuid 商品收藏主键
     * @return 结果
     */
    public int deleteMineCollectByUuid(MineCollect collect);

    /**
     * 批量删除商品收藏
     *
     * @param uuids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMineCollectByUuids(String[] uuids);
}
