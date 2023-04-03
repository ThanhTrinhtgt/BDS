{% block content %}
	<div class="col-12">
		<div class='row m-0'>
			<img src='{{ data.img_url }}' class='col-3'/>

			<div class='col-9'>
				<h3>{{ data.name }}</h3>
				<p class='m-0'>{{ data.short_desc }}</p>
			</div>
		</div>
	</div>
{% endblock %}