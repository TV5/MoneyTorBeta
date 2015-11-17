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
<title>Main Page</title>
  <link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.min.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'datatables/media/css', file: 'jquery.dataTables.min.css')}" type="text/css">
  
  <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  <script src="${resource(dir: 'datatables/media/js', file: 'jquery.dataTables.min.js')}"></script>
  <script src="${resource(dir: 'dist', file: 'semantic.js')}"></script>
  <script src="${resource(dir: 'js', file: 'main.js')}"></script>

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
	  <a data-tab="payablesTab" class="item active" >
	    PAYABLES
	  </a>
	  <a data-tab="receivablesTab" class="item">
	    RECEIVABLES
	  </a>
	  <a data-tab="suppliersTab" class="item">
	    SUPPLIERS
	  </a>
	  <a data-tab="customersTab" class="item">
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
<script type="text/javascript">

	$(document).ready(function() {
	    $('#receivablesTable').DataTable();
	    $('#customersTable').DataTable();
	    $('#suppliersTable').DataTable();
		var num = $('#payablesNumEntries').val();
	    var payablesTable = $('#payablesTable').DataTable({
			"dom": '<"top"f><"dateFilter">rt<"bottom"ip><"clear">',
			"pageLength": num
		});
	    //$("div.dateFilter").html('<label> Start Date </label><input type="date" id="min" name="min"><label> End Date </label><input type="date" id="max" name="max">');
	    $('#min, #max').change( function() {
	        payablesTable.draw();
	    } );
	    var filter = payablesTable.rows( { search:'applied' } ).data().each(function(value, index) {
	        console.log(value, index);
	    });
	    console.log(filter);
		$('#payablesNumEntries').change(function(){
			 payablesTable.page.len($('#payablesNumEntries').val()).draw();
		});
	} );
	
	$('.top.menu .item').tab();

	$('#addPayableBtn').click(function(){
		$('#addPayable').modal('show');
	});
	
	$('#addReceivableBtn').click(function(){
		$('#addReceivable').modal('show');
	});
	
	$('#addSupplierBtn').click(function(){
		$('#addSupplier').modal('show');
	});
	
	$('#addCustomerBtn').click(function(){
		$('#addCustomer').modal('show');
	});
	
	$('#settingsLink').click(function(){
		$('#userSettings').modal('show');
		$('.displaySec').hide();
		$('.displayFirst').show();
		$('#changepass').hide();
		$('#saveBtn').hide();
		$('#newPass').hide();
	});
	
	$('#logoutLink').click(function(){
		$('#logout').modal('show');
	});

	function editPayable(or_no, supplier_name, amount, transaction_date) {
		document.getElementById("supplier_name").value="supplier name";
		document.getElementById("por_no").value= or_no;
		alert(document.getElementById("por_no").value);
		$('#editPayable').modal('show');
		document.getElementById("psupplier_name").value= supplier_name;
		document.getElementById("pamount").value= amount;
		document.getElementById("ptransaction_date").value= transaction_date;
	}
	
	function editAdmin(id, username, f_name, l_name, password, status){
		document.getElementById("adminId").value=id;
		document.getElementById("adminUsername").value=username;
		document.getElementById("adminF_name").value=f_name;
		document.getElementById("adminL_name").value=l_name;
		document.getElementById("adminPassword").value=password;
		document.getElementById("adminCpassword").value=password;

		$('#editadministrator').modal('show');
	}

	$.fn.dataTable.ext.search.push(
		    function( settings, data, dataIndex ) {
		  		var min = Date.parse($('#min').val(),10);
		  		var max = Date.parse($('#max').val());
		  		var date = Date.parse( data[3].toString().split(' ') [0]) || 0;
		        if ( ( isNaN( min ) && isNaN( max ) ) ||
		             ( isNaN( min ) && date <= max ) ||
		             ( min <= date   && isNaN( max ) ) ||
		             ( min <= date   && date <= max ) )
		        {
		            return true;
		        }
		        return false;
		    }
		);

	
</script>
</html>