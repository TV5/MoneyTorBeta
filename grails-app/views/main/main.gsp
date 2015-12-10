<!-- 
/* -------------------------------------------------------------------------
 * Unauthorized copying of this file, via any medium is strictly prohibited
 * Proprietary and confidential
 * Copyright (C) Moneytor
 * -------------------------------------------------------------------------
 -->
 
<!DOCTYPE html>
<html>
<head>
<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Site Properities -->
<title>MoneyTor</title>
  <link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.min.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'datatables/media/css', file: 'jquery.dataTables.min.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'datatables/extensions/Buttons/css', file: 'buttons.dataTables.min.css')}" type="text/css">
  
  <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  <script src="${resource(dir: 'datatables/media/js', file: 'jquery.dataTables.min.js')}"></script>
  <script src="${resource(dir: 'datatables/extensions/Buttons/js', file: 'dataTables.buttons.min.js')}"></script>
  <script src="${resource(dir: 'datatables/extensions/JSZip', file: 'jszip.min.js')}"></script>
  <script src="${resource(dir: 'datatables/extensions/pdfmake/build', file: 'pdfmake.min.js')}"></script>
  <script src="${resource(dir: 'datatables/extensions/pdfmake/build', file: 'vfs_fonts.js')}"></script>
  <script src="${resource(dir: 'datatables/extensions/Buttons/js', file: 'buttons.html5.min.js')}"></script>
  <script src="${resource(dir: 'datatables/extensions/Buttons/js', file: 'buttons.print.min.js')}"></script>
  <script src="${resource(dir: 'datatables/extensions/Buttons/js', file: 'buttons.colVis.min.js')}"></script>
  <script src="${resource(dir: 'dist', file: 'semantic.js')}"></script>

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
    .firstmenu {
    	padding-left: 20px;
    	padding-right: 20px;
    	padding-top: 0px;
    }
    a {
    	color: #00b5ad;
    }
    .link {
    	color: #00b5ad !important;
    }
    tr th #eicon{
    visibility:hidden;
    }
    tr:hover th  #eicon{
    	visibility: visible;
    }
  </style>
</head>
<body>
<div class="ui container">

	<g:render template="../header/header" />
	<div class="ui top attached tabular menu">
	    <!-- <a data-tab="receivablesTab" class="item active" >
	    PAYABLES
	  </a>
	  <a href="receivables" class="item">
	    RECEIVABLES
	  </a>
	  <a href="suppliers" class="item">
	    SUPPLIERS
	  </a>
	  <a href="customers" class="item">
	    CUSTOMERS
	  </a>-->
	  
	<a data-tab="payablesTab" class="item active" >
	    PAYABLES
	  </a>
	  <a data-tab="receivablesTab" id="receivablesTabLink" class="item">
	    RECEIVABLES
	  </a>
	  <a data-tab="suppliersTab" id="suppliersTabLink" class="item">
	    SUPPLIERS
	  </a>
	  <a data-tab="customersTab" id="customersTabLink" class="item">
	    CUSTOMERS
	  </a>
	  
	</div>
	<g:render template="accounts/payablesTab" />
	<g:render template="accounts/receivablesTab" />
	<g:render template="transactors/suppliersTab" />
	<g:render template="transactors/customersTab" />
	<g:render template="../header/userSettingsModal" />	
	<g:render template="payments/paymentsModal" />	
	<g:render template="accounts/addReceivableModal" />
	<g:render template="accounts/addPayableModal" />
	<g:render template="accounts/editPayableModal" />
	<g:render template="accounts/editReceivableModal" />
	<g:render template="transactors/addSupplierModal" />
	<g:render template="transactors/addCustomerModal" />
	<g:render template="../header/logout" />

</body>

<script src="${resource(dir: 'js', file: 'main.js')}"></script>

</html>