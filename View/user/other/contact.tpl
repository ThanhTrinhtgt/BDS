{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<form id='form-send-contact'>
			<div class="mb-3">
				<label for="exampleInputEmail1" class="form-label">Email address</label>
				<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
				<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
			</div>

			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" class="form-control" id="exampleInputPassword1">
			</div>

			<div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me out</label>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>

		<section class="splide" aria-label="Splide Basic HTML Example">
		  	<div class="splide__track">
				<ul class="splide__list">
					{% for item in banner %}
						<li class="splide__slide">
							<img src='{{ item.img_url }}'/>
						</li>
					{% endfor %}
				</ul>
		  	</div>
		</section>
	</div>
{% endblock %}

{% block contentJs %}
    core.setupSlide('.splide');
{% endblock %}