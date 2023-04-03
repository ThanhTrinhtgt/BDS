<div class="container">
  <div class="row align-items-center">
    <div class='col-8'>
      <div id="header">
          <a href="#menu">Open the menu</a>
          <i class="fas fa-bars"></i>
      </div>
      <nav id="menu">
          <ul>
            {% if list_menu is not empty %}
              {% for item in list_menu %}
                <li>
                  <a href="/{{ item.value }}" class='text-decoration-none'>{{ item.name }}</a>
                </li>
                {#
                <ul>
                    <li><a href="/about/history">History</a></li>
                    <li><span>The team</span>
                        <ul>
                            <li><a href="/about/team/management">Management</a></li>
                            <li><a href="/about/team/sales">Sales</a></li>
                            <li><a href="/about/team/development">Development</a></li>
                        </ul>
                    </li>
                </ul>
                #}
              {% endfor %}
            {% endif %}
          </ul>
        </nav>
    </div>

    <div class='col-4'>
      {% include "element/search-bar.tpl" with {'list_search' : list_search} %}
    </div>
  </div>
</div>