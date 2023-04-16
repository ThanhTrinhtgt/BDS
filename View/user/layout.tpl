<!DOCTYPE html>
<html>
    <head>
        {% block head %}
        <title>{{ title }}</title>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/bootstrap-grid.min.css"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/splide.min.css"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/mmenu.css"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/all.css?ver=1"/>
        <link rel="stylesheet" href="{{ realPath }}/dist/css/font.css?ver=1"/>
        <link rel="stylesheet" href="{{ realPath }}/user/dist/css/custom.css?ver={{ 'now'|date('U') }}"/>
        <link rel="stylesheet" href="{{ realPath }}/user/dist/css/responsive.css?ver={{ 'now'|date('U') }}"/>
        {% endblock %}
    </head>
    <body>
        <div id="head">
            <div id='content-head'>
                <a href='/admin'>Admin</a>
                {% include "user/element/menu.tpl" with {'list_menu' : list_menu, 'logo': logo} %}    
            </div>
        </div>
        <div id="content">{% block content %}{% endblock %}</div>
        <div id="footer">
            {% include "user/element/footer.tpl" %}
        </div>
    </body>
    <script src='{{ realPath }}/dist/js/bootstrap.min.js'></script>
    <script src='{{ realPath }}/dist/js/jquery-3.6.3.min.js'></script>
    <script src='{{ realPath }}/dist/js/numeral.min.js'></script>
    <script src='{{ realPath }}/dist/js/splide.min.js'></script>
    <script src='{{ realPath }}/dist/js/mmenu.js'></script>
    <script src='{{ realPath }}/user/dist/js/main.js?ver={{ "now"|date("U") }}'></script>
    <script>
        let core = new userCore();
    
        {% block contentJs %}
        {% endblock contentJs %}
    </script>
</html>