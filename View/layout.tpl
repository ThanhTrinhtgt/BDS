<!DOCTYPE html>
<html>
    <head>
        {% block head %}
            <title>{{ title }}</title>
            {% include "dist/css/main.tpl" %}
        {% endblock %}
    </head>
    <body>
        <div id="head">
            {% include "element/menu.tpl" %}
            {% include "element/search-bar.tpl" %}
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