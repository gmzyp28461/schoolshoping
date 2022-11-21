package com.shoping.project.shop.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.shoping.framework.aspectj.lang.annotation.Excel;
import com.shoping.framework.web.domain.BaseEntity;

/**
 * 轮播图对象 mine_banner
 *
 * @author javac
 * @date 2021-11-11
 */
public class MineBanner extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long uuid;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 图片地址 */
    @Excel(name = "图片地址")
    private String url;

    /** 关联商品id */
    @Excel(name = "关联商品id")
    private Long goodsId;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private MineGoods goods;

    public MineGoods getGoods() {
        return goods;
    }

    public void setGoods(MineGoods goods) {
        this.goods = goods;
    }

    public void setUuid(Long uuid)
    {
        this.uuid = uuid;
    }

    public Long getUuid()
    {
        return uuid;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setUrl(String url)
    {
        this.url = url;
    }

    public String getUrl()
    {
        return url;
    }
    public void setGoodsId(Long goodsId)
    {
        this.goodsId = goodsId;
    }

    public Long getGoodsId()
    {
        return goodsId;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("uuid", getUuid())
            .append("title", getTitle())
            .append("url", getUrl())
            .append("goodsId", getGoodsId())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
