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
		<META HTTP-EQUIV="CACHE-CONTROL" CONTENT="NO-CACHE">
		<META HTTP-EQUIV="EXPIRES" CONTENT="01 Jan 1970 00:00:00 GMT">
		<META HTTP-EQUIV="PRAGMA" CONTENT="NO-CACHE">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<!-- Site Properities -->
		<title>MoneyTor</title>
		<link rel="icon" type="image/png" href="${resource(dir: 'images', file: 'icon.png')}" />
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.min.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui.theme.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.css')}" type="text/css">
  		<link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.min.css')}" type="text/css">
  		<link rel="stylesheet" href="${resource(dir: 'datatables/media/css', file: 'jquery.dataTables.min.css')}" type="text/css">
  		<link rel="stylesheet" href="${resource(dir: 'datatables/extensions/Buttons/css', file: 'buttons.dataTables.min.css')}" type="text/css">
  
  		<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  		<script src="${resource(dir: 'js', file: 'jquery-ui.min.js')}"></script>
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
    		#logout h3{
				width: 100%;
				word-break:break-all;
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
    		.ui.pointing.label:before{
    			z-index: 0!important;
    		}
    		.ui-widget-header{
    			background-color: #00b5ad!important;
    			border: 1px solid #00b5ad!important;
    		}
    		.ui-state-hover{
    			border: 1px solid #006A65!important;
    			background-color: #E4FFFE!important;
    		}
    		.ui-state-default{
    			color: #006A65!important;
    		}
    		.ui-state-active{
    			color: #00b5ad!important;
    			border: 1px solid #00b5ad!important;
    		}
    		.ui-state-highlight{
    			border: 1px solid #00b5ad!important;
    			background-color: #ffffff!important;
    		}
  		</style>
  		
	</head>
	<body>
		<div class="ui container">
			<g:render template="../header/header" />
			<div class="ui top attached tabular menu">	  
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
			<g:render template="transactors/editSupplierModal" />
			<g:render template="transactors/editCustomerModal" />
			<g:render template="../header/logout" />
		</div>
	</body>

	<script src="${resource(dir: 'js', file: 'main.js')}"></script>
</html>