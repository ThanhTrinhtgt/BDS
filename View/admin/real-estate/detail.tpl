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

        {% include "admin/real-estate/detail-base.tpl" with {'data' : data} %}
        
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