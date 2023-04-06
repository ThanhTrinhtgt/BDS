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
        
        {% include "admin/real-estate/detail-address.tpl" with {'data' : data} %}
        {% include "admin/real-estate/detail-contact.tpl" with {'data' : data} %}
        {% include "admin/real-estate/detail-advance.tpl" with {'data' : data} %}
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
    core.eventForm('real-estate');
    core.eventFormAddress();
{% endblock %}