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
            <select class='form-control bds-field-form' name='type'>
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
            <select class='form-control bds-field-form' name='feature'>
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