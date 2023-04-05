{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
        <a class="btn btn-info btn-sm" href='/admin/real-estate/edit/0'>
            <i class="fas fa-pencil-alt"></i>&nbsp;Thêm mới
        </a>

        <a class="btn btn-info btn-sm ml-5 text-underline-none" href='/admin/real-estate/'>
            <i class="far fa-bars"></i>&nbsp;Danh sách
        </a>
    </div>
    <form class="bds-main-form">
        <input type='hidden' class="bds-field-form" name='id' value="{{ data.id }}"/>
        <div class="card">   
            <div class="row form-group card-body">
                <div class="col-3">Tiêu đề</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="name" value="{{ data.name }}"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">
                    Đường dẫn
                </div>
                <div class="col-9">
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button type="button" class="btn btn-primary bds-build-seo-name">Sync</button>
                        </div>
                        <input class="form-control bds-field-form" name="seo_name" value="{{ data.seo_name }}"/>
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
                
                <div class="col-3">Mô tả ngắn</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="short_desc" value="{{ data.short_desc }}"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Nội dung</div>
                <div class="col-9">
                    <textarea 
                        class="form-control 
                        bds-field-form" 
                        name="desc" 
                        id="ckeditor" 
                        data-ckeditor="1"
                        value="{{ data.desc|raw }}"
                    >{{ data.desc|raw }}</textarea>
                </div>

                <div class="col-12 p-1"></div>
            </div>
        </div>

        <div class="card form-group">
            <div class="card-body row form-group">
                <div class="col-3">Liên lạc</div>
                <div class="col-9">
                    <select class='form-control' name='contact_id'>
                        <option value='0'>Chưa có liên lạc</option>
                    {% for contact in list_contact %}
                        {% if contact.id == data.contact_id %}
                            <option value='{{ contact.id }}' selected>{{ contact.name }}</option>
                        {% else%}
                            <option value='{{ contact.id }}'>{{ contact.name }}</option>
                        {% endif %}
                    {% endfor %}
                    </select>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Loại tin</div>
                <div class="col-9">
                    <select class='form-control' name='type'>
                    {% for type in list_type %}
                        {% if data.type is not empty and data.type == type.value %}
                            <option value='{{ type.value }}' selected>{{ type.name }}</option>
                        {% else%}
                            <option value='{{ type.value }}'>{{ type.name }}</option>
                        {% endif %}
                    {% endfor %}
                    </select>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Đặc điểm</div>
                <div class="col-9">
                    <select class='form-control' name='feature'>
                        <option value='0'>Tin thường</option>
                        {% for list_feature in list_feature %}
                            {% if data.feature is not empty and data.feature == list_feature.value %}
                                <option value='{{ list_feature.value }}' selected>{{ list_feature.name }}</option>
                            {% else%}
                                <option value='{{ list_feature.value }}'>{{ list_feature.name }}</option>
                            {% endif %}
                        {% endfor %}
                    </select>
                </div>
            </div>
        </div>

        <div class="card m-0">
            <div class="card-body row form-group">
                <div class="col-3">Giá tiền</div>
                <div class="col-3">
                    <input class="form-control bds-field-form bds-format-currentcy" name="price" value="{{ data.price }}"/>
                </div>

                <div class="col-3">Đơn vị</div>
                <div class="col-3">
                    <input class="form-control bds-field-form" name="unit" value="{{ data.unit }}"/>
                </div>

                <div class="col-12 p-1"></div>

                <div class="col-3">Diện tích</div>
                <div class="col-3">
                    <input class="form-control bds-field-form" name="area" value="{{ data.area }}"/>
                </div>

                <div class="col-3">Đơn vị</div>
                <div class="col-3">
                    <input class="form-control bds-field-form" name="unit_area" value="{{ data.unit_area }}"/>
                </div>

                <div class="col-12 p-1"></div>

                <div class="col-3">Phòng ngủ</div>
                <div class="col-3">
                    <input class="form-control bds-field-form" name="num_bedroom" value="{{ data.num_bedroom }}"/>
                </div>

                <div class="col-3">Toilet</div>
                <div class="col-3">
                    <input class="form-control bds-field-form" name="num_toilet" value="{{ data.num_toilet }}"/>
                </div>

                <div class="col-12 p-1"></div>


                <div class="col-3">Tầng</div>
                <div class="col-3">
                    <input class="form-control bds-field-form" name="num_floor" value="{{ data.num_floor }}"/>
                </div>

                <div class="col-12 p-1"></div>

                <div class="col-3">Pháp lý</div>
                <div class="col-3">
                    <input class="form-control bds-field-form" name="legally" value="{{ data.legally }}"/>
                </div>
            </div>
        </div>
    </form>

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
    let core = new BDScore('real-estate');

    core.eventForm();
</script>
{% endblock %}