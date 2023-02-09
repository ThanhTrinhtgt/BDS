{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
        <a class="btn btn-info btn-sm" href='/admin/news/edit/0'>
            <i class="fas fa-pencil-alt"></i>Thêm mới
        </a>
    </div>

    <div class="invoice p-3 mb-3">   
        <form class="bds-main-form">
            <input type='hidden' class="bds-field-form" name='id' value="{{ data.id }}"/>
            <div class="row form-group">
                <div class="col-3">Tiêu đề</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="name" value="{{ data.name }}"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Đường dẫn</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="seo_name" value="{{ data.seo_name }}"/>
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
                <div class="col-12" id="editor">
                    
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
    let core = new BDScore('news');

    core.eventForm();
</script>
{% endblock %}