{% if contact is not empty %}
	<div class='form-group box-border-radius text-center pt-2'>
		<h3>Liên lạc/trao đổi</h3>
		<div class='frame-img-contact-detail d-inline-block'>
			<img src='{{ contact.img_url }}'/>
		</div>
	
		<h4>{{ contact.name }}</h4>
		<h5>{{ contact.phone }}</h5>
	</div>

	{% if list_hot is not empty %}
	<div class='form-group box-border-radius mt-3 p-2'>
		{% for item in list_hot %}
			<h4>
				<a href='{{ item.url }}'>{{ item.name }}</a>
			</h4>
		{% endfor %}
	</div>
	{% endif %}
{% endif %}