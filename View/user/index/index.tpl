{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container-fluid" id='content-banner-index'>
		
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
	<section class="splide" aria-label="Splide Basic HTML Example">
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