package com.shoping.project.shop.domain;

import com.shoping.project.system.user.domain.User;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.shoping.framework.aspectj.lang.annotation.Excel;
import com.shoping.framework.web.domain.BaseEntity;

import java.math.BigDecimal;

/**
 * 合伙人申请记录对象 mine_partner_apply
 *
 * @author shoping
 * @date 2021-12-11
 */
public class MinePartnerApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long uuid;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 申请理由 */
    @Excel(name = "申请理由")
    private String content;


    /** 电话号码 */
    @Excel(name = "电话号码")
    private String phoneNum;

    /** 姓名 */
    @Excel(name = "姓名")
    private String userName;

    /** 折扣 */
    @Excel(name = "折扣")
    private BigDecimal discount;

    /** 提成比例 */
    @Excel(name = "提成比例")
    private BigDecimal ratio;

    /** 审核状态 */
    @Excel(name = "审核状态")
    private String status;

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
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setPhoneNum(String phoneNum)
    {
        this.phoneNum = phoneNum;
    }

    public String getPhoneNum()
    {
        return phoneNum;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }
    public void setDiscount(BigDecimal discount)
    {
        this.discount = discount;
    }

    public BigDecimal getDiscount()
    {
        return discount;
    }
    public void setRatio(BigDecimal ratio)
    {
        this.ratio = ratio;
    }

    public BigDecimal getRatio()
    {
        return ratio;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getStatus()
    {
        return status;
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
            .append("userId", getUserId())
            .append("content", getContent())
            .append("phoneNum", getPhoneNum())
            .append("userName", getUserName())
            .append("discount", getDiscount())
            .append("ratio", getRatio())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
