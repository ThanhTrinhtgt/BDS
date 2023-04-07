{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<div class="row">
			<div class='col-9'>
				{% for item in data %}
					{% include "user/element/real-estate/item-fluid-real-estate.tpl" with {'item' : item} %}
				{% endfor %}
			</div>

			<div class='col-3'>
				{% include "user/element/real-estate/sidebar.tpl" with {'data' : data} %}
			</div>
		</div>
	</div>
{% endblock %}

{% block contentJs %}
    
{% endblock %}