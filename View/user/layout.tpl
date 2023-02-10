<!DOCTYPE html>
<html>
    <head>
        {% block head %}
        <title>{{ title }}</title>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/bootstrap.min.css?ver={{ date().timestamp }}"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/bootstrap-grid.min.css?ver={{ date().timestamp }}"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/custom.css?ver={{ date().timestamp }}"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/responsive.css?ver={{ date().timestamp }}"/>
        {% endblock %}
    </head>
    <body>
        <div id="head">
            <div id='content-head'>
                {% include "element/menu.tpl" with {'list_menu' : list_menu} %}    
            </div>
        </div>
        <div id="content">{% block content %}{% endblock %}</div>
        <div id="footer">
            {% block footer %}
                &copy; Copyright 2023 by <a href="http://domain.invalid/">Thanh Trịnh</a>.
            {% endblock %}
        </div>
    </body>
    <script src='{{ realPath }}/dist/js/bootstrap.min.js?ver={{ date().timestamp }}'></script>
    <script src='{{ realPath }}/dist/js/jquery-3.6.3.min.js?ver={{ date().timestamp }}'></script>
</html>