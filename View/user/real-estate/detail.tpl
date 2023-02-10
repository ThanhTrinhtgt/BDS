{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<h3>{{ data.name }}</h3>
		<img src='{{ data.img_url }}'/>

		<div class="accordion" id="accordionExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
						Thông tin
					</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
				    	<div class="row">
							<div class="col-4">
								Số phòng: {{ data.num_bedroom }}
							</div>
							<div class="col-4">
								Số tầng: {{ data.num_floor }}
							</div>
							<div class="col-4">
								Số wc: {{ data.num_toilet }}
							</div>
							<div class="col-4">
								Diện tích: {{ data.area }}
							</div>
							<div class="col-4">
								Giá: {{ data.price }}
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne2">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne2" aria-expanded="true" aria-controls="collapseOne">
						Mô tả
					</button>
				</h2>
				<div id="collapseOne2" class="accordion-collapse collapse" aria-labelledby="headingOne2" data-bs-parent="#accordionExample">
					<div class="accordion-body">
				    	{{ data.desc|raw }}
					</div>
				</div>
			</div>
		</div>
	</div>
{% endblock %}