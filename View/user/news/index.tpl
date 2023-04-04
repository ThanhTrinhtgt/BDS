{% extends "user/layout.tpl" %}
{% block content %}
	<section class="container">
		<h1>Tin tức</h1>
	</section>

	<section class="container">
		<div class='row m-0'>
			{% set first_news = new_news|first %}
			<div class="col-8" style='background-image: url("{{ first_news.img_url }}");'>
				<h3>{{ first_news.name }}</h3>
				<p class='m-0'>{{ first_news.short_desc }}</p>
			</div>

			<div class="col-4">
				{% for key, item in new_news %}
					{% if item.id != first_news.id %}
						<div>
							<h3>{{ item.name }}</h3>
							<p class='m-0'>{{ item.short_desc }}</p>
						</div>
					{% endif %}
				{% endfor %}
			</div>
		</div>
	</section>

	<section class="container">
		<div class='row m-0'>
			{% for item in news %}
				{% include "user/news/item.tpl" with {'data' : item} %}
			{% endfor %}
		</div>
	</section>
{% endblock %}