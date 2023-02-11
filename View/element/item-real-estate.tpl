<div class="card">
	<img src="{{ item.img_url }}" class="card-img-top" alt="{{ item.name }}">
	<div class="card-body">
		<h5 class="card-title color-red">
			{{ item.name }}
			{% if item.type == 1 %}    
			    <span class="badge bg-primary">Tin mới</span>
	        {% elseif item.type == 2 %}
			        <span class="badge bg-danger">Tin hot</span>
			{% endif %}
		</h5>
		<p class="card-text">
			{% if item.price is not empty and item.unit is not empty %}
				<span class='format-curentcy'>{{ item.price }}</span> {{ item.unit }}
			{% else %}
				<a href='#'>Liên hệ</a>
			{% endif %}
			&nbsp;&nbsp;
			{% if item.area is not empty and item.area > 0 %}
				{{ item.area }} m<sup>2</sup>
			{% endif %}
		</p>
		<p class="card-text">{{ item.short_desc }}</p>
	</div>
</div>