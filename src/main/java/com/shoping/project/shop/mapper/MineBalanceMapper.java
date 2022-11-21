package com.shoping.project.shop.mapper;

import java.util.List;
import com.shoping.project.shop.domain.MineBalance;

/**
 * 提现明细Mapper接口
 *
 * @author shoping
 * @date 2021-12-11
 */
public interface MineBalanceMapper
{
    /**
     * 查询提现明细
     *
     * @param uuid 提现明细主键
     * @return 提现明细
     */
    public MineBalance selectMineBalanceByUuid(Long uuid);

    /**
     * 查询提现明细列表
     *
     * @param mineBalance 提现明细
     * @return 提现明细集合
     */
    public List<MineBalance> selectMineBalanceList(MineBalance mineBalance);

    /**
     * 新增提现明细
     *
     * @param mineBalance 提现明细
     * @return 结果
     */
    public int insertMineBalance(MineBalance mineBalance);

    /**
     * 修改提现明细
     *
     * @param mineBalance 提现明细
     * @return 结果
     */
    public int updateMineBalance(MineBalance mineBalance);

    /**
     * 删除提现明细
     *
     * @param uuid 提现明细主键
     * @return 结果
     */
    public int deleteMineBalanceByUuid(Long uuid);

    /**
     * 批量删除提现明细
     *
     * @param uuids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteMineBalanceByUuids(String[] uuids);
}
