var userCore = function (controller) {
	return userCore.fn.init(controller);
}

userCore.fn = userCore.prototype = {
	init: function () {
		this.setupSlide = this.setupSlide.bind(this);

		this.autoFormatCurrentcy();

		if (window.outerWidth <= 1024) {
			new Mmenu( "#menu", {
	     	"offCanvas": {
	        "position": "left"
	     	},
	     	"theme": "white",
	     	navbars	: {
					content: [ "prev", "title" ]
				},
				setSelected	: {
					hover: true
				}
			});
		}

		
	},

	inputFormatCurrentcy:  	 '.format-curentcy',
	varSetTimeout: null,

	autoFormatCurrentcy() {
		let self = this;

		$(this.inputFormatCurrentcy).each(function () {
			if ($(this).text() != '') {
				$(this).text(numeral($(this).text()).format('0,0'));
			}
		});
	},

	setupSlide(target, config) {
		config = $.extend({}, config);

		new Splide(target, config).mount();
	},
}