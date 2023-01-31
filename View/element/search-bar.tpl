<ul class="nav" id="bds-search-bar">
  {% if list_search is not empty %}
    {% for item in list_search %}
      <li class="nav-item">
        <a class="nav-link active" aria-current="page" href="#">{{ item.name }}</a>
      </li>
    {% endfor %}
  {% endif %}
</ul>