{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<div class='row m-0'>
			<div class='col-9'>
				{% include "user/element/real-estate/detail-body.tpl" with {'data' : data} %}
			</div>

			<div class='col-3'>
				{% include "user/element/real-estate/detail-sidebar.tpl" with {'data' : data, 'list_hot': list_hot} %}
			</div>
		</div>
	</div>
{% endblock %}

{% block contentJs %}
	let mailSlide = core.setupSlide('#main-carousel', {
	    type      : 'fade',
	    rewind    : true,
	    pagination: false,
	    arrows    : false,
  	}, false);

    let thumbnails = core.setupSlide('#thumbnail-carousel', {
		fixedWidth  : 100,
		fixedHeight : 60,
		gap         : 10,
		rewind      : true,
		pagination  : false,
		isNavigation: true,
		breakpoints : {
			600: {
			  fixedWidth : 60,
			  fixedHeight: 44,
			},	
		},
	}, false);

	mailSlide.sync( thumbnails );
	mailSlide.mount();
	thumbnails.mount();
{% endblock %}