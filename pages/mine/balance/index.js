// pages/mine/balance/index.jsimport Dialog from '../../../miniprogram_npm/@vant/weapp/dialog/dialog';
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    idcard:'',
    balance:0.00,
    show:false,
    show2:false,
    price:0.00,
    list:[],
    gradientColor: {
      '0%': '#ffd01e',
      '100%': '#ee0a24',
    }
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
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
    api.post("/app/v1/mini/commprice", {}).then(res => {
      _this.setData({
        price:res.data.data
      })
    });
  },
  showPopup() {
    this.setData({ show: true });
  },

  onClose() {
    this.setData({
      show: false
      });

  },
  showPopup2() {
    this.reqList();
    this.setData({ show2: true });
  },
  onClose2() {
    this.setData({
       show2: false
       });
  },
  subInfo:function(){
    let _this = this;
    if(parseFloat(_this.data.balance)>parseFloat(_this.data.price)){
      Toast("提现金额不能超过"+_this.data.price);
      return;
    }
    if(_this.data.idcard==''){
      Toast("提现账号不能为空");
      return;
    }
    let param={
      idCard:_this.data.idcard,
      price:_this.data.balance
    }

    api.post("/app/v1/mini/commpriceSave", param).then(res => {

      if(res.data.code==500){
        Toast(res.data.msg)
        return;
      }
      Toast("申请成功，等待管理员审核");
     setTimeout(function(){
      wx.navigateBack({
        delta: 1,
      })

     },2000)
   });
  },
  reqList:function() {
    let _this = this;
    api.post("/app/v1/mini/getCommpriceList", {}).then(res => {

      if(res.data.length>0){
        res.data.forEach(element => {
          if(element.status=='10'){
            element.status = "待审核"
          }else if(element.status=='20'){
            element.status = "审核通过"
          }else if(element.status=='30'){
            element.status = "审核未通过"
          }
        });
      }


      _this.setData({
        list:res.data
      })
    });
  },
})