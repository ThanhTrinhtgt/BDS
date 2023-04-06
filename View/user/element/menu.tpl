<div class="container-fluid">
  <div class="row align-items-center">
    <div class='col-1'>
      <a href='{{ logo.seo_name }}'>
        <img id=logo-menu src='{{ logo.img_url }}'/>
      </a>
    </div>

    <div class='col-7'>
      <div id="header">
          <nav id='menu-desktop'>
            <div class='row'>
              {% if list_menu is not empty %}
                {% for item in list_menu %}
                  <div class="col">
                    <a href="/{{ item.value }}" class='text-decoration-none'>{{ item.name }}</a>
                  </div>
                {% endfor %}
              {% endif %}
            </div>
          </nav>

          <a href="#menu" id='button-menu'>
            <i class="fas fa-bars"></i>
          </a>
          
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
    </div>

    <div class='col-4'>
      {% include "user/element/search-bar.tpl" with {'list_search' : list_search} %}
    </div>
  </div>
</div>