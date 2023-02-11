<!DOCTYPE html>
<html>
    <head>
        {% block head %}
        <title>{{ title }}</title>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/bootstrap.min.css?ver={{ date().timestamp }}"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/bootstrap-grid.min.css?ver={{ date().timestamp }}"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/splide.min.css?ver={{ date().timestamp }}"/>
        <link rel="stylesheet" href="{{ realPath }}/user/dist/css/custom.css?ver={{ date().timestamp }}"/>
        <link rel="stylesheet" href="{{ realPath }}/user/dist/css/responsive.css?ver={{ date().timestamp }}"/>
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
            {% include "element/footer.tpl" %}
        </div>
    </body>
    <script src='{{ realPath }}/dist/js/bootstrap.min.js?ver={{ date().timestamp }}'></script>
    <script src='{{ realPath }}/dist/js/jquery-3.6.3.min.js?ver={{ date().timestamp }}'></script>
    <script src='{{ realPath }}/dist/js/numeral.min.js?ver={{ date().timestamp }}'></script>
    <script src='{{ realPath }}/dist/js/splide.min.js?ver={{ date().timestamp }}'></script>
    <script src='{{ realPath }}/user/dist/js/main.js?ver={{ date().timestamp }}'></script>
    {% block contentJs %}{% endblock contentJs %}
</html>