{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
        <a class="btn btn-info btn-sm" href='/admin/banner-group/edit/0'>
            <i class="fas fa-pencil-alt"></i>Thêm mới
        </a>
    </div>
    <div class="card-body">
        <table 
            id="example2" 
            class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info"
        >
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Tiêu đề</th>
                    <th>Key</th>
                    <th>Tác vụ</th>
                </tr>
            </thead>

            <tbody>
            {% set stt = 1 %}
            {% for item in data %}
                <tr>
                    <td>{{ stt }}</td>
                    <td>{{ item.name }}</td>
                    <td>{{ item.banner_group_key }}</td>
                    <td class="text-right">
                        <a class="btn btn-info btn-sm" href='/admin/banner-group/edit/{{ item.id }}'>
                            <i class="fas fa-pencil-alt"></i>Sửa
                        </a>
                        <a class="btn btn-danger btn-sm">
                            <i class="fas fa-trash"></i>Xoá
                        </a>
                    </td>
                </tr>
                {% set stt = stt + 1 %}
            {% endfor %}
            </tbody>
        </table>
        <div>
            {% include "admin/element/pagination.tpl" with {'current_page' : 1} %}
        </div>
    </div>
{% endblock %}

{% block contentJs %}
{% endblock %}