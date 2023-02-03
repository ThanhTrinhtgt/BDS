{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
      <h5><i class="fas fa-info"></i> Note:</h5>
      
    </div>

    <div class="invoice p-3 mb-3">   
        <form class="bds-main-form">
            <div class="row form-group">
                <div class="col-3">Tiêu đề</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="name"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Đường dẫn</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="seo_name"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Giá tiền</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="price"/>
                </div>

                <div class="col-12 p-1"></div>
                
                <div class="col-3">Mô tả ngắn</div>
                <div class="col-9">
                    <input class="form-control bds-field-form" name="short_desc"/>
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
                    ></textarea>
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

</script>
{% endblock %}