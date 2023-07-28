import {request} from "../../request/index.js";
Page({
  data: {
    username: "",
    password: "",
    age: "",
    phone: "",
    address: "",
    url: "",
    isTabBar: 0
  },

  onLoad: function (options) {
    let url = options.url.replace("$", "?").replace("-","=");
    let isTabBar = options.isTabBar;
    this.setData({
      username: "",
      password: "",
      age: "",
      phone: "",
      address: "",
      url: url,
      isTabBar: isTabBar
    })
  },

  onName(e) {
    this.setData({
      username: e.detail.value
    })
  },

  onPassword(e) {
    this.setData({
      password: e.detail.value
    })
  },

  onAge(e) {
    this.setData({
      age: e.detail.value
    })
  },

  onPhone(e) {
    this.setData({
      phone: e.detail.value
    })
  },
  onAddress(e) {
    this.setData({
      address: e.detail.value
    })
  },

  register(e) {
    let url = this.data.url;
    let isTabBar = this.data.isTabBar;
    let data = {name:this.data.username, password: this.data.password, age: this.data.age, phone: this.data.phone, address: this.data.address}
    request({url:"/register", data:data, method:"POST"}).then(res => {
      if (res.code === "0") {
        wx.showToast({
          title: '注册成功',
          mask: true
        })
        // 存到localStorage里
        wx.setStorageSync('user', res.data)
        setTimeout(() => {
          if (isTabBar === "0") {
            wx.navigateTo({
              url: url,
            })
          } else {
            wx.switchTab({
              url: url,
            })
          }
        }, 1500);
      } else {
        wx.showToast({
          title: res.msg,
          mask: false
        })
      }
    })
  }
})