// pages/type/list/index.js
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
    searchValue:'',
    typeId:'',
    title:'',
    list:[]
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    if(options.searchValue!=null&&options.searchValue!=''&&options.searchValue!='undefined'){
      this.setData({
        searchValue:options.searchValue
      })
    }
    if(options.title!=null&&options.title!=''&&options.title!='undefined'){
      this.setData({
        title:options.title
      })
  
    }
    if(options.typeId!=null&&options.typeId!=''&&options.typeId!='undefined'){
      this.setData({
        typeId:options.typeId
      })
  
    }
   
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
  reqList:function(){
    let _this = this;
    api.post("/app/v1/mini/getGoodsList", {
      "pageNum":_this.data.pageNum,
      "pageSize":_this.data.pageSize,
      "state":'10',
      "typeId":_this.data.typeId,
      "searchValue":_this.data.searchValue
    }).then(res => {

          if (res.total <= _this.data.list.length) {
            return
          }

        if(res.data.rows.length>0){
          res.data.rows.forEach(element => {

            if(element.title.length>12){
              element.title = element.title.substring(0,12)+"..."
            }
            _this.data.list.push(element);
          });
        }

        _this.setData({
          list:_this.data.list
        })
   


    });
  }
})