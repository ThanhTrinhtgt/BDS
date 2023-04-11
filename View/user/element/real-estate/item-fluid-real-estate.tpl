<div class="card mb-3 item-box-shadow">
	<div class='row'>
		<div class='col-8'>
			<a href='{{ item.url }}' class="text-decoration-none">
				<img src="{{ item.img_url }}" class="card-img-top" alt="{{ item.name }}">
			</a>
		</div>

		<div class='col-4'>
		</div>
	</div>

	<div class="card-body p2">
		<a href='{{ item.url }}' class="text-decoration-none">
			<h3 class="title-real-estate">
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

		<div class="short-desc-real-estate">
			{{ item.short_desc }}
		</div>
	</div>
</div>