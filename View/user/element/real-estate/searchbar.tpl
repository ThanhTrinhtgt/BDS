<div class='row' id='searchbar'>
	<div class='col-3'>
		<select class='item-field-search'>
			{% for item in province %}
				
			{% endfor %}
		</select>
	</div>

	<div class='col-2'>
		<button type="button" class="btn btn-primary">
			<i class='fas fa-search'></i>&nbsp;
			{{ l('search') }}
		</button>
	</div>
</div>