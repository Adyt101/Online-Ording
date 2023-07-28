import {request} from "../../request/index.js";
import {config} from '../../request/config';

Page({
   /**
   * 页面的初始数据
   */
  data: {
    addressList: []       //存放地址列表
  },

  /**
   * 生命周期函数--监听页面显示
   */
  //小程序启动，或从后台进入前台时显示
  onShow: function () {
    this.getAddressData();
  },

  //
  getAddressData() {
    let user = wx.getStorageSync('user');
    let url = "/addressInfo/all/" + user.id;
    request({url: url}).then(res => {
      if (res) {
        this.setData({
          addressList: res.data
        })
      } else {
        console.log(res.data.msg)
      }
    })
  }, 

  /**
   * 点击项目,返回选择后的收货地址对象
   */
  onItemClick: function(e){
    let item = this.data.addressList[e.currentTarget.dataset.index];
    let pages = getCurrentPages();        //获取当前页面js里面的pages里的所有信息
    let prevPage = pages[pages.length-2];   //prevPage是获取上一个页面的js里面的pages的所有信息。-2是上一个页面，-3上上个页面
    prevPage.setData({
      addressInfo: item
    });
    //跳转回上一页
    wx.navigateBack({
      delta: 1
    })
  },

  /**
   * 长按项目 ，删除当前所选的地址
   */
  onItemLongClick: function(e){
    var that = this;
    let item = this.data.addressList[e.currentTarget.dataset.index];
    wx.showModal({
      title: '删除确认',
      content: '您确定要删除该地址吗？',
      confirmText: '删除',
      success: function(res){
        if(res.confirm){
          let url = "/addressInfo/" + item.id;
          request({url: url, method:"DELETE"}).then(res => {
            if (res) {
              wx.showToast({
                title: '删除成功',
                mask: true
              })
              that.getAddressData();
            } else {
              console.log(res.data.msg)
            }
          })
        }
      }
    })
  },

  /**
   * 编辑
   */
  editItem: function(e){
    let item = this.data.addressList[e.currentTarget.dataset.index];
    //跳转到修改页面
    wx.navigateTo({
      url: '../addressOperate/addressOperate?id='+item['id'],
    })
  },

/**
   * 新增
   */
  showAddressAddView: function () {
    //跳转到修改页面
    wx.navigateTo({
      url: '../addressOperate/addressOperate',
    })
  }


});
