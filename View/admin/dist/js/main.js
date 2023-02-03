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

		console.log(form);

		$.ajax({
		   url: 'http://bds544.com/admin/news/save',
		   data: form,
		   method: 'post'
		});
	});

	CKEDITOR.replace( 'ckeditor' );
})