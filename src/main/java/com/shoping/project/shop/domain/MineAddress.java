package com.shoping.project.shop.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.shoping.framework.aspectj.lang.annotation.Excel;
import com.shoping.framework.web.domain.BaseEntity;

/**
 * 订单地址对象 mine_address
 *
 * @author javac
 * @date 2021-11-11
 */
public class MineAddress extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long uuid;

    /** 订单id */
    @Excel(name = "订单id")
    private String orderId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 名称 */
    @Excel(name = "名称")
    private String userName;

    /** 邮编 */
    @Excel(name = "邮编")
    private String postalCode;

    /** 国标收货地址第一级地址 */
    @Excel(name = "国标收货地址第一级地址")
    private String provinceName;

    /** 国标收货地址第二级地址 */
    @Excel(name = "国标收货地址第二级地址")
    private String cityName;

    /** 国标收货地址第三级地址 */
    @Excel(name = "国标收货地址第三级地址")
    private String countyName;

    /** 详细收货地址信息 */
    @Excel(name = "详细收货地址信息")
    private String detailInfo;

    /** 收货地址国家码 */
    @Excel(name = "收货地址国家码")
    private String nationalCode;

    /** 收货人手机号码 */
    @Excel(name = "收货人手机号码")
    private String telNumber;

    public void setUuid(Long uuid)
    {
        this.uuid = uuid;
    }

    public Long getUuid()
    {
        return uuid;
    }
    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    public String getOrderId()
    {
        return orderId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setUserName(String userName)
    {
        this.userName = userName;
    }

    public String getUserName()
    {
        return userName;
    }
    public void setPostalCode(String postalCode)
    {
        this.postalCode = postalCode;
    }

    public String getPostalCode()
    {
        return postalCode;
    }
    public void setProvinceName(String provinceName)
    {
        this.provinceName = provinceName;
    }

    public String getProvinceName()
    {
        return provinceName;
    }
    public void setCityName(String cityName)
    {
        this.cityName = cityName;
    }

    public String getCityName()
    {
        return cityName;
    }
    public void setCountyName(String countyName)
    {
        this.countyName = countyName;
    }

    public String getCountyName()
    {
        return countyName;
    }
    public void setDetailInfo(String detailInfo)
    {
        this.detailInfo = detailInfo;
    }

    public String getDetailInfo()
    {
        return detailInfo;
    }
    public void setNationalCode(String nationalCode)
    {
        this.nationalCode = nationalCode;
    }

    public String getNationalCode()
    {
        return nationalCode;
    }
    public void setTelNumber(String telNumber)
    {
        this.telNumber = telNumber;
    }

    public String getTelNumber()
    {
        return telNumber;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("uuid", getUuid())
            .append("orderId", getOrderId())
            .append("userId", getUserId())
            .append("userName", getUserName())
            .append("postalCode", getPostalCode())
            .append("provinceName", getProvinceName())
            .append("cityName", getCityName())
            .append("countyName", getCountyName())
            .append("detailInfo", getDetailInfo())
            .append("nationalCode", getNationalCode())
            .append("telNumber", getTelNumber())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .toString();
    }
}
