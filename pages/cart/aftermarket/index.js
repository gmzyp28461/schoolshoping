// pages/user/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    news:"",
    content:'说点什么',
    userId:"1",
    kefuId:'2',
    hasRead:"0",
    delFlag:"0",
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  //   var that=this;
    
       
  //    var  news={
  //         type: 0,//0是连接消息，1是发送消息
  //         chatRecord:{
  //           content: that.data.content,//聊天内容
  //           userId:that.data.userId
  //   }
  // }
  //        wx.sendSocketMessage(
  //             {
  //              data: JSON.stringify(news) 
  //             }
  //             );
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

  // send:function(){
  //   var that=this;
  //     var news= that.data.news
  //      news={
  //         type: 1,//0是连接消息，1是发送消息
  //         chatRecord:{
  //           content: that.data.content,//聊天内容
  //           userId:that.data.userId,//用户id
  //           kefuId:that.data.kefuId,//好友id
  //   //         hasRead:that.data.hasRead,//是否已读
  //   //         isMyselfSend:'1',//是否是我自己
  //   //         deFlag:'',//是否删除
  //         }
  //        
  //       };
  //     console.log(news)
  //     wx.sendSocketMessage(
  //         {
  //          data: JSON.stringify(news) 
  //         }
  //         );
  // },
  // reviceMessage:function(){
  //   wx.onSocketMessage(function(data) {
  //           var objData = JSON.parse(data.data);
  //           console.log("聊天消息",objData)
  //           var newChatList = [...that.data.newsList,objData.chatRecord];
  //           console.log(newChatList)
  //           that.setData({
  //           newsList:newChatList
  //           })
  //           console.log(data);
  //         })
  // },
  
})