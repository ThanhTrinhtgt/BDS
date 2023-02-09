var BDScore = function (controller) {
	return BDScore.fn.init(controller);
}

BDScore.fn = BDScore.prototype = {
	init: function (controller) {
		console.log(controller);
		this.controller = controller;

		this.eventForm = this.eventForm.bind(this);
	},

	fieldForm:  '.bds-field-form',
	mainForm:   '.bds-main-form',
	btnSubmit:  '.bds-submit-form',
	controller: '',

	eventForm() {
		let self = this;

		$(this.btnSubmit).unbind().click(function() {
			let form = {};

			$(self.mainForm + ' ' + self.fieldForm).each(function() {
				let val = '';
				let name = $(this).attr('name');

				if ($(this).data('ckeditor') != undefined) {
					val = CKEDITOR.instances.ckeditor.getData();
				} else {
					val = $(this).val();
				}

				form[name] = val;	
			});

			$.ajax({
			   url: 'http://bds544.com/admin/' + self.controller + '/save-json',
			   data: form,
			   method: 'post'
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

		CKEDITOR.replace( 'ckeditor' );
	},
}