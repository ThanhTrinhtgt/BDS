var BDScore = function () {
	return BDScore.fn.init();
}

BDScore.fn = BDScore.prototype = {
	init: function () {

		this.eventForm    = this.eventForm.bind(this);
		this.eventList    = this.eventList.bind(this);
		this.buildSeoName = this.buildSeoName.bind(this);
		this.submitForm   = this.submitForm.bind(this);
		this.eventFormAddress   = this.eventFormAddress.bind(this);
	},

	fieldForm:  	 '.bds-field-form',
	mainForm:   	 '.bds-main-form',
	btnSubmit:  	 '.bds-submit-form',
	btnBuilSeoName:  '.bds-build-seo-name',
	btnDeleteItem:   '.bds-delete-object',
	btnExportAddress:'#btn-export-addres',
	targetProvince:  '[name="province_id"]',
	targetDistrict:  '[name="district_id"]',
	targetWard:      '[name="ward_id"]',

	inputFormatCurrentcy:  '.bds-format-currentcy',

	varSetTimeout: null,

	eventForm(controller) {
		this.buildSeoName();
		this.submitForm(controller);
		this.autoFormatCurrentcy();

		if ($('#ckeditor').length > 0) {
			CKEDITOR.replace( 'ckeditor' );
		}
	},

	eventList() {
		this.eventDeleteItemForm();
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

	submitForm(controller) {
		let self = this;

		$(this.btnSubmit).unbind().click(function() {
			let form = {};
			let formData = new FormData($(self.mainForm)[0]);

			if (formData.has('desc')) {
				formData.set('desc', CKEDITOR.instances.ckeditor.getData());
			}

			Core.post(
				'/admin/' + controller + '/save-json',
				{
					data: formData
				},
				function () {
					window.location.reload();
				}
			);
		});
	},

	eventFormAddress() {
		let self = this;

		$(this.targetProvince).unbind().change(function() {
			let province_id = $(this).val();

			Core.jsonPost(
				'/admin/district/get-list-by-province-json',
				{
					data: {province_id: province_id},
				},
				function ($resp) {
					$(self.targetDistrict).html('<option value="0">Chọn quận</option>');

					$resp.data.forEach((item) => {
						$(self.targetDistrict).append('<option value="'+item.id+'">'+item.name+'</option>');
					});
				}
			);
		});

		$(this.targetDistrict).unbind().change(function() {
			let district_id = $(this).val();

			Core.jsonPost(
				'/admin/ward/get-list-by-district-json',
				{
					data: {district_id: district_id},
				},
				function ($resp) {
					$(self.targetWard).html('<option value="0">Chọn phường xã</option>');

					$resp.data.forEach((item) => {
						$(self.targetWard).append('<option value="'+item.id+'">'+item.name+'</option>');
					});
				}
			);
		});
	},

	exportAddress() {
		let self = this;

		$(this.btnExportAddress).unbind().click(function() {
			let value = $(this).val();
			

			Core.post(
				'/admin/' + value + '/export-address-json',
				{},
				function () {
					window.location.reload();
				}
			);
		});
	},

	eventDeleteItemForm(controller) {
		let self = this;

		$(this.btnDeleteItem).unbind().click(function () {
			if ($(this).data('id') != undefined) {
				Core.post('/admin/' + controller + '/delete', 
					{'id': $(this).data('id'), 'contentType': 'json'}
				);
			}
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