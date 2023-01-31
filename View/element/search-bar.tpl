<div id="bds-search-bar">

  <nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
    {% if list_search is not empty %}
      {% for item in list_search %}
        <button class="nav-link" 
            id="nav-home-tab" 
            data-bs-toggle="tab" 
            data-bs-target="#nav-search-{{ item.id }}" 
            type="button" 
            role="tab" 
            aria-controls="nav-home" 
            aria-selected="true"
        >{{ item.name }}</button>
      {% endfor %}
    {% endif %}
    </div>
  </nav>
  
  <div class="tab-content" id="nav-tabContent">
    {% if list_search is not empty %}
      {% for item in list_search %}
        <form class="tab-pane fade show" 
            id="nav-search-{{ item.id }}" 
            role="tabpanel" 
            aria-labelledby="nav-home-tab" 
            tabindex="0"
        >
          <input name="" />
          <button>Tim kiem</button>
        </form>
      {% endfor %}
    {% endif %}
  </div>
</div>
