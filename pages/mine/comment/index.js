// pages/mine/comment/index.js
import Dialog from '../../../miniprogram_npm/@vant/weapp/dialog/dialog';
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
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
    list:[]
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
    let _this = this;
    _this.setData({
      list:[],
      pageNum: 1 
    })

    _this.reqList();
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
    // ListTouch触摸开始
    ListTouchStart(e) {
      this.setData({
        ListTouchStart: e.touches[0].pageX
      })
    },
  
    // ListTouch计算方向
    ListTouchMove(e) {
      this.setData({
        ListTouchDirection: e.touches[0].pageX - this.data.ListTouchStart > 0 ? 'right' : 'left'
      })
    },
  
    // ListTouch计算滚动
    ListTouchEnd(e) {
      if (this.data.ListTouchDirection =='left'){
        this.setData({
          modalName: e.currentTarget.dataset.target
        })
      } else {
        this.setData({
          modalName: null
        })
      }
      this.setData({
        ListTouchDirection: null
      })
    },
  detail:function(e) {
    let uuid = e.currentTarget.dataset.uuid;
    wx.navigateTo({
      url: '/pages/type/detail/index?uuid='+uuid,
    })
},
remove:function(e){
  let uuid = e.currentTarget.dataset.uuid;
  let _this = this;
  Dialog.confirm({
    title: '确认',
    message: '确认删除该评论',
  })
    .then(() => {
      // on confirm
      api.post("/app/v1/mini/commentRemove/"+uuid, {}).then(res => {
        Toast('删除成功');
        
        setTimeout(function(){
          _this.onShow();
        },2000)

      })
    })
    .catch(() => {
      // on cancel
    });

},
reqList:function(){
    let _this = this;
    api.post("/app/v1/mini/getMyCommentList", {
      "pageNum":_this.data.pageNum,
      "pageSize":_this.data.pageSize
    }).then(res => {

          if (res.total <= _this.data.list.length) {
            return
          }

        if(res.data.rows.length>0){
          res.data.rows.forEach(element => {

            if(element.goods.title.length>12){
              element.goods.title = element.goods.title.substring(0,12)+"..."
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