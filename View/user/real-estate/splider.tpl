<section
  id="main-carousel"
  class="splide"
  aria-label="The carousel with thumbnails. Selecting a thumbnail will change the Beautiful Gallery carousel."
>
  <div class="splide__track">
		<ul class="splide__list">
			<li class="splide__slide">
				<img class='bds-img-item' src='{{ data.img_url }}'/>
			</li>
			{% if data.img_multi is not empty %}
				{% for img in data.img_multi %}
					<li class="splide__slide">
						<img src="{{ img.img_url }}" alt="">
					</li>
				{% endfor %}
			{% endif %}
		</ul>
  </div>
</section>

<section
  id="thumbnail-carousel"
  class="splide"
  aria-label="The carousel with thumbnails. Selecting a thumbnail will change the Beautiful Gallery carousel."
>
  <div class="splide__track">
		<ul class="splide__list">
			<li class="splide__slide">
				<img class='bds-img-item' src='{{ data.img_url }}'/>
			</li>
			{% if data.img_multi is not empty %}
				{% for img in data.img_multi %}
					<li class="splide__slide">
						<img src="{{ img.img_url }}" alt="">
					</li>
				{% endfor %}
			{% endif %}
		</ul>
  </div>
</section>
