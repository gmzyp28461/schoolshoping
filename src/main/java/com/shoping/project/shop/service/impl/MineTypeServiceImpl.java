package com.shoping.project.shop.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.shoping.common.constant.UserConstants;
import com.shoping.common.exception.ServiceException;
import com.shoping.common.utils.DateUtils;
import com.shoping.common.utils.StringUtils;
import com.shoping.framework.web.domain.Ztree;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineTypeMapper;
import com.shoping.project.shop.domain.MineType;
import com.shoping.project.shop.service.IMineTypeService;
import com.shoping.common.utils.text.Convert;

/**
 * 分类Service业务层处理
 *
 * @author shoping
 * @date 2021-12-04
 */
@Service
public class MineTypeServiceImpl implements IMineTypeService
{
    @Autowired
    private MineTypeMapper mineTypeMapper;

    /**
     * 查询分类
     *
     * @param typeId 分类主键
     * @return 分类
     */
    @Override
    public MineType selectMineTypeByTypeId(Long typeId)
    {
        return mineTypeMapper.selectMineTypeByTypeId(typeId);
    }

    /**
     * 查询分类列表
     *
     * @param mineType 分类
     * @return 分类
     */
    @Override
    public List<MineType> selectMineTypeList(MineType mineType)
    {
        return mineTypeMapper.selectMineTypeList(mineType);
    }

    /**
     * 新增分类
     *
     * @param mineType 分类
     * @return 结果
     */
    @Override
    public int insertMineType(MineType mineType)
    {
        MineType info = mineTypeMapper.selectMineTypeByTypeId(mineType.getParentId());
        // 如果父节点不为"正常"状态,则不允许新增子节点
        if(info!=null){
            if (!UserConstants.DEPT_NORMAL.equals(info.getStatus()))
            {
                throw new ServiceException("类型停用，不允许新增");
            }
            mineType.setAncestors(info.getAncestors() + "," + mineType.getParentId());
        }else{
            mineType.setAncestors(mineType.getParentId().toString());
        }

        mineType.setCreateTime(DateUtils.getNowDate());
        return mineTypeMapper.insertMineType(mineType);
    }

    /**
     * 修改分类
     *
     * @param mineType 分类
     * @return 结果
     */
    @Override
    public int updateMineType(MineType mineType)
    {
        mineType.setUpdateTime(DateUtils.getNowDate());
        return mineTypeMapper.updateMineType(mineType);
    }

    /**
     * 批量删除分类
     *
     * @param typeIds 需要删除的分类主键
     * @return 结果
     */
    @Override
    public int deleteMineTypeByTypeIds(String typeIds)
    {
        return mineTypeMapper.deleteMineTypeByTypeIds(Convert.toStrArray(typeIds));
    }

    /**
     * 删除分类信息
     *
     * @param typeId 分类主键
     * @return 结果
     */
    @Override
    public int deleteMineTypeByTypeId(Long typeId)
    {
        return mineTypeMapper.deleteMineTypeByTypeId(typeId);
    }

    @Override
    public String checkTypeNameUnique(MineType mineType) {
        Long typeId = StringUtils.isNull(mineType.getTypeId()) ? -1L : mineType.getTypeId();
        MineType info = mineTypeMapper.checkTypeNameUnique(mineType.getTypeName(), mineType.getParentId());
        if (StringUtils.isNotNull(info) && info.getTypeId().longValue() != typeId.longValue())
        {
            return UserConstants.DEPT_NAME_NOT_UNIQUE;
        }
        return UserConstants.DEPT_NAME_UNIQUE;
    }

    @Override
    public int selectTypeCount(Long parentId)
    {
        MineType mineType = new MineType();
        mineType.setParentId(parentId);
        return mineTypeMapper.selectTypeCount(mineType);
    }

    @Override
    public List<Ztree> selectTypeTree(MineType mineType)
    {
        List<MineType> typeList = mineTypeMapper.selectMineTypeList(mineType);
        List<Ztree> ztrees = initZtree(typeList);
        return ztrees;
    }

    public List<Ztree> initZtree(List<MineType> typeList)
    {

        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (MineType type : typeList)
        {
            if (UserConstants.DEPT_NORMAL.equals(type.getStatus()))
            {
                Ztree ztree = new Ztree();
                ztree.setId(type.getTypeId());
                ztree.setpId(type.getParentId());
                ztree.setName(type.getTypeName());
                ztree.setTitle(type.getTypeName());
                ztrees.add(ztree);
            }
        }
        return ztrees;
    }


    @Override
    public List<Ztree> selectTypeTreeExcludeChild(MineType mineType)
    {
        Long excludeId = mineType.getExcludeId();
        List<MineType> typeList = mineTypeMapper.selectMineTypeList(mineType);
        Iterator<MineType> it = typeList.iterator();
        while (it.hasNext())
        {
            MineType d = (MineType) it.next();
            if (d.getTypeId().intValue() == excludeId
                    || ArrayUtils.contains(StringUtils.split(d.getAncestors(), ","), excludeId + ""))
            {
                it.remove();
            }
        }
        List<Ztree> ztrees = initZtree(typeList);
        return ztrees;
    }
}
