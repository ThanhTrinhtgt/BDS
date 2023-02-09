{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="content-wrapper">
        <section class="content-header">
          <div class="container-fluid">
            <div class="row mb-2">
              <div class="col-sm-6">
              </div>
            </div>
          </div>
        </section>
        <section class="content">
            <div class="error-page">
                <h2 class="headline text-warning">404</h2>
                <div class="error-content">
                  <h3><i class="fas fa-exclamation-triangle text-warning"></i> Lỗi! Trang bạn tìm kiếm không tồn tại.</h3>
                  <p>
                    Hãy quay trở lại <a href="/admin">trang chủ</a>.
                  </p>
                </div>
            </div>
        </section>
    </div>
{% endblock %}