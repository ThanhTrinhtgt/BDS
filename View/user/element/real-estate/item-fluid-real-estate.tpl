<div class="card mb-3 item-box-shadow">
	<div class='row m-0'>
		<div class='col-8 p-0'>
			<a href='{{ item.url }}' class="text-decoration-none">
				<img src="{{ item.img_url }}" class="card-img-top bd-tr-radius-0" alt="{{ item.name }}">
			</a>
		</div>

		<div class='col-4 d-flex flex-column p-0 m-0'>
		{% if item.img_multi is not empty %}
			{% for key, img in item.img_multi %}
				<div class='flex-1 bg-img-real-estate {% if key == 0 %}card-img-top bd-tl-radius-0{% endif %}' 
					style='background-image: url("{{ img.img_url }}")'>
				</div>
			{% endfor %}
		{% endif %}
		</div>
	</div>

	<div class="card-body p2">
		<a href='{{ item.url }}' class="text-decoration-none">
			<h3 class="title-real-estate m-0">
				{{ item.name }}
				{% if item.type == 1 %}    
				    <span class="badge bg-primary">{{ l('new_news') }}</span>
		        {% elseif item.type == 2 %}
				    <span class="badge bg-danger">{{ l('hot_news') }}</span>
				{% endif %}
			</h3>
		</a>
		
		<div class="card-text">
			{% if item.price is not empty and item.unit is not empty %}
				<span class='format-curentcy text-price me-1'>{{ item.price }}</span>{{ item.unit }}
			{% else %}
				<a href='#' class='text-price'>{{ l('contact') }}</a>
			{% endif %}

			&nbsp;

			{% if item.area is not empty and item.area > 0 %}
				<span>{{ item.area }} m<sup>2</sup></span>
			{% endif %}

			&nbsp;

			{% if item.num_bedroom is not empty and item.num_bedroom > 0 %}
				<span class='cursor-help' title='{{ item.num_bedroom }} {{ l('bedroom') }}'>
					<i class="fas fa-bed"></i> {{ item.num_bedroom }}
				</span>
			{% endif %}

			&nbsp;

			{% if item.num_toilet is not empty and item.num_toilet > 0 %}
				<span class='cursor-help' title='{{ item.num_toilet }} {{ l('toilet') }}'>
					<i class="fas fa-bath"></i> {{ item.num_toilet }}
				</span>
			{% endif %}

			&nbsp;

			{% if item.num_floor is not empty and item.num_floor > 0 %}
				<span class='cursor-help' title='{{ item.num_floor }} {{ l('floor') }}'>
					<i class="fas fa-building"></i> {{ item.num_floor }}
				</span>
			{% endif %}

			&nbsp;

			{% if item.legally is not empty and item.legally != 0 %}
				<span>
					<i class="fas fa-book-journal-whills"></i> {{ item.legally }}
				</span>
			{% endif %}
		</div>

		<div class="short-desc-real-estate short-desc-line">
			<i>{{ item.short_desc }}</i>
		</div>
	</div>
</div>