<!DOCTYPE html>
<html lang="en">
<head>
    {% block head %}
        <title>{{ title }} </title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/all.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/ionicons.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/tempusdominus-bootstrap-4.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/icheck-bootstrap.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/jqvmap.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/adminlte.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/OverlayScrollbars.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/daterangepicker.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/summernote-bs4.min.css?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/_main-sidebar.scss?ver={{ date().timestamp }}">
        <link rel="stylesheet" href="{{ realPath }}/admin/dist/css/custom.css?ver={{ date().timestamp }}">
    {% endblock %}
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
              </li>
              <!-- <li class="nav-item d-none d-sm-inline-block">
                <a href="index3.html" class="nav-link">Home</a>
              </li>
              <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Contact</a>
              </li> -->
            </ul>
        </nav>

        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="/admin" class="brand-link">
              <img src="{{ realPath }}/admin/dist/image/house.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
              <span class="brand-text font-weight-light">Trang chủ</span>
            </a>

            <nav class="mt-2">
              <ul class="nav nav-pills nav-sidebar flex-column" 
                  data-widget="treeview" 
                  role="menu" 
                  data-accordion="false">
                {% for url, item in menu %}
                    <li class="nav-item active">
                      <a href="{{ domain }}/admin/{{ url }}" class="nav-link">
                        <i class="nav-icon fas fa-th"></i>
                        <p>{{ item.name }}</p>
                      </a>
                      {% if item.child is defined and item.child is not empty %}
                        <ul class="nav nav-treeview">
                          {% for url_child, child in item.child %}
                            <li class="nav-item">
                              <a href="{{ domain }}/admin/{{ url }}/{{ url_child }}" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>{{ child.name }}</p>
                              </a>
                            </li>
                          {% endfor %}
                        </ul>
                      {% endif %}
                    </li>
                {% endfor %}
              </ul>
            </nav>
        </aside>
        <div class="content-wrapper">
          <div class="content-header">
            <div class="progress">
              <div class="progress-bar bg-primary progress-bar-striped" role="progressbar"
                   aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                <span class="sr-only">40% Complete (success)</span>
              </div>
            </div>
            <div class="container-fluid">
              <div class="row mb-2">
                <div class="col-sm-6">
                  <h1 class="m-0">Quản trị website</h1>
                </div>
                <div class="col-sm-6">
                  <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard v1</li>
                  </ol>
                </div><!-- /.col -->
              </div>
              <section class="content">{% block content %}{% endblock %}</div>
            </div>
          </div>
    </div>
    <!-- jQuery -->
    <script src="{{ realPath }}/admin/dist/js/jquery.min.js"></script>
    <script src="{{ realPath }}/admin/dist/js/jquery-ui.min.js"></script>
    <script>
      $.widget.bridge('uibutton', $.ui.button)
    </script>
    <script src="{{ realPath }}/admin/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ realPath }}/admin/dist/js/moment.min.js"></script>
    <script src="{{ realPath }}/admin/dist/js/daterangepicker.js"></script>
    <script src="{{ realPath }}/admin/dist/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="{{ realPath }}/admin/dist/js/jquery.overlayScrollbars.min.js"></script>
    <script src="{{ realPath }}/admin/dist/js/adminlte.js"></script>
    <script src="{{ realPath }}/admin/dist/js/ckeditor/ckeditor.js"></script>
    <script src="{{ realPath }}/admin/dist/js/dashboard.js?ver={{ date().timestamp }}"></script>
    <script src="{{ realPath }}/dist/js/numeral.min.js?ver={{ date().timestamp }}"></script>
    <script src="{{ realPath }}/dist/js/core.js?ver={{ date().timestamp }}"></script>
    <script src="{{ realPath }}/admin/dist/js/main.js?ver={{ date().timestamp }}"></script>
    <script type="text/javascript">
      var Core = new Core();
      Core.init();
    </script>

    {% block contentJs %}{% endblock contentJs %}
</body>
</html>