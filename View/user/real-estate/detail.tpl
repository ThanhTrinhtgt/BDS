{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<h3>{{ data.name }}</h3>
		<img src='{{ data.img_url }}'/>

		<div class="accordion" id="accordionExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						Mô tả
					</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
				    	{{ data.desc|raw }}
					</div>
				</div>
			</div>
		</div>
	</div>
{% endblock %}