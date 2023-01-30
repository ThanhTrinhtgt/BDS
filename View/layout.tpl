<!DOCTYPE html>
<html>
    <head>
        {% block head %}
            <link rel="stylesheet" href="style.css"/>
            <title>{{ title }}</title>
        {% endblock %}
    </head>
    <body>
        <div id="content">{% block content %}{% endblock %}</div>
        <div id="footer">
            {% block footer %}
                &copy; Copyright 2023 by <a href="http://domain.invalid/">Thanh Trịnh</a>.
            {% endblock %}
        </div>
    </body>
    {% include "js/main.js" %}
</html>