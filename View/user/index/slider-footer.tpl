<div class='splide' id="splide2" data-splide='{"type":"loop","perPage":3}'>
  	<div class="splide__track">
		<ul class="splide__list">
			{% for item in data %}
				<li class="splide__slide p-3">
					<a href='{{ item.url }}'>
						<img src='{{ item.img_url }}'/>
						<h3>{{ item.name }}</h3>
					</a>
				</li>
			{% endfor %}
		</ul>
  	</div>
</div>