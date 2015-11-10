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

  <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'form.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'transition.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'tab.min.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'modal.min.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'dimmer.min.js')}"></script>
  <script src="${resource(dir: 'dist/components', file: 'transition.min.js')}"></script>

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

	<g:render template="header" />
	
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
	<g:render template="userSettingsModal" />	

<!-- USER SETTINGS MODAL -->



<!-- PAYMENTS MODAL -->
<div id="payments" class="ui modal small">
  <div class="header">Payment History</div>
  <div class="content">
  
    <table class="ui  padded table">
      <thead>
        <tr>
    	  <th>Date</th>	
    	  <th>Amount</th>
    	</tr>
      </thead>
      <tbody>
        <tr>
          <td>August 5, 2014</td>
          <td>P5,000.00</td>
        </tr>
         <tr>
          <td>August 5, 2014</td>
          <td>P5,000.00</td>
        </tr>
         <tr>
          <td>August 5, 2014</td>
          <td>P5,000.00</td>
        </tr>
        <tr>
          <td><b>Total Amount Paid:</b></td>
          <td><b>P15,000.00</b></td>
        </tr>
        <tr>
          <td><b>Remaining Balance:</b></td>
          <td style="color:red"><b>P7,000.00</b></td>
        </tr>
      </tbody>
    </table>
    <form class="ui form">
		<div class="inline fields">
		    <div class="thirteen wide field">
		      <input type="number" placeholder="Amount paid"/>
		    </div>
		    <div class="three wide field">
		    <div class="ui button teal">Add Payment</div>
		    </div>
		</div>
    </form>
  </div>
		<div class="actions">
			<div class="ui approve button teal">Done</div>
		</div>
</div>

<!-- RECEIVABLE INFORMATION -->
<div id="addReceivable" class="ui modal">
  <div class="header">Account Receivable</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Customer Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Official Receipt Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="number">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Due Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
    	
    </form>
  </div>
  <div class="actions">
    <div class="ui approve button teal">Save</div>
    <div class="ui button teal">Add More</div>
    <div class="ui cancel button teal">Cancel</div>
  </div>
</div> 

<!-- PAYABLE INFORMATION -->
<div id="addPayable" class="ui modal">
  <div class="header">Account Payable</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Official Receipt Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="number">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Due Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
    	
    </form>
  </div>
  <div class="actions">
    <div class="ui approve button teal">Save</div>
    <div class="ui button teal">Add More</div>
    <div class="ui cancel button teal">Cancel</div>
  </div>
</div> 
<!-- EDIT PAYABLE MODAL -->
<div id="editPayable" class="ui modal">
  <div class="header">Edit Account Payable</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
				<div class="inline fields">
		<div class="two wide field">
		      <label>Contact Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		<div class="inline fields">
		<div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="number">
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="number">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Due Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
    	
    </form>
  </div>
  <div class="actions">
    <div class="ui approve button teal">Save</div>
    <div class="ui cancel button teal">Done</div>
  </div>
</div> 
<!-- EDIT Receivable MODAL -->
<div id="editReceivable" class="ui modal">
  <div class="header">Edit Account Receivable</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Customer Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
				<div class="inline fields">
		<div class="two wide field">
		      <label>Contact Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		<div class="inline fields">
		<div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="number">
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="number">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Due Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date">
		    </div>
		</div>
		
    	
    </form>
  </div>
  <div class="actions">
    <div class="ui approve button teal">Save</div>
    <div class="ui cancel button teal">Done</div>
  </div>
</div> 

<!-- SUPPLIER INFORMATION  -->
<div id="addSupplier" class="ui modal">
  <div class="header">Supplier</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Contact Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		      <input type="number">
		    </div>
		    <div class="seven wide field">
		      <select class="ui fluid dropdown">
    			<option value="">days</option>
    			<option value="">weeks</option>
    			<option value="">months</option>
    			<option value="">years</option>
    		  </select>
		    </div>
		</div>    	
    	
    </form>
  </div>
  <div class="actions">
    <div class="ui approve button">Save</div>
    <div class="ui button">Add More</div>
    <div class="ui cancel button">Cancel</div>
  </div>
</div>

<!-- CUSTOMER INFORMATION  -->
<div id="addCustomer" class="ui modal">
  <div class="header">Supplier</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Contact Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		      <input type="number">
		    </div>
		    <div class="seven wide field">
		      <select class="ui fluid dropdown">
    			<option value="">days</option>
    			<option value="">weeks</option>
    			<option value="">months</option>
    			<option value="">years</option>
    		  </select>
		    </div>
		</div>    	
    	
    </form>
  </div>
  <div class="actions">
    <div class="ui approve button">Save</div>
    <div class="ui button">Add More</div>
    <div class="ui cancel button">Cancel</div>
  </div>
</div>

<div id="logout" class="ui small test modal transition" style="margin-top: -92.5px;">
    <div class="header">
      Log out
    </div>
    <div class="content">
      <p>Are you sure you want to log out of your account</p>
    </div>
    <div class="actions">
      <div class="ui negative button">
        No
      </div>
      <div class="ui positive right labeled icon button">
        Yes
        <i class="checkmark icon"></i>
      </div>
    </div>
  </div>

</body>
<script type="text/javascript">
	$('#fnametxt').hide();
	$('#usernametxt').hide();
	$('#lnametxt').hide();
	$('#changepass').hide();
	$('#saveBtn').hide();
	$('#newPass').hide();

	function edit(){
		$('#saveBtn').toggle();
		$('#username').toggle();
		$('#fname').toggle();
		$('#lname').toggle();
		$('#usernametxt').toggle();
		$('#fnametxt').toggle();
		$('#lnametxt').toggle();
		$('#editBtn').toggle();
		$('#changepass').toggle();
	}

	function changePassword(){
		$('#currPass').toggle();
		$('#newPass').toggle();
	}

	function cancelEdit(){
		$('#saveBtn').toggle();
		$('#username').toggle();
		$('#fname').toggle();
		$('#lname').toggle();
		$('#usernametxt').toggle();
		$('#fnametxt').toggle();
		$('#lnametxt').toggle();
		$('#editBtn').toggle();
		$('#changepass').toggle();
		$('#currPass').toggle();
		$('#newPass').toggle();
	}

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
	});
	
	$('#logoutLink').click(function(){
		$('#logout').modal('show');
	});

</script>
</html>