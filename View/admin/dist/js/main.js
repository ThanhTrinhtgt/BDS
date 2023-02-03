let fieldForm = '.bds-field-form';
let mainForm  = '.bds-main-form';
let btnSubmit = '.bds-submit-form';


jQuery(function() {
	$(btnSubmit).unbind().click(function() {
		let form = {};

		$(mainForm + ' ' + fieldForm).each(function() {
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
		   url: 'http://bds544.com/admin/news/save-json',
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
		    }
		});
	});

	CKEDITOR.replace( 'ckeditor' );
})