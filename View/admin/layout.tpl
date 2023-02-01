<!DOCTYPE html>
<html>
    <head>
        {% block head %}
            <title>{{ title }}</title>
            {% include "dist/css/main.tpl" with {'ver': date().timestamp} %}
        {% endblock %}
    </head>
    <body>
        <div id="head">
            admin
            {% include "element/menu.tpl" with {'list_menu' : list_menu} %}
            {% include "element/search-bar.tpl" with {'list_search' : list_search} %}
        </div>
        <div id="content">{% block content %}{% endblock %}</div>
        <div id="footer">
            {% block footer %}
                &copy; Copyright 2023 by <a href="http://domain.invalid/">Thanh Trịnh</a>.
            {% endblock %}
        </div>
    </body>
    {% include "dist/js/main.tpl" %}
</html>