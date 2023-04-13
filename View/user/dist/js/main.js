var userCore = function (controller) {
	return userCore.fn.init(controller);
}

userCore.fn = userCore.prototype = {
	init: function () {
		this.setupSlide = this.setupSlide.bind(this);
		this.typingInput = this.typingInput.bind(this);

		this.autoFormatCurrentcy();

		if (window.outerWidth <= 1024) {
			new Mmenu( "#menu", {
		     	"offCanvas": {
		        	"position": "left"
		     	},
	     		"theme": "light",	
			});
		}

		$(this.target.btnPinToTop).unbind().click(function() {
			$("html, body").animate({ scrollTop: 0 }, "slow");
		});
	},

	target: {
		btnPinToTop: '#pin-to-top',
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

	setupSlide(target, config, ismount) {
		config = $.extend({}, config);

		let slide = new Splide(target, config);

		if (ismount == undefined || ismount == true) {
			slide.mount();
		}

		return slide;
	},

	typingInput($dom, arr_text, n, k)
	{
		let self = this;

		if (arr_text[k] != undefined) {
			if (n == 0) {
				document.getElementById($dom).placeholder = '';
			}
		
			text = arr_text[k];

			$dom = $dom.replace('.', '');

			if (n <= text.length) {
				document.getElementById($dom).placeholder += text.charAt(n);
				
				if (text.length <= n) {
					k++;
					n = 0;
				} else {
					n++;
				}

				setTimeout(function() {
					self.typingInput($dom, arr_text, n, k);
				}, 250);
		    }
		}
	},
}