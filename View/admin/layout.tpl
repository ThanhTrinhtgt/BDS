<!DOCTYPE html>
<html lang="en">
<head>
    {% block head %}
        <title>{{ title }}</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
        <link rel="stylesheet" href="View/admin/dist/css/all.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/ionicons.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/tempusdominus-bootstrap-4.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/icheck-bootstrap.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/jqvmap.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/adminlte.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/OverlayScrollbars.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/daterangepicker.css">
        <link rel="stylesheet" href="View/admin/dist/css/summernote-bs4.min.css">
        <link rel="stylesheet" href="View/admin/dist/css/_main-sidebar.scss">
        {#{% include "dist/css/main.tpl" with {'ver': date().timestamp} %}#}
    {% endblock %}
</head>
<body class="hold-transition sidebar-mini layout-fixed">
    <div class="wrapper">
        <nav class="main-header navbar navbar-expand navbar-white navbar-light">
            <!-- Left navbar links -->
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
              </li>
              <li class="nav-item d-none d-sm-inline-block">
                <a href="index3.html" class="nav-link">Home</a>
              </li>
              <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">Contact</a>
              </li>
            </ul>
            <!-- Right navbar links -->
            <ul class="navbar-nav ml-auto">
                <!-- Navbar Search -->
                <li class="nav-item">
                <a class="nav-link" data-widget="navbar-search" href="#" role="button">
                  <i class="fas fa-search"></i>
                </a>
                <div class="navbar-search-block">
                  <form class="form-inline">
                    <div class="input-group input-group-sm">
                      <input class="form-control form-control-navbar" type="search" placeholder="Search" aria-label="Search">
                      <div class="input-group-append">
                        <button class="btn btn-navbar" type="submit">
                          <i class="fas fa-search"></i>
                        </button>
                        <button class="btn btn-navbar" type="button" data-widget="navbar-search">
                          <i class="fas fa-times"></i>
                        </button>
                      </div>
                    </div>
                  </form>
                </div>
                </li>
            </ul>
        </nav>

        <aside class="main-sidebar sidebar-dark-primary elevation-4">
            <a href="index3.html" class="brand-link">
              <img src="View/admin/dist/image/house.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
              <span class="brand-text font-weight-light">AdminLTE 3</span>
            </a>
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                  <li class="nav-item active">
                    <a href="pages/widgets.html" class="nav-link">
                      <i class="nav-icon fas fa-th"></i>
                      <p>
                        Widgets
                        <span class="right badge badge-danger">New</span>
                      </p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="#" class="nav-link">
                      <i class="nav-icon fas fa-copy"></i>
                      <p>
                        Layout Options
                        <i class="fas fa-angle-left right"></i>
                        <span class="badge badge-info right">6</span>
                      </p>
                    </a>
                    <ul class="nav nav-treeview">
                      <li class="nav-item">
                        <a href="pages/layout/top-nav.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Top Navigation</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="pages/layout/top-nav-sidebar.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Top Navigation + Sidebar</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="pages/layout/boxed.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Boxed</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="pages/layout/fixed-sidebar.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Fixed Sidebar</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="pages/layout/fixed-sidebar-custom.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Fixed Sidebar <small>+ Custom Area</small></p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="pages/layout/fixed-topnav.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Fixed Navbar</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="pages/layout/fixed-footer.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Fixed Footer</p>
                        </a>
                      </li>
                      <li class="nav-item">
                        <a href="pages/layout/collapsed-sidebar.html" class="nav-link">
                          <i class="far fa-circle nav-icon"></i>
                          <p>Collapsed Sidebar</p>
                        </a>
                      </li>
                    </ul>
                  </li>
              </ul>
        </aside>
    </div>
    <!-- jQuery -->
    <script src="View/admin/dist/js/jquery.min.js"></script>
    <script src="View/admin/dist/js/jquery-ui.min.js"></script>
    <script>
      $.widget.bridge('uibutton', $.ui.button)
    </script>
    <script src="View/admin/dist/js/bootstrap.bundle.min.js"></script>
    <script src="View/admin/dist/js/moment.min.js"></script>
    <script src="View/admin/dist/js/daterangepicker.js"></script>
    <script src="View/admin/dist/js/tempusdominus-bootstrap-4.min.js"></script>
    <script src="View/admin/dist/js/summernote-bs4.min.js"></script>
    <script src="View/admin/dist/js/jquery.overlayScrollbars.min.js"></script>
    <script src="View/admin/dist/js/adminlte.js"></script>
    <script src="View/admin/dist/js/dashboard.js"></script>
</body>
</html>