package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MinePartnerApplyMapper;
import com.shoping.project.shop.domain.MinePartnerApply;
import com.shoping.project.shop.service.IMinePartnerApplyService;
import com.shoping.common.utils.text.Convert;

/**
 * 合伙人申请记录Service业务层处理
 *
 * @author shoping
 * @date 2021-12-11
 */
@Service
public class MinePartnerApplyServiceImpl implements IMinePartnerApplyService
{
    @Autowired
    private MinePartnerApplyMapper minePartnerApplyMapper;

    /**
     * 查询合伙人申请记录
     *
     * @param uuid 合伙人申请记录主键
     * @return 合伙人申请记录
     */
    @Override
    public MinePartnerApply selectMinePartnerApplyByUuid(Integer uuid)
    {
        return minePartnerApplyMapper.selectMinePartnerApplyByUuid(uuid);
    }

    /**
     * 查询合伙人申请记录列表
     *
     * @param minePartnerApply 合伙人申请记录
     * @return 合伙人申请记录
     */
    @Override
    public List<MinePartnerApply> selectMinePartnerApplyList(MinePartnerApply minePartnerApply)
    {
        return minePartnerApplyMapper.selectMinePartnerApplyList(minePartnerApply);
    }

    /**
     * 新增合伙人申请记录
     *
     * @param minePartnerApply 合伙人申请记录
     * @return 结果
     */
    @Override
    public int insertMinePartnerApply(MinePartnerApply minePartnerApply)
    {
        minePartnerApply.setCreateTime(DateUtils.getNowDate());
        return minePartnerApplyMapper.insertMinePartnerApply(minePartnerApply);
    }

    /**
     * 修改合伙人申请记录
     *
     * @param minePartnerApply 合伙人申请记录
     * @return 结果
     */
    @Override
    public int updateMinePartnerApply(MinePartnerApply minePartnerApply)
    {
        minePartnerApply.setUpdateTime(DateUtils.getNowDate());
        return minePartnerApplyMapper.updateMinePartnerApply(minePartnerApply);
    }

    /**
     * 批量删除合伙人申请记录
     *
     * @param uuids 需要删除的合伙人申请记录主键
     * @return 结果
     */
    @Override
    public int deleteMinePartnerApplyByUuids(String uuids)
    {
        return minePartnerApplyMapper.deleteMinePartnerApplyByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除合伙人申请记录信息
     *
     * @param uuid 合伙人申请记录主键
     * @return 结果
     */
    @Override
    public int deleteMinePartnerApplyByUuid(Integer uuid)
    {
        return minePartnerApplyMapper.deleteMinePartnerApplyByUuid(uuid);
    }
}
