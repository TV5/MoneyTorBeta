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
	<div class="ui text menu firstmenu" width="100%">
	  <img src="assets/images/moneytor_logo.png" style="width:30px;height:30px;margin-top:5px">
	  <div class="header item">	   <a class="item" href="${createLink(controller: 'main', action: 'main', params: [username:user.username, userId:user.id])}">
		MONEYTOR	
	   </a>
	   </div>
	  
	  
	  <div class="right menu">
	   <a class="item link">
	     <b>${user.username}</b>
	   </a>
	   <g:if test="${user.type}">
	   <a class="item" href="${createLink(controller: 'user', action: 'users', params: [username:user.username, userId:user.id])}">
			Users
	   </a>
	   </g:if>
	   <a id="settingsLink" class="item">
	     Settings
	   </a>
	   <a id="logoutLink" class="ui item">
	      Log out
	    </a>
	  </div>
	  
	</div>
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

	<div class="ui bottom attached active tab segment" data-tab="payablesTab" style="padding-bottom:50px">
	  <div class="ui form ">
	  	<div class="inline fields" style="float:left">
	    <div class="four wide field">
	      <label>Entries per page</label>
	      <input type="number" value="10">
	    </div>
	  	<div class="five wide field">
	      <label>Start Date</label>
	      <input type="date">
	    </div>
	    <div class="five wide field">
	      <label>End Date</label>
	      <input type="date">
	    </div>
	    </div>
	    <div class="three wide feild" style="float:right">
	      <button id="addPayableBtn" class="ui button teal">Add Payable</button>
	    </div>
	    <div class="three wide feild" style="float:right">
		    <button class="ui button teal">Print</button>
	    </div>
	  </div>
	  <table class="ui celled padded table">
	  <thead>
	    <tr>
	    <th>OR No. <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Supplier <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Amount <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Transaction Date <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Due Date <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Edit</th>
	    <th>Payments</th>
	  	</tr>
	  </thead>
	  <tbody>
	  	<tr>
	    <th>001823</th>
	    <th>Henwill Marketing</th>
	    <th>P3,000.00</th>
	    <th>August 18, 2015</th>
	    <th>September 18, 2015</th>
	    <th><a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn" >View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	
	  </tbody>
	  </table>
	<div class="ui pagination menu right" style="float:right">
	  <a class="active item">
	    1
	  </a>
	  <div class="disabled item">
	    ...
	  </div>
	  <a class="item">
	    10
	  </a>
	  <a class="item">
	    11
	  </a>
	  <a class="item">
	    12
	  </a>
	</div>
	<b>Total Amount: </b> P36,400.00</p>
	</div>
	
		<div class="ui bottom attached tab segment" data-tab="receivablesTab" style="padding-bottom:50px">
		<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="four wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	<div class="five wide field">
		      <label>Start Date</label>
		      <input type="date">
		    </div>
		    <div class="five wide field">
		      <label>End Date</label>
		      <input type="date">
		    </div>
		    </div>
		    <div class="three wide feild" style="float:right">
		      <button id="addReceivableBtn" class="ui button teal">Add Receivable</button>
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal">Print</button>
		    </div>
		  </div>
		  <table class="ui celled padded table">
		  <thead>
		    <tr>
		    <th>OR No. <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Customer <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Amount <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Transaction Date <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Due Date <i class="dropdown icon link" style="float:right"></i></th>
		  	</tr>
		  </thead>
		  <tbody>
		  	<tr>
		    <th>001523</th>
		    <th><a href="#">Ivan Wesley Chua</a>      <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P10,000.00</th>
		    <th>August 18, 2015</th>
		    <th>September 18, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001722</th>
		    <th><a href="#">Jean Lim</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P13,400.00</th>
		    <th>August 12, 2015</th>
		    <th>September 19, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001619</th>
		    <th><a href="#">Klifford Kho</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P1,300.00</th>
		    <th>August 11, 2015</th>
		    <th>October 1, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001605</th>
		    <th><a href="#">Curt Co</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P100.00</th>
		    <th>August 11, 2015</th>
		    <th>October 1, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001528</th>
		    <th><a href="#">Kiefer Lim</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P54,000.00</th>
		    <th>August 9, 2015</th>
		    <th>January 12, 2016</th>
		  	</tr>
		  	<tr>
		    <th>001511</th>
		    <th><a href="#">George Ong</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P500.00</th>
		    <th>August 8, 2015</th>
		    <th>September 18, 2015</th>
		  	</tr>
		  </tbody>
		  </table>
		<div class="ui pagination menu right" style="float:right">
		  <a class="active item">
		    1
		  </a>
		  <div class="disabled item">
		    ...
		  </div>
		  <a class="item">
		    10
		  </a>
		  <a class="item">
		    11
		  </a>
		  <a class="item">
		    12
		  </a>
		</div>
		<b>Total Amount: </b> P79,300.00</p>
	</div>
		<div class="ui bottom attached tab segment" data-tab="suppliersTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addSupplierBtn">Add Suppliers</button>
		    </div>
		  </div>
			<table class="ui celled padded table">
			  <thead>
			    <tr>
			    <th>Name <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Address <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Contact <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Terms <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Date Created <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Date Updated <i class="dropdown icon link" style="float:right"></i></th>
			  	</tr>
			  </thead>
			  <tbody>
			  	
			  </tbody>
			  </table>
		  
			<div class="ui pagination menu right" style="float:right">
			  <a class="active item">
			    1
			  </a>
			  <div class="disabled item">
			    ...
			  </div>
			  <a class="item">
			    10
			  </a>
			  <a class="item">
			    11
			  </a>
			  <a class="item">
			    12
			  </a>
			</div>
		</div>
		<div class="ui bottom attached tab segment" data-tab="customersTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addCustomerBtn">Add Customers</button>
		    </div>
		  </div>
			<table class="ui celled padded table">
			  <thead>
			    <tr>
			    <th>Name <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Address <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Contact <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Terms <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Date Created <i class="dropdown icon link" style="float:right"></i></th>
			    <th>Date Updated <i class="dropdown icon link" style="float:right"></i></th>
			  	</tr>
			  </thead>
			  <tbody>
			  	
			  </tbody>
			  </table>
			   
			<div class="ui pagination menu right" style="float:right">
			  <a class="active item">
			    1
			  </a>
			  <div class="disabled item">
			    ...
			  </div>
			  <a class="item">
			    10
			  </a>
			  <a class="item">
			    11
			  </a>
			  <a class="item">
			    12
			  </a>
			</div>
		</div>
	</div>

<!-- USER SETTINGS MODAL -->
<div id="userSettings" class="ui modal">
  <div class="header">User Settings</div>
  <div class="content">
    <form class="ui form">
    
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Username</label>      
		    </div>
		    <div class="eight wide field">
		      <label id="username">josephpalmaras</label>
		      <input id="usernametxt" type="text" value="josephpalmaras" disabled/>
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>First Name</label>      
		    </div>
		    <div class="eight wide field">
		    	<label id="fname">Joseph Gabriell</label>
		      <input id="fnametxt" type="text" value="Joseph Gabriell"/>
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Last Name</label>      
		    </div>
		    <div class="eight wide field">
		    	<label id="lname">Palmaras</label>
		      <input id="lnametxt" type="text" value="Palmaras"/>
		    </div>
		</div>
		<div id="currPass" class="inline fields">
		    <div class="two wide field">
		      <label>Password</label>      
		    </div>
		    <div class="eight wide field">
		      <text>********</text> <a id="changepass" href="#" onclick="changePassword()">change password</a>
		    </div>
		</div>
		<div id="newPass">
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Current Password</label>      
			    </div>
			    <div class="eight wide field">
			      <input type="text"/>
			    </div>
			</div>
			<div class="inline fields">
			    <div class="two wide field">
			      <label>New Password</label>      
			    </div>
			    <div class="eight wide field">
			      <input type="text"/>
			    </div>
			</div>
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Confirm New Password</label>      
			    </div>
			    <div class="eight wide field">
			      <input type="text"/>
			    </div>
			</div>
		</div>
    </form>
  </div>
		<div class="actions">
			<div id="editBtn" class="ui button teal" onclick="edit()">Edit</div>
			<div id="saveBtn" class="ui button teal" onclick="edit()">Save</div>
		    <div class="ui cancel button teal" onclick="cancelEdit()">Cancel</div>
		</div>
</div>


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