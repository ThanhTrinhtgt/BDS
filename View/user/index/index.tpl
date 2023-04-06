{% extends "user/layout.tpl" %}
{% block content %}
	<section class="container-fluid mb-3" id='content-banner-index'>
		{% if banner_slide is not empty %}
		<div class="splide" id='splide1' data-splide='{"type":"loop","perPage":3}'>
		  	<div class="splide__track">
				<ul class="splide__list">
					{% for item in banner_slide %}
					<li class="splide__slide">
						<img src='{{ item.img_url }}'/>
					</li>
					{% endfor %}
				</ul>
		  	</div>
		</div>
		{% endif %}
	</section>

	<section class="container-fluid mb-3">
		<div class="row">
			{% for item in real_estate %}
				<div class="col-3 mb-2">
					{% include "user/index/item-real-estate.tpl" with {'item' : item} %}
			    </div>
			{% endfor %}
		</div>
	</section>

	<section class="container-fluid mb-3">
		{% include "user/index/slider-footer.tpl" with {'data' : news} %}
	</section>
{% endblock %}

{% block contentJs %}
    core.setupSlide('#splide1');
    core.setupSlide('#splide2');
    core.typingInput('input-search-keyword', ['Đường Phú Mỹ Hưng', 'Bùi Văn Ba', 'Huỳnh Tấn Phát'], 0, 0);
{% endblock %}