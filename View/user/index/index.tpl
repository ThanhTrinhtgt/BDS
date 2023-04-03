{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container-fluid" id='content-banner-index'>
		{% if banner is not empty %}
		<section class="splide" id='splide1' aria-label="Splide Basic HTML Example">
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
	<section class='splide' id="splide2" data-splide='{"type":"loop","perPage":3}'>
	  <div class="splide__track">
			<ul class="splide__list">
				{% for item in news %}
					<li class="splide__slide p-3">
						<a href='{{ item.url }}'>
							<img src='{{ item.img_url }}'/>
							<h3>{{ item.name }}</h3>
						</a>
					</li>
				{% endfor %}
			</ul>
	  </div>
	</section>
{% endblock %}

{% block contentJs %}
<script>
    let core = new userCore();

    core.setupSlide('#splide1');
    core.setupSlide('#splide2');
</script>
{% endblock %}