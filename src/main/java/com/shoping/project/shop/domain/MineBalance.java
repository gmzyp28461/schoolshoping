package com.shoping.project.shop.domain;

import java.math.BigDecimal;

import com.shoping.project.system.user.domain.User;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.shoping.framework.aspectj.lang.annotation.Excel;
import com.shoping.framework.web.domain.BaseEntity;

/**
 * 提现明细对象 mine_balance
 *
 * @author shoping
 * @date 2021-12-11
 */
public class MineBalance extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long uuid;

    /** 提现金额 */
    @Excel(name = "提现金额")
    private BigDecimal price;

    @Excel(name = "提现账号")
    private Long userId;

    /** 状态 */
    @Excel(name = "状态")
    private String status;

    /** 账号 */
    @Excel(name = "账号")
    private String idCard;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;
    private User user;


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public void setUuid(Long uuid)
    {
        this.uuid = uuid;
    }

    public Long getUuid()
    {
        return uuid;
    }
    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
    }
    public void setIdCard(String idCard)
    {
        this.idCard = idCard;
    }

    public String getIdCard()
    {
        return idCard;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("uuid", getUuid())
            .append("price", getPrice())
            .append("status", getStatus())
            .append("idCard", getIdCard())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
