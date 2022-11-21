package com.shoping.project.shop.service;

import java.util.List;
import com.shoping.project.shop.domain.MinePartnerApply;

/**
 * 合伙人申请记录Service接口
 *
 * @author shoping
 * @date 2021-12-11
 */
public interface IMinePartnerApplyService
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
     * 批量删除合伙人申请记录
     *
     * @param uuids 需要删除的合伙人申请记录主键集合
     * @return 结果
     */
    public int deleteMinePartnerApplyByUuids(String uuids);

    /**
     * 删除合伙人申请记录信息
     *
     * @param uuid 合伙人申请记录主键
     * @return 结果
     */
    public int deleteMinePartnerApplyByUuid(Integer uuid);
}
