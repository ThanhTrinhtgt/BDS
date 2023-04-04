{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<h1>{{ data.name }}</h1>
		<span>{{ data.date_add }}</span>
		<p>{{ data.short_desc }}</p>
		<p>{{ data.desc|raw }}</p>
	</div>
{% endblock %}