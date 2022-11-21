package com.shoping.project.shop.mapper;

import java.util.List;
import com.shoping.project.shop.domain.MineType;
import org.apache.ibatis.annotations.Param;

/**
 * 分类Mapper接口
 *
 * @author shoping
 * @date 2021-12-04
 */
public interface MineTypeMapper
{
    /**
     * 查询分类
     *
     * @param typeId 分类主键
     * @return 分类
     */
    public MineType selectMineTypeByTypeId(Long typeId);

    /**
     * 查询分类列表
     *
     * @param mineType 分类
     * @return 分类集合
     */
    public List<MineType> selectMineTypeList(MineType mineType);

    /**
     * 新增分类
     *
     * @param mineType 分类
     * @return 结果
     */
    public int insertMineType(MineType mineType);

    /**
     * 修改分类
     *
     * @param mineType 分类
     * @return 结果
     */
    public int updateMineType(MineType mineType);

    /**
     * 删除分类
     *
     * @param typeId 分类主键
     * @return 结果
     */
    public int deleteMineTypeByTypeId(Long typeId);

    /**
     * 批量删除分类
     *
     * @param typeIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMineTypeByTypeIds(String[] typeIds);

    public MineType checkTypeNameUnique(@Param("typeName") String typeName, @Param("parentId") Long parentId);

    public int selectTypeCount(MineType mineType);
}
