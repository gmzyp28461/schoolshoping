// pages/pay/index.js
import Toast from '../../../miniprogram_npm/@vant/weapp/toast/toast'
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    baseUrl: app.globalData.baseUrl,
    title:'张三 020-81167888',
    label:'广东省 广州市 海珠区 新港中路397号',
    cartList: [],
    address:{"errMsg":"chooseAddress:ok","userName":"张三","nationalCode":"510000","telNumber":"020-81167888","postalCode":"510000","provinceName":"广东省","cityName":"广州市","countyName":"海珠区","detailInfo":"新港中路397号"},
    vipcode:'',
    priceAll: 0.00,
    priceAll2: 0.00,
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  //  let addressTitle =wx.getStorageSync('addressTitle');
  //  let addressLabel =wx.getStorageSync('addressLabel');
  //  let address = wx.getStorageSync('address');
  //  if(this.data.title || this.data.label){
    //  this.setData({
    //   title:addressTitle,
    //   label:addressLabel,
    //   address
    //  })
  //  }
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
    
    let pages = getCurrentPages();
    let Page = pages[pages.length - 1];//当前页
    let prevPage = pages[pages.length - 2];  //上一个页面
    this.setData({
      cartList:prevPage.data.cartList,
      priceAll:prevPage.data.priceAll,
      priceAll2:prevPage.data.priceAll
    })
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
  onSubmit:function(){
    let _this =this;
    if(_this.data.address== ''){
      Toast("请选择收货地址")
      return;
    }

    let goodsStr="";
    if (_this.data.cartList.length > 0) {
      _this.data.cartList.forEach((element, index) => {
        if (element.checked) {
          goodsStr+=element.uuid+"@@@"+element.goodsId+"@@@"+element.num+"###"
        }
      });
    }

    if(goodsStr==''){
        return;
    }

    let param={
      vipcode:_this.data.vipcode,
      goodsStr:goodsStr,
      userName:_this.data.address.userName,
      postalCode:_this.data.address.postalCode,
      provinceName:_this.data.address.provinceName,
      cityName:_this.data.address.cityName,
      countyName:_this.data.address.countyName,
      detailInfo:_this.data.address.detailInfo,
      nationalCode:_this.data.address.nationalCode,
      telNumber:_this.data.address.telNumber
    }

    api.post("/app/v1/pay/createOrder", param).then(res => {

      
      if(res.data.code==500){
        Toast(res.data.msg)
        return;
      }
        //
        wx.showToast({ //提示信息
          title: '下单成功,再逛逛其他的吧',
          icon: 'none',
          duration: 1000
        });


        setTimeout(()=>{
          let fee = _this.data.priceAll2/100;
          console.log(fee)
          wx.navigateTo({
              url: '/pages/cart/payNowIn/index?fee=' + fee,
           })
        },1000)

        // setTimeout(function(){
        //   let fee = this.data.priceAll
        //   wx.switchTab({
        //     url: '/pages/cart/payIn/index?fee=' + fee,
        //   })

        // },2000)
       
        //



    });


  },
  chooseAddress: function () {
    let _this = this;
    wx.chooseAddress({
      success(res) {
        _this.setData({
          title:res.userName+"  "+res.telNumber,
          label:res.provinceName+" "+res.cityName+" "+res.countyName+" "+res.detailInfo,
          address: res
        })
        // wx.setStorageSync('addressTitle', res.userName+"  "+res.telNumber)
        // wx.setStorageSync('addressLabel', res.provinceName+" "+res.cityName+" "+res.countyName+" "+res.detailInfo)
        // wx.setStorageSync('address', res)
        // console.log(res.userName)
        // console.log(res.postalCode)
        // console.log(res.provinceName)
        // console.log(res.cityName)
        // console.log(res.countyName)
        // console.log(res.detailInfo)
        // console.log(res.nationalCode)
        // console.log(res.telNumber)
      }
    })
  },

  //打折
  countnum (){
    if(this.data.vipcode == 123123||this.data.vipcode == 887033){
      // console.log('code触发了')
      this.setData({
        priceAll2:this.data.priceAll * 0.9
      })
    }
    else if(this.data.vipcode == ''){
      return
    }
    else{
      console.log("不存在")
      wx.showToast({
        title: '折扣码不存在',
        icon:'none'
      })
    }
  }
  
})











