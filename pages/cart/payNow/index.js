// pages/payNow/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    baseUrl: app.globalData.baseUrl,
    title:'请选择地址',
    label:'',
    address:null,
    priceAll: 0.00,
    uuid:'',
    vipcode:'',
    info:null,
    price:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      uuid:options.uuid
    })
    this.reqInfoById();
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  reqInfoById:function(){
    let _this = this;
    api.post("/app/v1/mini/detailById/"+_this.data.uuid, {}).then(res => {
      _this.setData({
        info:res.data.data,
        price:res.data.data.price
      })
    });
  },
  onSubmit:function(){
    let _this =this;
    if(_this.data.address==null){
      Toast("请选择收货地址")
      return;
    }

    let goodsStr="";
       goodsStr+="@@@"+this.data.info.uuid+"@@@1###"
        

    if(goodsStr==''){
        return;
    }
    

    let param={
      vipcode:_this.data.vipcode,
      goodsStr:goodsStr,
      userName:_this.data.address.userName,
      postalCode:_this.data.address.postalCode,
      provinceName:_this.data.address.provinceName,
      cityName:_this.data.address.cityName,
      countyName:_this.data.address.countyName,
      detailInfo:_this.data.address.detailInfo,
      nationalCode:_this.data.address.nationalCode,
      telNumber:_this.data.address.telNumber
    }


    api.post("/app/v1/pay/createOrder", param).then(res => {
        //
        if(res.data.code==500){
          Toast(res.data.msg)
          return;
        }


        wx.showToast({ //提示信息
          title: '下单成功,再逛逛其他的吧',
          icon: 'none',
          duration: 1000
        });
        setTimeout(()=>{
          let fee = _this.data.price;
          wx.navigateTo({
              url: '/pages/cart/payNowIn/index?fee=' + fee,
           })
        },1000)
    });
  },
  chooseAddress: function () {
    let _this = this;
    wx.chooseAddress({
      success(res) {
        _this.setData({
          title:res.userName+"  "+res.telNumber,
          label:res.provinceName+" "+res.cityName+" "+res.countyName+" "+res.detailInfo,
          address: res
        })
        console.log(res.userName)
        console.log(res.postalCode)
        console.log(res.provinceName)
        console.log(res.cityName)
        console.log(res.countyName)
        console.log(res.detailInfo)
        console.log(res.nationalCode)
        console.log(res.telNumber)
      }
    })
  },
})