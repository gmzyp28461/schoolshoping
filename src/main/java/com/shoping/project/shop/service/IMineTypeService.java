package com.shoping.project.shop.service;

import java.util.List;

import com.shoping.framework.web.domain.Ztree;
import com.shoping.project.shop.domain.MineType;

/**
 * 分类Service接口
 *
 * @author shoping
 * @date 2021-12-04
 */
public interface IMineTypeService
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
     * 批量删除分类
     *
     * @param typeIds 需要删除的分类主键集合
     * @return 结果
     */
    public int deleteMineTypeByTypeIds(String typeIds);

    /**
     * 删除分类信息
     *
     * @param typeId 分类主键
     * @return 结果
     */
    public int deleteMineTypeByTypeId(Long typeId);


    public String checkTypeNameUnique(MineType mineType);

    public int selectTypeCount(Long parentId);

    public List<Ztree> selectTypeTree(MineType mineType);

    public List<Ztree> selectTypeTreeExcludeChild(MineType mineType);
}
