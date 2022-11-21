// pages/mine/vip/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    info:null,
    userName:'',
    phoneNum:'',
    content:''
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
    api.post("/app/v1/mini/getVipList", {}).then(res => {
      if(res.data.data!=null){
        _this.setData({
          userName:res.data.data.userName,
          phoneNum:res.data.data.phoneNum,
          content:res.data.data.content,
          info:res.data.data
        })
      }
    });
  },
  subInfo:function(){
    let _this = this;
    let userName = _this.data.userName.replace(/\s/g, "");
    let phoneNum = _this.data.phoneNum.replace(/\s/g, "");
    let content = _this.data.content.replace(/\s/g, "");
    if (userName == '') {
      Toast("姓名不能为空");
      return;
    }
    if (phoneNum == '') {
      Toast("手机号不能为空");
      return;
    }
    if (content == '') {
      Toast("理由不能为空");
      return;
    }

    let param={
      uuid:_this.data.info!=null?_this.data.info.uuid:'',
      userName:userName,
      phoneNum:phoneNum,
      content:content
    }

    api.post("/app/v1/mini/applySave", param).then(res => {

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

  }
})