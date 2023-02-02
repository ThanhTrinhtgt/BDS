{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
      <h5><i class="fas fa-info"></i> Note:</h5>
      
    </div>

    <div class="invoice p-3 mb-3">   
        <div class="row form-group">
            <div class="col-3">Tiêu đề</div>
            <div class="col-9">
                <input class="form-control"/>
            </div>

            <div class="col-12 p-1"></div>
            
            <div class="col-3">Đường dẫn</div>
            <div class="col-9">
                <input class="form-control"/>
            </div>

            <div class="col-12 p-1"></div>
            
            <div class="col-3">Giá tiền</div>
            <div class="col-9">
                <input class="form-control"/>
            </div>

            <div class="col-12 p-1"></div>
            
            <div class="col-3">Mô tả ngắn</div>
            <div class="col-9">
                <input class="form-control"/>
            </div>

            <div class="col-12 p-1"></div>
            
            <div class="col-3">Nội dung</div>
            <div class="col-9">
                <textarea class="form-control"></textarea>
            </div>
        </div>
    </div>

    <div class="row no-print">
        <div class="col-12">
            <a href="#" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Back</a>
            
            <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
            <i class="fas fa-download"></i> Save
            </button>
        </div>
    </div>
{% endblock %}