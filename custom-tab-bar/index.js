Component({
	data: {
		active: 0,
		list: [
			{
				icon: 'home-o',
				text: '首页',
				url: '/pages/index/index'
			},
			{
				icon: 'apps-o',
				text: '分类',
				url: '/pages/type/home/index'
			},
			{
				icon: 'cart-o',
				text: '购物车',
				url: '/pages/cart/home/index'
			},
			{
				icon: 'friends-o',
				text: '我的',
				url: '/pages/mine/home/index'
			}
		]
	},

	methods: {
		onChange(event) {
		

			this.setData({ active: event.detail });

			if(event.detail>1){
				let accessToken = wx.getStorageSync('token');
        if (accessToken == null || accessToken == '') {
						wx.navigateTo({
							url: '/pages/mine/accesstoken/index',
						})
				}else{
					wx.switchTab({
						url: this.data.list[event.detail].url
					});
				}

			}else{
				wx.switchTab({
					url: this.data.list[event.detail].url
				});
			}	
		},

		init() {
			const page = getCurrentPages().pop();
			this.setData({
				active: this.data.list.findIndex(item => item.url === `/${page.route}`)
			});
		}
	}
});
