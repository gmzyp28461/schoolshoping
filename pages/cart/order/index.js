// pages/order/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
import Dialog from '../../../miniprogram_npm/@vant/weapp/dialog/dialog';
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    baseUrl:app.globalData.baseUrl,
    pageNum:1,
    pageSize:20,
    title:'全部订单',
    payStatus:'',
    list:[],
    img:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    let payStatus="";
    if(options.title=='待支付'){
      payStatus="10";
    }else if(options.title=='待发货'){
      payStatus="30";
    }else if(options.title=='待收货'){
      payStatus="40";
    }else if(options.title=='已完成'){
      payStatus="50";
    }


    this.setData({
      title:options.title,
      payStatus:payStatus
    })
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
    this.setData({
      list:[],
      pageNum: 1 
    })
    this.reqList();
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
    let _this = this;
    _this.setData({
      list:[],
      pageNum: 1 
    })
    wx.stopPullDownRefresh()

    _this.reqList();
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    let _this = this;
    let _pageNum = _this.data.pageNum + 1;
    _this.setData({
      pageNum: _pageNum
    })
    _this.reqList();
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {

  },
  goshop:function(){
    wx.switchTab({
      url: '/pages/index/index',
    })
  },
  detail:function(e) {
    let uuid = e.currentTarget.dataset.uuid;
    wx.navigateTo({
      url: '/pages/type/detail/index?uuid='+uuid,
    })
  },
  orderDetail:function(e){
    let uuid = e.currentTarget.dataset.uuid;
    wx.navigateTo({
      url: '/pages/cart/orderDetail/index?uuid='+uuid,
    })

  },
  reqList: function () {
    let _this = this;
    api.post("/app/v1/mini/getOrderList", {
      "pageNum":_this.data.pageNum,
      "pageSize":_this.data.pageSize,
      "payStatus":_this.data.payStatus
    }).then(res => {

      if (res.total <= _this.data.list.length) {
        return
      }

    if(res.data.rows.length>0){
      res.data.rows.forEach(element => {
        _this.data.list.push(element);
      });
    }

    _this.setData({
      list:_this.data.list
    })
    });
  },
  express:function(e){
    let _this = this;
    let express = e.currentTarget.dataset.express;
    wx.navigateTo({
      url: '/pages/cart/express/index?expressCode='+express,
    })
  },
  comment:function(e){
    let _this = this;
    // console.log('e',e)
    let uuid = e.currentTarget.dataset.uuid;
    let img_list = e.currentTarget.dataset.list;
    console.log('打印',img_list) 
    _this.setData({
      img:img_list[0].goods.url
    })
    var img = img_list[0].goods.url
    // var img = _this.data.img
    wx.navigateTo({
      url: '/pages/cart/comment/index?uuid='+uuid+'&img='+img,
    })
    

  },
  sure:function(e){
    let _this = this;
    let uuid = e.currentTarget.dataset.uuid;
    Dialog.confirm({
      title: '确认',
      message: '确定已收货',
    })
      .then(() => {
        // on confirm
        api.post("/app/v1/mini/sureOrder/"+uuid, {}).then(res => {
          Toast("收货成功")

          setTimeout(function(){
            _this.setData({
              list:[],
              pageNum: 1 
            })
            _this.reqList();
          },2000)
        });
    
      })
      .catch(() => {
        // on cancel
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
            _this.setData({
              list:[],
              pageNum: 1 
            })
            _this.reqList();
          },2000)


        });
    
      })
      .catch(() => {
        // on cancel
      });
   
    
  }
})