package com.shoping.project.shop.service;

import java.util.List;
import com.shoping.project.shop.domain.MineComment;

/**
 * 评论Service接口
 *
 * @author shoping
 * @date 2021-12-04
 */
public interface IMineCommentService
{
    /**
     * 查询评论
     *
     * @param uuid 评论主键
     * @return 评论
     */
    public MineComment selectMineCommentByUuid(Long uuid);

    /**
     * 查询评论列表
     *
     * @param mineComment 评论
     * @return 评论集合
     */
    public List<MineComment> selectMineCommentList(MineComment mineComment);

    /**
     * 新增评论
     *
     * @param mineComment 评论
     * @return 结果
     */
    public int insertMineComment(MineComment mineComment);

    /**
     * 修改评论
     *
     * @param mineComment 评论
     * @return 结果
     */
    public int updateMineComment(MineComment mineComment);

    /**
     * 批量删除评论
     *
     * @param uuids 需要删除的评论主键集合
     * @return 结果
     */
    public int deleteMineCommentByUuids(String uuids);

    /**
     * 删除评论信息
     *
     * @param uuid 评论主键
     * @return 结果
     */
    public int deleteMineCommentByUuid(Long uuid);
}
