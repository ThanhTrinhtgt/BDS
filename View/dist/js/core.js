var Core = function () {
	return Core.fn.init();
}

Core.fn = Core.prototype = {
	init: function () {
		//this.get  = this.get.bind(this);
		this.post = this.post.bind(this);
	},

	post: function (url, config, callback) {
		let self = this;

		config = $.extend(true, {
			url: url,
			data: {},
			method: 'post',
			async: true,
		   	cache: false,
			contentType: false,
			processData: false,
			timeout: 6000
		}, config);

		$.ajax(config).then(function(data) {
			if (data != undefined) {
				data = JSON.parse(data);
			}

		    if (data.code != undefined) {
		    	let $mess = data.message != undefined ? data.message : '';

			    if (data.code == 200) {
		    		self.showMessSuccess('Thành công', $mess);

			    	if (typeof callback == 'function') {
				    	callback();
				    }
			    } else {
					self.showMessError('Thất bại', $mess);
			    }
		    }
		});
	},

	showMessSuccess: function (title, mess) {
		$(document).Toasts('create', {
	        class: 'bg-success',
	        title: title,
	        body: mess
	    })
	},

	showMessError: function (title, mess) {
		$(document).Toasts('create', {
	        class: 'bg-danger',
	        title: title,
	        body: mess
	    })
	},
}