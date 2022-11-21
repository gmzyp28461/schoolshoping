package com.shoping.api.v1.pay;

/**
 * @ClassName WxPayConfig
 * @Description:
 * @Author javac
 * @Date 2021/4/18
 **/
public class WxPayConfig {
    public String appId;
    public String mchSerialNo;
    public String apiKey;
    public String apiV3Key;
    public String mchId;
    public String notifyUrl;
    public String privateKey;
    public String notifyRefunds;

    public String getNotifyRefunds() {
        return notifyRefunds;
    }

    public void setNotifyRefunds(String notifyRefunds) {
        this.notifyRefunds = notifyRefunds;
    }

    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getMchSerialNo() {
        return mchSerialNo;
    }

    public void setMchSerialNo(String mchSerialNo) {
        this.mchSerialNo = mchSerialNo;
    }

    public String getApiKey() {
        return apiKey;
    }

    public void setApiKey(String apiKey) {
        this.apiKey = apiKey;
    }

    public String getApiV3Key() {
        return apiV3Key;
    }

    public void setApiV3Key(String apiV3Key) {
        this.apiV3Key = apiV3Key;
    }

    public String getMchId() {
        return mchId;
    }

    public void setMchId(String mchId) {
        this.mchId = mchId;
    }

    public String getNotifyUrl() {
        return notifyUrl;
    }

    public void setNotifyUrl(String notifyUrl) {
        this.notifyUrl = notifyUrl;
    }

    public String getPrivateKey() {
        return privateKey;
    }

    public void setPrivateKey(String privateKey) {
        this.privateKey = privateKey;
    }
}
