{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="invoice p-3 mb-3">   
        <table 
            id="example2" 
            class="table table-bordered table-hover dataTable dtr-inline" aria-describedby="example2_info"
        >
            <thead>
                <tr>
                    <th>STT</th>
                    <th>Quận huyện</th>
                    <th>Mã</th>
                    <th>ID tỉnh thành</th>
                    <th>Tác vụ</th>
                </tr>
            </thead>

            <tbody>
            {% set stt = 1 %}
            {% for item in district %}
                <tr>
                    <td>{{ stt }}</td>
                    <td>{{ item.name }}</td>
                    <td>{{ item.prefix }}</td>
                    <td>{{ item.province_id }}</td>
                    <td class="text-right">
                        <a class="btn btn-info btn-sm" href=''>
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
    </div>

    <div class="row no-print">
        <div class="col-12">
            <a href="#" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Back</a>
            
            <button type="button" class="btn btn-primary float-right bds-submit-form">
                <i class="fas fa-download"></i> Save
            </button>
        </div>
    </div>
{% endblock %}

{% block contentJs %}
<script>
    let core = new BDScore('province');

    core.eventForm();
</script>
{% endblock %}