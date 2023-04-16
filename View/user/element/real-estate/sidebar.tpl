{% if list_hot is not empty %}
<div class='form-group box-border-radius mt-3 p-2'>
	{% for item in list_hot %}
		<label>
			<a href='{{ item.url }}'>{{ item.name }}</a>
		</label>
	{% endfor %}
</div>
{% endif %}
