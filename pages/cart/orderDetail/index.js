// pages/orderDetail/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
import Dialog from '../../../miniprogram_npm/@vant/weapp/dialog/dialog';
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
    info:null
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
    api.post("/app/v1/mini/orderDetail/"+_this.data.uuid, {}).then(res => {

      _this.setData({
        info:res.data.data
      })
    });
  },
  remove:function(e){
    let _this = this;
    let uuid = e.currentTarget.dataset.uuid;

    Dialog.confirm({
      title: '确认',
      message: '确定删除该订单',
    })
      .then(() => {
        // on confirm
        api.post("/app/v1/mini/removeOrder/"+uuid, {}).then(res => {
          Toast("删除成功")

          setTimeout(function(){

            wx.navigateBack({
              delta: 1,
            })
           
          },2000)


        });
    
      })
      .catch(() => {
        // on cancel
      });
   
    
  }
})