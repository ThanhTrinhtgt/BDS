{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
        <a class="btn btn-info btn-sm text-underline-none" href='/admin/news/edit/0'>
            <i class="fas fa-pencil-alt"></i>&nbsp;Thêm mới
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
                    <th>Miêu tả</th>
                    <th>Tác vụ</th>
                </tr>
            </thead>

            <tbody>
            {% set stt = 1 %}
            {% for item in data %}
                <tr>
                    <td>{{ stt }}</td>
                    <td>{{ item.name }}</td>
                    <td>{{ item.short_desc }}</td>
                    <td class="text-right">
                        <a class="btn btn-info btn-sm" href='/admin/news/edit/{{ item.id }}'>
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
            <ul class="pagination">
                <li id="example2_previous"class="paginate_button page-item previous disabled">
                    <a href="#" aria-controls="example2" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
                </li>
                <li class="paginate_button page-item active">
                    <a href="#" aria-controls="example2" data-dt-idx="1" tabindex="0" class="page-link">1</a>
                </li>
                <li class="paginate_button page-item next" id="example2_next">
                    <a href="#" aria-controls="example2" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
                </li>
            </ul>
        </div>
    </div>
{% endblock %}