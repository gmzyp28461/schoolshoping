// pages/express/index.js
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    expressCode:'',
    info:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      expressCode:options.expressCode
    })
    this.express();

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
  express:function(){
    let _this = this;
    wx.request({
      url: 'http://api.tianapi.com/kuaidi/index',  
      data:{
        'key':'e26b1b3a2791199fe4268a1fe51cda6e',
        'number':_this.data.expressCode
      },   
      method:"get",   
      header:{"content-type":"application/json"},   
      success:function(res){
        
        console.log(res)
        
         if(res.data.code==200){
          _this.setData({
            info:res.data.newslist[0]
          })
         }
      }
    })


  },
  goshop:function(){
    wx.switchTab({
      url: '/pages/index/index',
    })
  }
})