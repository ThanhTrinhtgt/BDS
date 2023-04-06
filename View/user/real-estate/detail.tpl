{% extends "user/layout.tpl" %}
{% block content %}
	<div class="container">
		<div class='row m-0'>
			<div class='col-9'>
				{% include "user/real-estate/detail-body.tpl" with {'data' : data} %}
			</div>

			<div class='col-3'>
				{% include "user/real-estate/detail-sidebar.tpl" with {'data' : data, 'list_hot': list_hot} %}
			</div>
		</div>
	</div>
{% endblock %}

{% block contentJs %}
    
{% endblock %}