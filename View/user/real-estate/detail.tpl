{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<div class='form-group'>
			<h3>{{ data.name }}</h3>
		</div>
		
		<div class='row m-0'>
			<div class='col-9'>
				<div class='mb-3 form-control'>
					<img src='{{ data.img_url }}'/>
				</div>
				
				<div class="accordion">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								Thông tin bđs
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
										Diện tích: {{ data.area }} {{ data.unit_are }}
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
						<div id="collapseOne2" class="accordion-collapse collapse show" aria-labelledby="headingOne2" data-bs-parent="#accordionExample">
							<div class="accordion-body">
						    	{{ data.desc|raw }}
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class='col-3 form-control'>
				{% if contact is not empty %}
				<div class='text-center'>
					<h3>Liên lạc/trao đổi</h3>
					<div class='frame-img-contact-detail d-inline-block'>
						<img src='{{ contact.img_url }}'/>
					</div>
				
					<h4>{{ contact.name }}</h4>
					<h5>{{ contact.phone }}</h5>
				</div>
				{% endif %}
			</div>
		</div>
	</div>
{% endblock %}