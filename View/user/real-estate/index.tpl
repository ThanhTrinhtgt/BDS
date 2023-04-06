{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<div class="row">
			{% for item in data %}
				<div class="col-3 mb-3">
					{% include "user/real-estate/item-real-estate.tpl" with {'item' : item} %}
			    </div>
			{% endfor %}
		</div>
	</div>
{% endblock %}

{% block contentJs %}
    
{% endblock %}