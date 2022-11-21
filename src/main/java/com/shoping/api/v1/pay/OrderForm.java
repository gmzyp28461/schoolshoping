package com.shoping.api.v1.pay;

import com.shoping.framework.aspectj.lang.annotation.Excel;

/**
 * @ClassName OrderForm
 * @Description:
 * @Author ningtao
 * @Date 2021/12/1
 **/
public class OrderForm {

    /**
     *  购物车id+"@@@"+商品id+"@@@"+购买数量+"###"
     */
    private String goodsStr;

    private String userName;

    /** 邮编 */
    @Excel(name = "邮编")
    private String postalCode;

    /** 国标收货地址第一级地址 */
    private String provinceName;

    /** 国标收货地址第二级地址 */
    private String cityName;

    /** 国标收货地址第三级地址 */
    private String countyName;

    /** 详细收货地址信息 */
    private String detailInfo;

    /** 收货地址国家码 */
    private String nationalCode;

    /** 收货人手机号码 */
    private String telNumber;

    private String vipcode;


    public String getVipcode() {
        return vipcode;
    }

    public void setVipcode(String vipcode) {
        this.vipcode = vipcode;
    }

    public String getGoodsStr() {
        return goodsStr;
    }

    public void setGoodsStr(String goodsStr) {
        this.goodsStr = goodsStr;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(String provinceName) {
        this.provinceName = provinceName;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public String getCountyName() {
        return countyName;
    }

    public void setCountyName(String countyName) {
        this.countyName = countyName;
    }

    public String getDetailInfo() {
        return detailInfo;
    }

    public void setDetailInfo(String detailInfo) {
        this.detailInfo = detailInfo;
    }

    public String getNationalCode() {
        return nationalCode;
    }

    public void setNationalCode(String nationalCode) {
        this.nationalCode = nationalCode;
    }

    public String getTelNumber() {
        return telNumber;
    }

    public void setTelNumber(String telNumber) {
        this.telNumber = telNumber;
    }
}
