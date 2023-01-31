<div id="bds-search-bar">

  <nav>
    <div class="nav nav-tabs" id="nav-tab" role="tablist">
      <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Home</button>
      <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>
      <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
      <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" disabled>Disabled</button>
    </div>
  </nav>
  <ul class="nav nav-tabs" role="tablist">
    {% if list_search is not empty %}
      {% for item in list_search %}
        <li class="nav-item">
          <a class="nav-link active" id="nav-home-tab-{{ item.id }}"
            data-bs-toggle="tab" data-bs-target="#page-{{ item.id }}" type="button" role="tab">{{ item.name }}</a>
        </li>
      {% endfor %}
    {% endif %}
  </ul>
  <div class="tab-content" id="nav-tabContent">
    {% if list_search is not empty %}
      {% for item in list_search %}
        <div class="tab-pane fade" id="page-{{ item.id }}" role="tabpanel" aria-labelledby="nav-home-tab-{{ item.id }} 
        tabindex="0">{{ item.name }}</div>
      {% endfor %}
    {% endif %}
  </div>
</div>
