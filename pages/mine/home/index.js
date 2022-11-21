// pages/mine/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    userInfo:null
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
    this.getTabBar().init(); 
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
  collect:function(){
    wx.navigateTo({
      url: '/pages/mine/collect/index',
    })
  },
  comment:function(){
    wx.navigateTo({
      url: '/pages/mine/comment/index',
    })
  },
  reqInfoById:function(){
    let _this = this;
    api.post("/app/v1/user/getUserInfo", {}).then(res => {
      _this.setData({
        userInfo:res.data.data
      })
    });
  },
 
  /**
   * 退出
   */
  logout:function(){
    wx.removeStorageSync('token')
    Toast('退出成功');

    setTimeout(function(){
      wx.switchTab({
        url: '/pages/index/index',
      })
    },2000)
  },
  vip:function(){
    wx.navigateTo({
      url: '/pages/mine/vip/index?userType='+this.data.userInfo.userType,
    })
  },
  balance:function(){
    wx.navigateTo({
      url: '/pages/mine/balance/index',
    })
  },
  order:function(e){
    let title = e.currentTarget.dataset.title;
      wx.navigateTo({
        url: '/pages/cart/order/index?title='+title,
      })
  }
})