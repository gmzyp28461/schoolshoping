// pages/type/detail/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({
  /**
   * 页面的初始数据
   */
  data: {
    baseUrl:app.globalData.baseUrl,
    uuid:'',
    info:null,
    show:false,
    commentList:[],
    comment:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    // wx.connectSocket({
    //         url: "ws://lpq222f.nat.ipyingshe.com/ws",
    //       })
    //       //连接成功
    //       wx.onSocketOpen(function(){
    //         console.log('websocket opened.');})
    //   wx.onSocketMessage(function(data) {
    //           var objData = JSON.parse(data.data);
    //           console.log("聊天消息",objData)
    //          
    //           console.log(data);
    //         })


    this.setData({
      uuid:options.uuid
    })
    this.reqInfoById();
    this.reqCommentList();
  },
  // 客服
  aftermarket:function(e){
    let _this = this;
    let aftermarket = e.currentTarget.dataset.aftermarket;
    // wx.showActionSheet({
    //   itemList: ['A', 'B', 'C'],
    //   success (res) {
    //     console.log(res.tapIndex)
    //   },
    //   fail (res) {
    //     console.log(res.errMsg)
    //   }
    // })
    // wx.navigateTo({
    //   url: '/pages/cart/aftermarket/index',

    // })
  
    //  wx.sendSocketMessage({
    //   data: JSON.stringify(news) 
    // })
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
   * 轮播图
   */
  reqInfoById:function(){
    let _this = this;
    api.post("/app/v1/mini/detailById/"+_this.data.uuid, {}).then(res => {

      if(res.data.data.content!=null){
        res.data.data.content =  res.data.data.content.replace(/<img/gi, '<img style="max-width:100%;height:auto;display:block" ')
        .replace(/<section/g, '<div')
        .replace(/\/section>/g, '\div>');
  
        res.data.data.content = res.data.data.content.replace(RegExp("/profile/", "g"), app.globalData.baseUrl + '/profile/');
      }

      _this.setData({
        info:res.data.data
      })
    });
  },
  cart:function(){
      wx.switchTab({
        url: '/pages/cart/home/index',
      })
  },
  buyNow:function(){
    let _this = this;
    let accessToken = wx.getStorageSync('token');
    if (accessToken == null || accessToken == '') {
        wx.navigateTo({
          url: '/pages/mine/accesstoken/index',
        })
    }else{
      wx.navigateTo({
        url: '/pages/cart/payNow/index?uuid='+_this.data.info.uuid,
      })
    }
  },
  cartSave:function(){
    let _this = this;
    api.post("/app/v1/mini/optCart/save/"+_this.data.info.uuid, {}).then(res => {

      if(res.data.code==500){
        if(res.data.msg=='用户未登录'){
          wx.navigateTo({
            url: '/pages/mine/accesstoken/index',
          })
        }else{
          Toast(res.data.msg);
        }
        return;
      }
      Toast("添加成功");


    });

  },
  reqCommentList:function(){
    let _this = this;
    api.post("/app/v1/mini/getCommentList", {
      "goodsId":_this.data.uuid
    }).then(res => {
      _this.setData({
        commentList:res.data
      })
    });
  },
  onClose() {
    this.setData({ show: false });
  },
  onClickComment(){
    this.setData({ show: true });
  },
  /**
   * 收藏
   */
  onClickCollect:function(e){
    let _this = this;
    let accessToken = wx.getStorageSync('token');
    if (accessToken == null || accessToken == '') {
        wx.navigateTo({
          url: '/pages/mine/accesstoken/index',
        })
        return;
    }

    let status = e.currentTarget.dataset.status;
    let optType="";
    if(status=='star'){
      optType="cancel";
    }else if(status=='star-o'){
      optType="save";
    }

   
    api.post("/app/v1/mini/optCollect/"+optType+"/"+_this.data.info.uuid, {}).then(res => {
      //Toast('操作成功');
      _this.reqInfoById();

    });
  }
})