<div class="card form-group">
    <div class="card-body row form-group">
        <div class="col-3">Tỉnh thành</div>
        <div class="col-9">
            <select class='form-control bds-field-form' name='province_id'>
                <option value='0'>Chọn tỉnh</option>
            {% for province in list_province %}
                {% if province.id == data.province_id %}
                    <option value='{{ province.id }}' selected>{{ province.name }}</option>
                {% else%}
                    <option value='{{ province.id }}'>{{ province.name }}</option>
                {% endif %}
            {% endfor %}
            </select>
        </div>

        <div class="col-12 p-1"></div>

        <div class="col-3">Quận huyện</div>
        <div class="col-9">
            <select class='form-control bds-field-form' name='district_id'>
                <option value='0'>Chọn quận</option>
            {% for district in list_district %}
                {% if district.id == data.district_id %}
                    <option value='{{ district.id }}' selected>{{ district.name }}</option>
                {% else%}
                    <option value='{{ district.id }}'>{{ district.name }}</option>
                {% endif %}
            {% endfor %}
            </select>
        </div>

        <div class="col-12 p-1"></div>

        <div class="col-3">Phường xã</div>
        <div class="col-9">
            <select class='form-control bds-field-form' name='ward_id'>
                <option value='0'>Chọn phường xã</option>
            {% for ward in list_ward %}
                {% if ward.id == data.ward_id %}
                    <option value='{{ ward.id }}' selected>{{ ward.name }}</option>
                {% else%}
                    <option value='{{ ward.id }}'>{{ ward.name }}</option>
                {% endif %}
            {% endfor %}
            </select>
        </div>

        <div class="col-12 p-1"></div>

        <div class="col-3">Địa chỉ</div>
        <div class="col-9">
            <input class="form-control bds-field-form" name="address_no" value="{{ data.address_no }}"/>
        </div>
    </div>
</div>