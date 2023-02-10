{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		
	</div>
	<div class="container">
		<div class="row">
			{% for item in real_estate %}
				<div class="col-6">
					<a href='{{ item.url }}'>
						<img src='{{ item.img_url }}' class='bds-img-item'/>
						<h3>{{ item.name }}<span class="badge bg-success">New</span></h3>
					</a>
					<span>{{ item.short_desc }}</span>
			    </div>
			{% endfor %}
		</div>
	</div>
{% endblock %}