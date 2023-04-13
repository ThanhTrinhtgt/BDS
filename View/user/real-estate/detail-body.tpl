<div class='mb-3'>
	{% include "user/real-estate/splider.tpl" with {'data' : data} %}
</div>

<div class='form-group'>
	<h3>{{ data.name }}</h3>
	<p><i class="fas fa fa-location-dot"></i>&nbsp;{{ data.address }}</p>
</div>

<div class="card">
	<div class="card-header">
		<h4>{{ l('feature_bds') }}</h4>
	</div>
	<div class="card-body">
    	<div class="row">
			<div class="col-4">
				{{ l('num_bed') }}: {{ data.num_bedroom }}
			</div>
			<div class="col-4">
				{{ l('num_floor') }}: {{ data.num_floor }}
			</div>
			<div class="col-4">
				{{ l('num_toilet') }}: {{ data.num_toilet }}
			</div>
			<div class="col-4">
				{{ l('area') }}: {{ data.area }} {{ data.unit_are }}
			</div>
			<div class="col-4">
				{{ l('price') }}: {{ data.price }}
			</div>
		</div>
	</div>
</div>

<div class='card mt-2'>
	<div class="card-header">
		<h4>{{ l('describe') }}</h4>
	</div>
	<div class="card-body">
		{{ data.desc|raw }}
	</div>
</div>