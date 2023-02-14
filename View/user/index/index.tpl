{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container-fluid" id='content-banner-index'>
		{% if banner is not empty %}
		<section class="splide" aria-label="Splide Basic HTML Example">
		  	<div class="splide__track">
				<ul class="splide__list">
					{% for item in banner %}
					<li class="splide__slide">
						<img src='{{ item.img_url }}'/>
					</li>
					{% endfor %}
				</ul>
		  	</div>
		</section>
		{% endif %}
	</div>
	<div class="container">
		<div class="row">
			{% for item in real_estate %}
				<div class="col-3">
					{% include "element/item-real-estate.tpl" with {'item' : item} %}
			    </div>
			{% endfor %}
		</div>
	</div>
	<section class="splide2" aria-label="Splide Basic HTML Example">
	  <div class="splide__track">
			<ul class="splide__list">
				<li class="splide__slide">Slide 01</li>
				<li class="splide__slide">Slide 02</li>
				<li class="splide__slide">Slide 03</li>
			</ul>
	  </div>
	</section>
{% endblock %}
{% block contentJs %}
<script>
    let core = new userCore();

    core.setupSlide('.splide');
</script>
{% endblock %}