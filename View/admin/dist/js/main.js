var BDScore = function (controller) {
	return BDScore.fn.init(controller);
}

BDScore.fn = BDScore.prototype = {
	init: function (controller) {
		this.controller = controller;

		this.eventForm    = this.eventForm.bind(this);
		this.buildSeoName = this.buildSeoName.bind(this);
		this.submitForm   = this.submitForm.bind(this);
	},

	fieldForm:  	 '.bds-field-form',
	mainForm:   	 '.bds-main-form',
	btnSubmit:  	 '.bds-submit-form',
	btnBuilSeoName:  '.bds-build-seo-name',

	inputFormatCurrentcy:  '.bds-format-currentcy',

	controller: 	 '',
	varSetTimeout: null,

	eventForm() {
		this.buildSeoName();
		this.submitForm();
		this.autoFormatCurrentcy();

		CKEDITOR.replace( 'ckeditor' );
	},

	buildSeoName() {
		let self = this;
		
		$(self.btnBuilSeoName).unbind().click(function(e) {
			e.preventDefault();

			let $form        = $(this).parents('form');
			let inputSeoName = $form.find('[name="seo_name"]');
			let inputName    = $form.find('[name="name"]');

			if ($form != undefined) {
				if (inputSeoName != undefined && inputName != undefined) {
					let newSeoName = inputName.val();
					
					inputSeoName.val(self.convertAscii(newSeoName, true));
				}
			}
		});
	},

	submitForm() {
		let self = this;

		$(this.btnSubmit).unbind().click(function() {
			let form = {};
			let formData = new FormData($(self.mainForm)[0]);

			formData.set('desc', CKEDITOR.instances.ckeditor.getData());

			$.ajax({
			   	url: 'http://bds544.com/admin/' + self.controller + '/save-json',
			   	data: formData,
			   	method: 'post',
			   	async: true,
			   	cache: false,
				contentType: false,
				processData: false,
				timeout: 6000
			}).then(function(data) {
				if (data != undefined) {
					data = JSON.parse(data);
				}

			    if (data.code != undefined) {
			    	let $mess = data.message != undefined ? data.message : '';

			      	$(document).Toasts('create', {
				        class: data.code == 200 ? 'bg-success' : 'bg-danger',
				        title: 'Lưu thông tin',
				        body: $mess
				    })

				    if (data.code == 200) {
				    	window.location.reload();
				    }
			    }
			});
		});
	},

	autoFormatCurrentcy() {
		let self = this;

		$(this.inputFormatCurrentcy).each(function () {
			if ($(this).val() != '') {
				$(this).val(numeral($(this).val()).format('0,0'));
			}
		});

		$(this.inputFormatCurrentcy).keydown(function () {
			clearTimeout(self.varSetTimeout);

			if ($(this).val() != '') {
				let $this = $(this);

				self.varSetTimeout = setTimeout(function() {
					$this.val(numeral($this.val()).format('0,0'));
				}, 300);
			}
		});
	},

	convertAscii(text, strtolower) {
		/*aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬ
		đĐ
		eEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆ
		iIìÌỉỈĩĨíÍịỊ
		oOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢ 
		UùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰ
		yYỳỲỷỶỹỸýÝỵỴ*/

		if (!text || text == undefined || text == null) {
			return '';
		}

		text = text.replace(/(À|Ả|Ã|Á|Ă|Ằ|Ẳ|Ẵ|Ắ|Ặ|Â|Ầ|Ẩ|Ẫ|Ấ|Ậ)/ig, "A");
		text = text.replace(/(à|ả|ã|á|ạ|ă|ằ|ẳ|ẵ|ắ|ặ|â|ầ|ẩ|ẫ|ấ|ậ)/ig, "a");
		text = text.replace(/(đ)/ig, "d");
		text = text.replace(/(Đ)/ig, "D");
		text = text.replace(/(È|Ẻ|Ẽ|É|Ẹ|Ê|Ề|Ể|Ễ|Ế|Ệ)/ig, "E");
		text = text.replace(/(è|ẻ|ẽ|é|ẹ|ê|ề|ể|ễ|ế|ệ)/ig, "e");
		text = text.replace(/(Ì|Ỉ|Ĩ|Í|Ị)/ig, "I");
		text = text.replace(/(ì|ỉ|ĩ|í|ị)/ig, "i");
		text = text.replace(/(Ò|Ỏ|Õ|Ó|Ọ|Ô|Ồ|Ổ|Ỗ|Ố|Ộ|Ơ|Ờ|Ở|Ỡ|Ớ|Ợ)/ig, "O");
		text = text.replace(/(ò|ỏ|õ|ó|ọ|ô|ồ|ổ|ỗ|ố|ộ|ơ|ờ|ở|ỡ|ớ|ợ)/ig, "o");
		text = text.replace(/(Ù|Ủ|Ũ|Ú|Ụ|Ư|Ừ|Ử|Ữ|Ứ|Ự)/ig, "U");
		text = text.replace(/(ù|ủ|ũ|ú|ụ|ư|ừ|ử|ữ|ứ|ự)/ig, "u");
		text = text.replace(/(Ỳ|Ỷ|Ỹ|Ý|Ỵ)/ig, "Y");
		text = text.replace(/(ỳ|ỷ|ỹ|ý|ỵ)/ig, "y");

		if (strtolower == true) {
			text =  text.toLowerCase();
		}

		text = text.replace(/(\s)+/ig, "-");

		return text;
	},
}