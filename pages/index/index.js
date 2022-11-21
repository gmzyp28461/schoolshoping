// pages/index/index.js
const app = getApp();
const api = require("../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    baseUrl:app.globalData.baseUrl,
    bannerList: [],//轮播图
    typeList: [],//类型
    recoList:[],//推荐
    indexList:[]//推荐首页
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.reqBannerList();
    this.reqTypeList();
    this.reqRecoList();
    this.reqList();
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
  reqList:function(){
    let _this = this;
    api.post("/app/v1/mini/getGoodsList", {
      "pageNum":'1',
      "pageSize":'20',
      "indexStatus":'0',
      "state":'10'
    }).then(res => {

      if(res.data.rows.length>0){
        res.data.rows.forEach(element => {

          if(element.title.length>12){
            element.title = element.title.substring(0,12)+"..."
          }
          
        });
      }
      _this.setData({
        indexList:res.data.rows
      })


    });
  },
  reqRecoList:function(){
    let _this = this;
    api.post("/app/v1/mini/getRecomGoodsList", {}).then(res => {


      if(res.data.length>0){
        res.data.forEach(element => {

          if(element.title.length>12){
            element.title = element.title.substring(0,12)+"..."
          }
          
        });
      }



      _this.setData({
        recoList:res.data
      })
    });
  },
   /**
   * 类型
   */
  reqTypeList:function() {
    let _this = this;
    api.post("/app/v1/mini/getType", {
      "indexStatus":'0'
    }).then(res => {
      _this.setData({
        typeList:res.data.data
      })
    });
  },
  /**
   * 轮播图
   */
  reqBannerList:function(){
    let _this = this;
    api.post("/app/v1/mini/getBanner", {}).then(res => {
      _this.setData({
        bannerList:res.data.data
      })
    });
  },
   /**
   * 分类列表
   */
  list:function(e) {
    let uuid = e.currentTarget.dataset.uuid;
    let typeName = e.currentTarget.dataset.title;
    wx.navigateTo({
      url: '/pages/type/list/index?typeId='+uuid+"&title="+typeName,
    })
  },
  search:function(){
    wx.navigateTo({
      url: '/pages/type/search/index',
    })
  },
  detail:function(e) {
    let uuid = e.currentTarget.dataset.uuid;
    wx.navigateTo({
      url: '/pages/type/detail/index?uuid='+uuid,
    })
},
})