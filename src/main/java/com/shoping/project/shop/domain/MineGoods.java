package com.shoping.project.shop.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.shoping.framework.aspectj.lang.annotation.Excel;
import com.shoping.framework.web.domain.BaseEntity;

/**
 * 商品对象 mine_goods
 *
 * @author javac
 * @date 2021-11-11
 */
public class MineGoods extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long uuid;

    /** 类型 */
    @Excel(name = "类型")
    private String typeId;

    /** 名称 */
    @Excel(name = "名称")
    private String title;

    /** 封面地址 */
    @Excel(name = "封面地址")
    private String url;

    /** 原价 */
    @Excel(name = "原价")
    private BigDecimal costPrice;

    /** 价格 */
    @Excel(name = "价格")
    private BigDecimal price;

    /** 库存 */
    @Excel(name = "库存")
    private Long stock;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 状态
10 正常
20 下架 */
    @Excel(name = "状态 10 正常 20 下架")
    private String state;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;


    /** 推荐首页(0 推荐 1不推荐) */
    @Excel(name = "推荐首页(0 推荐 1不推荐)")
    private String indexStatus;


    private String topLike;//用户喜欢最高
    private int collectCount;
    private int commentCount;
    private double Similarity;       //相似度(只在推荐时调用)

    private String statusToken;//小程序关联用户token查询
    private String collectStatus;//收藏

    private MineType type;

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public String getStatusToken() {
        return statusToken;
    }

    public void setStatusToken(String statusToken) {
        this.statusToken = statusToken;
    }

    public String getCollectStatus() {
        return collectStatus;
    }

    public void setCollectStatus(String collectStatus) {
        this.collectStatus = collectStatus;
    }

    public String getTopLike() {
        return topLike;
    }

    public void setTopLike(String topLike) {
        this.topLike = topLike;
    }

    public int getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(int collectCount) {
        this.collectCount = collectCount;
    }

    public double getSimilarity() {
        return Similarity;
    }

    public void setSimilarity(double similarity) {
        Similarity = similarity;
    }

    public String getIndexStatus() {
        return indexStatus;
    }

    public void setIndexStatus(String indexStatus) {
        this.indexStatus = indexStatus;
    }

    public MineType getType() {
        return type;
    }

    public void setType(MineType type) {
        this.type = type;
    }

    public void setUuid(Long uuid)
    {
        this.uuid = uuid;
    }

    public Long getUuid()
    {
        return uuid;
    }
    public void setTypeId(String typeId)
    {
        this.typeId = typeId;
    }

    public String getTypeId()
    {
        return typeId;
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
    public void setCostPrice(BigDecimal costPrice)
    {
        this.costPrice = costPrice;
    }

    public BigDecimal getCostPrice()
    {
        return costPrice;
    }
    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }
    public void setStock(Long stock)
    {
        this.stock = stock;
    }

    public Long getStock()
    {
        return stock;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setState(String state)
    {
        this.state = state;
    }

    public String getState()
    {
        return state;
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
            .append("typeId", getTypeId())
            .append("title", getTitle())
            .append("url", getUrl())
            .append("costPrice", getCostPrice())
            .append("price", getPrice())
            .append("stock", getStock())
            .append("content", getContent())
            .append("state", getState())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
