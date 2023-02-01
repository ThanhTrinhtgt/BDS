<!DOCTYPE html>
<html>
    <head>
        {% block head %}
            <title>404</title>
            {% include "dist/css/main.tpl" with {'ver': date().timestamp} %}
        {% endblock %}
    </head>
    <body>
        <div class="container">
            <div class="alert alert-danger" role="alert">
              Trang bạn tìm kiếm không tồn tại, hãy quay lại <a href="/">trang chủ</a>.
            </div>
        </div>
    </body>
</html>