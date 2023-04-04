{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
        <a class="btn btn-info btn-sm text-underline-none" href='/admin/contact/edit/0'>
            <i class="fas fa-pencil-alt">&nbsp;</i>Thêm mới
        </a>

        <a class="btn btn-info btn-sm ml-5 text-underline-none" href='/admin/contact/'>
            <i class="far fa-bars"></i>&nbsp;Danh sách
        </a>
    </div>

    <div class="invoice p-3 mb-3">   
        <form class="bds-main-form">
            <input type='hidden' class="bds-field-form" name='id' value="{{ data.id }}"/>
            <div class="row form-group">
                <div class="col-3">Tên</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="name" value="{{ data.name }}"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">
                    SDT
                </div>
                <div class="col-9">
                    <div class="input-group">
                        <input class="form-control bds-field-form" name="phone" value="{{ data.phone }}"/>
                    </div>
                </div>

                <div class="col-12 p-1"></div>

                <div class="col-3">Ảnh</div>
                <div class="col-3"><img class='img-review-60' src="{{ data.img_url }}"/></div>
                <div class="col-6">
                    <div class="input-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" id="exampleInputFile" name='img_url'>
                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                        </div>
                    </div>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Địa chỉ</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="address" value="{{ data.address }}"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Loại</div>
                <div class="col-9">
                    <select class='form-control' name='level'>
                        {% for item in list_level %}
                            {% if item.value == data.level %}
                                <option value='{{ item.value }}' selected>{{ item.name }}</option>
                            {% else%}
                                <option value='{{ item.value }}'>{{ item.name }}</option>
                            {% endif %}
                        {% endfor %}
                    </select>
                </div>
            </div>
        </form>
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
    let core = new BDScore('contact');

    core.eventForm();
</script>
{% endblock %}