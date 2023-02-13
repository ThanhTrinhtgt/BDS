{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<div class="row">
			{% for item in data %}
				<div class="col-3">
					{% include "element/item-real-estate.tpl" with {'item' : item} %}
			    </div>
			{% endfor %}
		</div>
	</div>
{% endblock %}