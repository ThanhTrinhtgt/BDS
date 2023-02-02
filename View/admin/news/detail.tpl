{% extends "admin/layout.tpl" %}
{% block content %}
    <div class="callout callout-info">
      <h5><i class="fas fa-info"></i> Note:</h5>
      This page has been enhanced for printing. Click the print button at the bottom of the invoice to test.
    </div>

    <div class="invoice p-3 mb-3">   
        <div class="row">
            <div class="col-12">
            </div>
        </div>
    </div>

    <div class="row no-print">
        <div class="col-12">
            <a href="invoice-print.html" rel="noopener" target="_blank" class="btn btn-default"><i class="fas fa-print"></i> Print</a>
            <button type="button" class="btn btn-success float-right"><i class="far fa-credit-card"></i> Submit
            Payment
            </button>
            <button type="button" class="btn btn-primary float-right" style="margin-right: 5px;">
            <i class="fas fa-download"></i> Generate PDF
            </button>
        </div>
    </div>
{% endblock %}