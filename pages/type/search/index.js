// pages/type/search/index.js
const app = getApp();
const api = require("../../../utils/api.js");
Page({

  /**
   * 页面的初始数据
   */
  data: {
    searchText:'',
    hList: []
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {

    this.getStorageHistory();
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
  findSearch: function (e) {
    let _this = this;
    let title = e.currentTarget.dataset.title;
    _this.setData({
      searchText: title
    })
    _this.searchLibrary();
  },
  searchLibrary: function (e) {
    let _this = this;
    let searchText = e.detail.replace(/\s/g, "");
    if (searchText == '') { //搜索关键词为空
      wx.showToast({ //提示信息
        title: '请输入关键字',
        icon: 'none',
        duration: 1000
      });
    } else {

      _this.setData({
        searchText:searchText
      })


      wx.getStorage({ //从缓存中取搜索历史记录的数组
        key: 'search_cache',
        success(res) { //获取成功
          let list = res.data;
          for (let i in list) { //循环遍历
            if (list[i] == _this.data.searchText) { //如果缓存数组中有搜索关键词
              list.splice(i, 1) //删除数组中的该关键词
            }
          }
          list.unshift(_this.data.searchText); //将搜索关键词添加到数组开头
          list.splice(20) //只保留6个
          _this.data.hList = list;
          wx.setStorage({ //将新的数组存入缓存
            key: 'search_cache',
            data: _this.data.hList,
          });

          _this.setData({
            hList: list
          })

           wx.navigateTo({
            url: '/pages/type/list/index?searchValue=' + _this.data.searchText+"&title="+_this.data.searchText
          })
       

        
        },
        fail() { //没有获取到缓存
          _this.data.hList = [];
          _this.data.hList.push(_this.data.searchText);
          wx.setStorage({
            key: 'search_cache',
            data: _this.data.hList,
          });
          _this.setData({
            hList: _this.data.hList
          })

        }
      })
    }
  },
  removeHistory: function () {
    let _this = this;
    wx.removeStorage({
      key: 'search_cache',
      success: function (res) {
        wx.showToast({ //提示信息
          title: '清除成功',
          icon: 'none',
          duration: 1000
        });

        _this.setData({
          hList: []
        })


      }
    });
  },
  getStorageHistory: function () {
    let _this = this;
    wx.getStorage({ //从缓存中取搜索历史记录的数组
      key: 'search_cache',
      success(res) { //获取成功
        let list = res.data;
        for (let i in list) { //循环遍历
          if (list[i] == _this.data.searchText) { //如果缓存数组中有搜索关键词

            let searchText = _this.data.searchText.replace(/\s/g, "");
            if (searchText != '') {
              list.splice(i, 1) //删除数组中的该关键词
            }

          }
        }

        let searchText = _this.data.searchText.replace(/\s/g, "");
        if (searchText != '') {
          list.unshift(_this.data.searchText); //将搜索关键词添加到数组开头
         }
        list.splice(20) //只保留6个
        _this.setData({
          hList: list
        })

        wx.setStorage({ //将新的数组存入缓存
          key: 'search_cache',
          data: _this.data.hList,
        });
      }
    })
  },
})