// pages/cart/comment/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({
  /**
   * 页面的初始数据
   */
  data: {
    baseUrl: app.globalData.baseUrl,
    comment:'',
    info:null,
    img:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.setData({
      uuid:options.uuid,
      img:options.img
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


      res.data.data.detailList.forEach(element => {
        element.comment="";
      });

      _this.setData({
        info:res.data.data
      })
    });
  },
  comment:function(e){
    let _this  = this;
    let uuid = e.currentTarget.dataset.uuid;
    let content=e.detail;
    _this.data.info.detailList.forEach(element => {
      if(element.goodsId==uuid){
        element.comment = content;
      }
    });

    _this.setData({
      info:_this.data.info
    })


  },
  send:function(){
    let _this = this;
    let commstr = "";
    _this.data.info.detailList.forEach(element => {
      let comment = element.comment.replace(/\s/g, "");

      commstr += comment+"#wxg#"+element.goodsId+"@wxg@";

      if (comment == '') {
        Toast("评论内容不能为空");
        return;
      }
    });

    let param={
      orderId:_this.data.uuid,
      commstr:commstr
    }

    api.post("/app/v1/mini/commentSave", param).then(res => {

      if(res.data.code==500){
        Toast(res.data.msg)
        return;
      }


      Toast("评论成功");
     setTimeout(function(){
      wx.navigateBack({
        delta: 1,
      })

     },2000)
   });
  }
})