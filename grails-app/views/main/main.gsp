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
<g:javascript library="jquery"/>
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

	    //payables
		$('#max').val(new Date().toDateInputValue());
		var max = new Date();
		max.setMonth(max.getMonth() - 1);
		$('#min').val(max.toDateInputValue());
	    function setPayablesTotalAmt(){
		    console.log("setPayablesTotalAmt")
		    var payablesAmounts = $("#payablesTable").dataTable().$('tr', {"filter":"applied"}).find(':nth-child(3)');
			var payablesTotal=0;
			for (var i = 0; i<payablesAmounts.length; i++){
				payablesAmounts[i] = payablesAmounts[i].textContent;
				payablesTotal+=parseFloat(payablesAmounts[i]);
			}
			$('#payablesTotal').html("Php"+payablesTotal);
		}
		setPayablesTotalAmt();
	    $('#min, #max').change( function() {
	        payablesTable.draw();
	    	setPayablesTotalAmt();
	    } );
	    var filter = payablesTable.rows( { search:'applied' } ).data().each(function(value, index) {});
		$('#payablesNumEntries').change(function(){
			 payablesTable.page.len($('#payablesNumEntries').val()).draw();
		});
	} );

	Date.prototype.toDateInputValue = (function() {
	    var local = new Date(this);
	    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
	    return local.toJSON().slice(0,10);
	});
	
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
	

	function editPayable(id,or_no, transactor_id, amount, transaction_date) {
		alert(id);
		transaction_date = transaction_date.toString().split(' ')[0];
		console.log(transaction_date);
		document.getElementById("payable_id").value=id;
		console.log('id',document.getElementById("payable_id").value);
		document.getElementById("epsupplier_name").value=transactor_id;
		document.getElementById("epor_no").value= or_no;
		document.getElementById("epamount").value= amount;
		document.getElementById("eptransaction_date").value = transaction_date;
		$('#editPayable').modal('show');
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

	function editTransactor(name, address, telephone_no, mobile_no, terms){
		document.getElementById("empId").value=id;
		document.getElementById("empUsername").value=username;
		document.getElementById("empF_name").value=f_name;
		document.getElementById("empL_name").value=l_name;
		document.getElementById("empPassword").value=password;
		document.getElementById("empCpassword").value=password;

		$('#editemployee').modal('show');
		
	}
	
	function changeSaveBtn(){
		$( "#saveBtn" ).toggleClass( teal );
	}
	
	$('#addCustomerBtn').click(function(){
		$('#addCustomer').modal('show');
	});

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