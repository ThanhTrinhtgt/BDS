var BDScore = function (controller) {
	return BDScore.fn.init(controller);
}

BDScore.fn = BDScore.prototype = {
	init: function (controller) {
		this.controller = controller;

		this.eventForm    = this.eventForm.bind(this);
		this.eventList    = this.eventList.bind(this);
		this.buildSeoName = this.buildSeoName.bind(this);
		this.submitForm   = this.submitForm.bind(this);
	},

	fieldForm:  	 '.bds-field-form',
	mainForm:   	 '.bds-main-form',
	btnSubmit:  	 '.bds-submit-form',
	btnBuilSeoName:  '.bds-build-seo-name',
	btnDeleteItem:   '.bds-delete-object',

	inputFormatCurrentcy:  '.bds-format-currentcy',

	controller: 	 '',
	varSetTimeout: null,

	eventForm() {
		this.buildSeoName();
		this.submitForm();
		this.autoFormatCurrentcy();

		CKEDITOR.replace( 'ckeditor' );
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

	submitForm() {
		let self = this;

		$(this.btnSubmit).unbind().click(function() {
			let form = {};
			let formData = new FormData($(self.mainForm)[0]);

			formData.set('desc', CKEDITOR.instances.ckeditor.getData());

			Core.post(
				'http://bds544.com/admin/' + self.controller + '/save-json',
				{
					data: formData
				},
				function () {
					window.location.reload();
				}
			);
		});
	},

	eventDeleteItemForm() {
		let self = this;

		$(this.btnDeleteItem).unbind().click(function () {
			if ($(this).data('id') != undefined) {
				Core.post('/admin/' + self.controller + '/delete', 
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

		text = text.replace(/(??|???|??|??|??|???|???|???|???|???|??|???|???|???|???|???)/ig, "A");
		text = text.replace(/(??|???|??|??|???|??|???|???|???|???|???|??|???|???|???|???|???)/ig, "a");
		text = text.replace(/(??)/ig, "d");
		text = text.replace(/(??)/ig, "D");
		text = text.replace(/(??|???|???|??|???|??|???|???|???|???|???)/ig, "E");
		text = text.replace(/(??|???|???|??|???|??|???|???|???|???|???)/ig, "e");
		text = text.replace(/(??|???|??|??|???)/ig, "I");
		text = text.replace(/(??|???|??|??|???)/ig, "i");
		text = text.replace(/(??|???|??|??|???|??|???|???|???|???|???|??|???|???|???|???|???)/ig, "O");
		text = text.replace(/(??|???|??|??|???|??|???|???|???|???|???|??|???|???|???|???|???)/ig, "o");
		text = text.replace(/(??|???|??|??|???|??|???|???|???|???|???)/ig, "U");
		text = text.replace(/(??|???|??|??|???|??|???|???|???|???|???)/ig, "u");
		text = text.replace(/(???|???|???|??|???)/ig, "Y");
		text = text.replace(/(???|???|???|??|???)/ig, "y");

		if (strtolower == true) {
			text =  text.toLowerCase();
		}

		text = text.replace(/(\s)+/ig, "-");

		return text;
	},
}