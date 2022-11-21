package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineBalanceMapper;
import com.shoping.project.shop.domain.MineBalance;
import com.shoping.project.shop.service.IMineBalanceService;
import com.shoping.common.utils.text.Convert;

/**
 * 提现明细Service业务层处理
 *
 * @author shoping
 * @date 2021-12-11
 */
@Service
public class MineBalanceServiceImpl implements IMineBalanceService
{
    @Autowired
    private MineBalanceMapper mineBalanceMapper;

    /**
     * 查询提现明细
     *
     * @param uuid 提现明细主键
     * @return 提现明细
     */
    @Override
    public MineBalance selectMineBalanceByUuid(Long uuid)
    {
        return mineBalanceMapper.selectMineBalanceByUuid(uuid);
    }

    /**
     * 查询提现明细列表
     *
     * @param mineBalance 提现明细
     * @return 提现明细
     */
    @Override
    public List<MineBalance> selectMineBalanceList(MineBalance mineBalance)
    {
        return mineBalanceMapper.selectMineBalanceList(mineBalance);
    }

    /**
     * 新增提现明细
     *
     * @param mineBalance 提现明细
     * @return 结果
     */
    @Override
    public int insertMineBalance(MineBalance mineBalance)
    {
        mineBalance.setCreateTime(DateUtils.getNowDate());
        return mineBalanceMapper.insertMineBalance(mineBalance);
    }

    /**
     * 修改提现明细
     *
     * @param mineBalance 提现明细
     * @return 结果
     */
    @Override
    public int updateMineBalance(MineBalance mineBalance)
    {
        mineBalance.setUpdateTime(DateUtils.getNowDate());
        return mineBalanceMapper.updateMineBalance(mineBalance);
    }

    /**
     * 批量删除提现明细
     *
     * @param uuids 需要删除的提现明细主键
     * @return 结果
     */
    @Override
    public int deleteMineBalanceByUuids(String uuids)
    {
        return mineBalanceMapper.deleteMineBalanceByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除提现明细信息
     *
     * @param uuid 提现明细主键
     * @return 结果
     */
    @Override
    public int deleteMineBalanceByUuid(Long uuid)
    {
        return mineBalanceMapper.deleteMineBalanceByUuid(uuid);
    }
}
