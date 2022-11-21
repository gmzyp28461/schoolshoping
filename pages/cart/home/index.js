// pages/cart/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    checked: false,
    baseUrl: app.globalData.baseUrl,
    cartList: [],
    priceAll: 0.00,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
   
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
    this.reqCartList();
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
  onSubmit: function () {


  },
  onChange(event) {
    this.setData({
      checked: event.detail,
    });
  },
  reqCartList: function () {
    let _this = this;

    this.setData({
      cartList: []
    })

    api.post("/app/v1/mini/getCart", {}).then(res => {
      if(res.data.code==500){
          wx.navigateTo({
            url: '/pages/mine/accesstoken/index',
          })
        return;
      }
      if (res.data.data.length > 0) {
        res.data.data.forEach((element, index) => {
          element.checked = false;
          element.num = 1;

        });
      }
      _this.setData({
        cartList: res.data.data
      })
    });
  },
  checkClick(e) {
    let _this = this;
    let uuid = e.currentTarget.dataset.uuid;
    if (_this.data.cartList.length > 0) {
      _this.data.cartList.forEach((element, index) => {
        if (element.uuid == uuid) {
          if (element.checked) {
            element.checked = false;
          } else {
            element.checked = true;
          }
        }
      });
    }
    _this.setData({
      cartList: _this.data.cartList
    })
    _this.calcPrice();

  },
  /**
   * 计算总金额
   */
  calcPrice: function () {
    let _this = this;
    let price = 0;
    if (_this.data.cartList.length > 0) {
      _this.data.cartList.forEach((element, index) => {
        if (element.checked) {
          price = parseFloat(price) + parseFloat(element.goods.price) * element.num;
        }
      });
    }
    _this.setData({
      priceAll: price * 100
    })

  },
  changeClick: function (e) {
    let _this = this;
    let uuid = e.currentTarget.dataset.uuid;
    if (_this.data.cartList.length > 0) {
      _this.data.cartList.forEach((element, index) => {
        if (element.uuid == uuid) {
          element.num = e.detail;
        }
      });
    }
    _this.setData({
      cartList: _this.data.cartList
    })
    _this.calcPrice();
  },
  chooseAll: function () {
    let _this = this;
    if (_this.data.cartList.length > 0) {
      _this.data.cartList.forEach((element, index) => {
            element.checked = true;
      });
    }
    _this.setData({
      cartList: _this.data.cartList
    })
    _this.calcPrice();

  },
   /**
   * 详细信息
   */
  detail:function(e) {
    let uuid = e.currentTarget.dataset.uuid;
    wx.navigateTo({
      url: '/pages/detail/index?uuid='+uuid,
    })
  },
  removeCart:function(e){
    let _this = this;
    let uuid = e.currentTarget.dataset.uuid;
    api.post("/app/v1/mini/optCart/cancel/"+uuid, {}).then(res => {
      Toast("删除成功");

      _this.reqCartList();
      _this.calcPrice();
    });
  },
  goshop:function(){
    wx.switchTab({
      url: '/pages/index/index',
    })
  },
  onClickButton:function(){
    let _this = this;
    let flag=false;
    if (_this.data.cartList.length > 0) {
      _this.data.cartList.forEach((element, index) => {
          if(element.checked){
            flag=true;
          }   

      });
    }

    if(!flag){
      Toast("请选择购买商品");
      return;
    }

    wx.navigateTo({
      url: '/pages/cart/pay/index',
    })


  }
})