package com.shoping.project.shop.service.impl;

import java.util.List;
import com.shoping.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shoping.project.shop.mapper.MineCommentMapper;
import com.shoping.project.shop.domain.MineComment;
import com.shoping.project.shop.service.IMineCommentService;
import com.shoping.common.utils.text.Convert;

/**
 * 评论Service业务层处理
 *
 * @author shoping
 * @date 2021-12-04
 */
@Service
public class MineCommentServiceImpl implements IMineCommentService
{
    @Autowired
    private MineCommentMapper mineCommentMapper;

    /**
     * 查询评论
     *
     * @param uuid 评论主键
     * @return 评论
     */
    @Override
    public MineComment selectMineCommentByUuid(Long uuid)
    {
        return mineCommentMapper.selectMineCommentByUuid(uuid);
    }

    /**
     * 查询评论列表
     *
     * @param mineComment 评论
     * @return 评论
     */
    @Override
    public List<MineComment> selectMineCommentList(MineComment mineComment)
    {
        return mineCommentMapper.selectMineCommentList(mineComment);
    }

    /**
     * 新增评论
     *
     * @param mineComment 评论
     * @return 结果
     */
    @Override
    public int insertMineComment(MineComment mineComment)
    {
        mineComment.setCreateTime(DateUtils.getNowDate());
        return mineCommentMapper.insertMineComment(mineComment);
    }

    /**
     * 修改评论
     *
     * @param mineComment 评论
     * @return 结果
     */
    @Override
    public int updateMineComment(MineComment mineComment)
    {
        mineComment.setUpdateTime(DateUtils.getNowDate());
        return mineCommentMapper.updateMineComment(mineComment);
    }

    /**
     * 批量删除评论
     *
     * @param uuids 需要删除的评论主键
     * @return 结果
     */
    @Override
    public int deleteMineCommentByUuids(String uuids)
    {
        return mineCommentMapper.deleteMineCommentByUuids(Convert.toStrArray(uuids));
    }

    /**
     * 删除评论信息
     *
     * @param uuid 评论主键
     * @return 结果
     */
    @Override
    public int deleteMineCommentByUuid(Long uuid)
    {
        return mineCommentMapper.deleteMineCommentByUuid(uuid);
    }
}
