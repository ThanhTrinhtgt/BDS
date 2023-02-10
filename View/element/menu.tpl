<div class="container">
  <div class="row align-items-center">
    <div class='col-8'>
      <div class="row align-items-start">
        {% if list_menu is not empty %}
          {% for item in list_menu %}
            <div class="col">
              <a href="{{ item.value }}">{{ item.name }}</a>
            </div>
          {% endfor %}
        {% endif %}
      </div>
    </div>

    <div class='col-4'>
      {% include "element/search-bar.tpl" with {'list_search' : list_search} %}
    </div>
  </div>
</div>