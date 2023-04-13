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
                    <input type="file" class="custom-file-input" id="exampleInputFile" name='img_url[]' multiple>
                    <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                </div>
            </div>

            {% if data.img_multi is not empty %}
            <div class="row m-0 mt-3">
                {% for img in data.img_multi %}
                <div class='col-3 box-frame-img ml-2'>
                    <img class='img-max-parent' src='{{ img.img_url }}'/>
                </div>
                {% endfor %}
            </div>
            {% endif %}
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
