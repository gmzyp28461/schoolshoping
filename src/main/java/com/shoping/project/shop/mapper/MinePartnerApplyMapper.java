package com.shoping.project.shop.mapper;

import java.util.List;
import com.shoping.project.shop.domain.MinePartnerApply;

/**
 * 合伙人申请记录Mapper接口
 *
 * @author shoping
 * @date 2021-12-11
 */
public interface MinePartnerApplyMapper
{
    /**
     * 查询合伙人申请记录
     *
     * @param uuid 合伙人申请记录主键
     * @return 合伙人申请记录
     */
    public MinePartnerApply selectMinePartnerApplyByUuid(Integer uuid);

    /**
     * 查询合伙人申请记录列表
     *
     * @param minePartnerApply 合伙人申请记录
     * @return 合伙人申请记录集合
     */
    public List<MinePartnerApply> selectMinePartnerApplyList(MinePartnerApply minePartnerApply);

    /**
     * 新增合伙人申请记录
     *
     * @param minePartnerApply 合伙人申请记录
     * @return 结果
     */
    public int insertMinePartnerApply(MinePartnerApply minePartnerApply);

    /**
     * 修改合伙人申请记录
     *
     * @param minePartnerApply 合伙人申请记录
     * @return 结果
     */
    public int updateMinePartnerApply(MinePartnerApply minePartnerApply);

    /**
     * 删除合伙人申请记录
     *
     * @param uuid 合伙人申请记录主键
     * @return 结果
     */
    public int deleteMinePartnerApplyByUuid(Integer uuid);

    /**
     * 批量删除合伙人申请记录
     *
     * @param uuids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMinePartnerApplyByUuids(String[] uuids);
}
