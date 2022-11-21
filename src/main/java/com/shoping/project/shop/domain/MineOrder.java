package com.shoping.project.shop.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.shoping.project.system.user.domain.User;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.shoping.framework.aspectj.lang.annotation.Excel;
import com.shoping.framework.web.domain.BaseEntity;

/**
 * 订单信息对象 mine_order
 *
 * @author javac
 * @date 2021-11-11
 */
public class MineOrder extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private String uuid;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 订单号 */
    @Excel(name = "订单号")
    private String orderCode;

    /** 金额 */
    @Excel(name = "金额")
    private BigDecimal price;

    /** 实际支付金额 */
    @Excel(name = "实际支付金额")
    private BigDecimal payPrice;

    /** 支付时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "支付时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date payTime;

    /** 支付状态
10 待支付
20 支付失败
30 支付成功
40 已关闭
50 取消 */
    @Excel(name = "支付状态 10 待支付 20 支付失败 30 支付成功(待发货) 40 待收货 50 已完成 60 已关闭 70 退款")
    private String payStatus;

    /** 第三方支付订单号 */
    @Excel(name = "第三方支付订单号")
    private String busPayNo;

    /** 预支付交易会话标识  */
    @Excel(name = "预支付交易会话标识 ")
    private String prepayId;

    /** 订单编码类型
1=订单类别头
2=退货类别头
3=退款类别头
4=未付款重新支付别头 */
    @Excel(name = "订单编码类型 1=订单类别头 2=退货类别头 3=退款类别头 4=未付款重新支付别头")
    private String orderCodeType;

    /** 删除标志（0代表存在 2代表删除） */
    private String delFlag;

    private String expressCode;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "收货时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date receivingDate;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "发货时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date deliveryDate;

    private String commStatus;


    /** 合伙人id */
    @Excel(name = "合伙人id")
    private Long vipUserId;

    /** 折扣码 */
    @Excel(name = "折扣码")
    private String vipCode;

    /** 折扣 */
    @Excel(name = "折扣")
    private BigDecimal discount;

    /** 提成比例 */
    @Excel(name = "提成比例")
    private BigDecimal ratio;

    /** 提成金额 */
    @Excel(name = "提成金额")
    private BigDecimal commPrice;

    private List<MineOrderDetail> detailList;

    private MineAddress address;

    private User user;

    public Long getVipUserId() {
        return vipUserId;
    }

    public void setVipUserId(Long vipUserId) {
        this.vipUserId = vipUserId;
    }

    public String getVipCode() {
        return vipCode;
    }

    public void setVipCode(String vipCode) {
        this.vipCode = vipCode;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public BigDecimal getRatio() {
        return ratio;
    }

    public void setRatio(BigDecimal ratio) {
        this.ratio = ratio;
    }

    public BigDecimal getCommPrice() {
        return commPrice;
    }

    public void setCommPrice(BigDecimal commPrice) {
        this.commPrice = commPrice;
    }

    public String getCommStatus() {
        return commStatus;
    }

    public void setCommStatus(String commStatus) {
        this.commStatus = commStatus;
    }

    public Date getReceivingDate() {
        return receivingDate;
    }

    public void setReceivingDate(Date receivingDate) {
        this.receivingDate = receivingDate;
    }

    public Date getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(Date deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getExpressCode() {
        return expressCode;
    }

    public void setExpressCode(String expressCode) {
        this.expressCode = expressCode;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public MineAddress getAddress() {
        return address;
    }

    public void setAddress(MineAddress address) {
        this.address = address;
    }

    public List<MineOrderDetail> getDetailList() {
        return detailList;
    }

    public void setDetailList(List<MineOrderDetail> detailList) {
        this.detailList = detailList;
    }

    public void setUuid(String uuid)
    {
        this.uuid = uuid;
    }

    public String getUuid()
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
    public void setOrderCode(String orderCode)
    {
        this.orderCode = orderCode;
    }

    public String getOrderCode()
    {
        return orderCode;
    }
    public void setPrice(BigDecimal price)
    {
        this.price = price;
    }

    public BigDecimal getPrice()
    {
        return price;
    }
    public void setPayPrice(BigDecimal payPrice)
    {
        this.payPrice = payPrice;
    }

    public BigDecimal getPayPrice()
    {
        return payPrice;
    }
    public void setPayTime(Date payTime)
    {
        this.payTime = payTime;
    }

    public Date getPayTime()
    {
        return payTime;
    }
    public void setPayStatus(String payStatus)
    {
        this.payStatus = payStatus;
    }

    public String getPayStatus()
    {
        return payStatus;
    }
    public void setBusPayNo(String busPayNo)
    {
        this.busPayNo = busPayNo;
    }

    public String getBusPayNo()
    {
        return busPayNo;
    }
    public void setPrepayId(String prepayId)
    {
        this.prepayId = prepayId;
    }

    public String getPrepayId()
    {
        return prepayId;
    }
    public void setOrderCodeType(String orderCodeType)
    {
        this.orderCodeType = orderCodeType;
    }

    public String getOrderCodeType()
    {
        return orderCodeType;
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
            .append("orderCode", getOrderCode())
            .append("price", getPrice())
            .append("payPrice", getPayPrice())
            .append("payTime", getPayTime())
            .append("payStatus", getPayStatus())
            .append("busPayNo", getBusPayNo())
            .append("prepayId", getPrepayId())
            .append("orderCodeType", getOrderCodeType())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
