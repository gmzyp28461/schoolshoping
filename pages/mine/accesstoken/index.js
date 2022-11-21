// pages/mine/accesstoken/index.js
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    canIUseGetUserProfile:false,
    jsCode:'',
    openid: "",
    unionid: "",
    session_key: "",
    userInfo:null
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    if (wx.getUserProfile) {
      this.setData({
        canIUseGetUserProfile: true
      })
    }
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
  /**
   * 登录注册
   */
  reqRegisterOrLogin:function(){
    var _this = this;
    var param = {
      "openId": _this.data.openid,
      "avatar": _this.data.userInfo.avatarUrl,
      "city": _this.data.userInfo.city,
      "country": _this.data.userInfo.country,
      "sex": _this.data.userInfo.gender,
      "userName": _this.data.userInfo.nickName,
      "province": _this.data.userInfo.province
    }

    api.post("/app/v1/user/registerOrLogin", param).then(res => {
      if (res.data.code === 0) {
        wx.setStorageSync('token', res.data.data.token)
          wx.reLaunch({
            url: '/pages/index/index'
          })
      } else {
        wx.showToast({
          title: '网络错误，请稍后再试',
          icon: 'none',
          duration: 1000
        });
      }
    });

  },
  getUserProfile(e) {
    // 推荐使用wx.getUserProfile获取用户信息，开发者每次通过该接口获取用户个人信息均需用户确认
    // 开发者妥善保管用户快速填写的头像昵称，避免重复弹窗
    let _this = this;
    wx.getUserProfile({
      desc: '用于完善会员资料',
      success: (res) => {
        _this.setData({
          userInfo: res.userInfo
        })
        //
          wx.login({
            success: (res) => {
              if (res.code) { //微信登录成功 已拿到code  
                //保存获取到的code
                _this.setData({
                  jsCode: res.code
                })

                //后台获取openid
                api.post("/app/v1/user/getOpenid", {
                  "code": _this.data.jsCode
                }).then(res => {
                  
                  _this.setData({
                    openid: res.data.data.openid,
                    unionid: res.data.data.unionid,
                    session_key: res.data.data.session_key
                  })
                  if (res.data.code === 301) {
                    _this.reqRegisterOrLogin();
                  }else{
                    wx.setStorageSync('token', res.data.data.token)
                    wx.reLaunch({
                      url: '/pages/index/index'
                    })
                  }
                });

                //


              
              }
            }
          })
        //
      },
      fail: (res) => {
        console.log(res)
      }
    })
  },
})