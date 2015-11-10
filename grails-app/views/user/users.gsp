<<<<<<< HEAD:grails-app/views/user/users.gsp
<!DOCTYPE html>
<html>
<head>
<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Site Properities -->
<title>User Management</title>
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

body>.grid {
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
  </style>
</head>
<body>

<div class="ui container">
	<div class="ui text menu firstmenu" width="100%">
	  <img src="assets/images/logo.png" style="width:30px;height:30px;margin-top:5px">
	  <div class="header item">	   <a class="item" href="${createLink(controller: 'main', action: 'main', params: [username:user.username, userId:user.id, type: user.type])}">
		MONEYTOR	
	   </a>
	   </div>
	  
	  
	  <div class="right menu">
	   <a class="item link">
	     <b>${user.username}</b>
	   </a>
	   <a class="item" href="${createLink(controller: 'user', action: 'users', params: [username:user.username, userId:user.id, type:user.type])}">
			Users
	   </a>
	   <a id="settingsLink" class="item">
	     Settings
	   </a>
	   <a id="logoutLink" class="ui item">
	      Log out
	    </a>
	  </div>  
	</div>
	<div class="ui top attached tabular menu">
	  <a data-tab="employeesTab" class="item active" >
	    EMPLOYEES
	  </a>
	  <a data-tab="administratorsTab" class="item">
	    ADMINISTRATORS
	  </a>
	</div>

	
		<div class="ui bottom attached tab segment active" data-tab="employeesTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addemployeeBtn">Add employees</button>
		    </div>
		  </div>
			<table class="ui celled padded table">
				<thead>
					<tr>
						<th>Username <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>First Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>Last Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each var="emp" in="${empList}">
					<tr>
						<th>${emp.username }</th>
						<th>${emp.f_name}</th>
						<th>${emp.l_name }</th>
						<th><button class="ui button teal" id="editemployeeBtn">edit</button></th>
					</tr>
					</g:each>
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
		<div class="ui bottom attached tab segment" data-tab="administratorsTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addadministratorBtn">Add administrators</button>
		    </div>
		  </div>
			<table class="ui celled padded table">
				<thead>
					<tr>
						<th>Username <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>First Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>Last Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each var="admin" in="${adminList}">
					<tr>
						<th>${admin.username }</th>
						<th>${admin.f_name}</th>
						<th>${admin.l_name }</th>
						<th><button class="ui button teal" id="editemployeeBtn">edit</button></th>
					</tr>
					</g:each>				
				</tbody>
			</table>

			<div class="ui pagination menu right" style="float: right">
				<a class="active item"> 1 </a>
				<div class="disabled item">...</div>
				<a class="item"> 10 </a> <a class="item"> 11 </a> <a class="item">
					12 </a>
			</div>
		</div>
	</div>
	

		<!-- employee INFORMATION  -->
		<div id="addemployee" class="ui modal">
			<div class="header">Employee</div>
			<div class="content">
				<g:form class="ui form" controller="user" action="addEmployee">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ef_name" value="${ef_name}" placeholder="first name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="el_name" value="${el_name}" placeholder="last name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="eusername" value="${eusername}" placeholder="username" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="epassword" value="${password}" placeholder="password"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="ecpassword" value="${ecpassword}" placeholder="confirm password"/>
						</div>
					</div>
					<g:hiddenField name="etype" value="E" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
					<g:hiddenField name="userType" value="${user.type}" />
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="save" action="addEmployee"/>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>

		<!-- administrator INFORMATION  -->
		<div id="addadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">
				<g:form class="ui form" controller="user" action="addAdmin">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="af_name" value="${af_name}" placeholder="first name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="al_name" value="${al_name}" placeholder="last name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ausername" value="${ausername}" placeholder="username" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="apassword" value="${apassword}" placeholder="password"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="acpassword" value="${acpassword}" placeholder="confirm password"/>
						</div>
					</div>
					<g:hiddenField name="atype" value="A" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
					<g:hiddenField name="userType" value="${user.type}" />				
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="save" action="addAdmin"/>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>

<!-- edit employee INFORMATION  -->
		<div id="editemployee" class="ui modal">
			<div class="header">employee</div>
			<div class="content">
				<form class="ui form">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Trisha">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Lim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="trishalim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
							<input type="number" value="*******">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
							<input type="number">
						</div>
					</div>
				</form>
			</div>
			<div class="actions">
				<div class="ui approve button">Save</div>
				<div class="ui button">Change Status</div>
				<div class="ui cancel button">Cancel</div>
			</div>
		</div>

		<!-- edit administrator INFORMATION  -->
		<div id="editadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">
				<form class="ui form">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Trisha">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Lim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="trishalim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
							<input type="number" value="*******">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
							<input type="number">
						</div>
					</div>
				</form>
			</div>
			<div class="actions">
				<div class="ui approve button">Save</div>
				<div class="ui button">Change Status</div>
				<div class="ui cancel button">Cancel</div>
			</div>
		</div>

		<div id="logout" class="ui small test modal transition"
			style="margin-top: -92.5px;">
			<div class="header">Log out</div>
			<div class="content">
				<p>Are you sure you want to log out of your account</p>
			</div>
			<div class="actions">
				<div class="ui negative button">No</div>
				<div class="ui positive right labeled icon button">
					Yes <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
		
</div>

<!-- RECEIVABLE INFORMATION -->
<div id="addReceivable" class="ui modal">
  <div class="header">Account Receivable</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>administrator Name</label>      
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
		      <label>Employee Name</label>      
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


<!-- employee INFORMATION  -->
<div id="addemployee" class="ui modal">
  <div class="header">Employee</div>
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

<!-- administrator INFORMATION  -->
<div id="addadministrator" class="ui modal">
  <div class="header">Administrator</div>
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
      <div class="ui positive right labeled icon button" >
        <a href="${createLink(absolute:'http://localhost:8080/Moneytor/')}">Yes
        <i class="checkmark icon"></i></a>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	  //user settings
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
	//-----end user settings
	$('.top.menu .item').tab();
	
	$('#addemployeeBtn').click(function(){
		$('#addemployee').modal('show');
	});
	
	$('#addadministratorBtn').click(function(){
		$('#addadministrator').modal('show');
	});

	$('#editemployeeBtn').click(function() {
		$('#editemployee').modal('show');
	});

	$('#editadministratorBtn').click(function() {
		$('#editadministrator').modal('show');
	});
	
	$('#settingsLink').click(function(){

		$('#userSettings').modal('show');
	});
	
	$('#logoutLink').click(function(){
		$('#logout').modal('show');
	});

</script>
</html>
=======
<!DOCTYPE html>
<html>
<head>
<!-- Standard Meta -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

<!-- Site Properities -->
<title>User Management</title>
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

body>.grid {
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
  </style>
</head>
<body>

<div class="ui container">
	<div class="ui text menu firstmenu" width="100%">
	  <img src="assets/images/logo.png" style="width:30px;height:30px;margin-top:5px">
	  <div class="header item">	   <a class="item" href="${createLink(controller: 'main', action: 'main', params: [username:user.username, userId:user.id])}">
		MONEYTOR	
	   </a>
	   </div>
	  
	  
	  <div class="right menu">
	   <a class="item link">
	     <b>${user.username}</b>
	   </a>
	   <a class="item" href="${createLink(controller: 'user', action: 'users', params: [username:user.username, userId:user.id])}">
			Users
	   </a>
	   <a id="settingsLink" class="item">
	     Settings
	   </a>
	   <a id="logoutLink" class="ui item">
	      Log out
	    </a>
	  </div>  
	</div>
	<div class="ui top attached tabular menu">
	  <a data-tab="employeesTab" class="item active" >
	    EMPLOYEES
	  </a>
	  <a data-tab="administratorsTab" class="item">
	    ADMINISTRATORS
	  </a>
	</div>

	
		<div class="ui bottom attached tab segment active" data-tab="employeesTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addemployeeBtn">Add employees</button>
		    </div>
		  </div>
			<table class="ui celled padded table">
				<thead>
					<tr>
						<th>Username <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>First Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>Last Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each var="emp" in="${empList}">
					<tr>
						<th>${emp.username }</th>
						<th>${emp.f_name}</th>
						<th>${emp.l_name }</th>
						<th><button class="ui button teal" id="editemployeeBtn">edit</button></th>
					</tr>
					</g:each>
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
		<div class="ui bottom attached tab segment" data-tab="administratorsTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addadministratorBtn">Add administrators</button>
		    </div>
		  </div>
			<table class="ui celled padded table">
				<thead>
					<tr>
						<th>Username <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>First Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>Last Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<g:each var="admin" in="${adminList}">
					<tr>
						<th>${admin.username }</th>
						<th>${admin.f_name}</th>
						<th>${admin.l_name }</th>
						<th><button class="ui button teal" id="editemployeeBtn">edit</button></th>
					</tr>
					</g:each>				
				</tbody>
			</table>

			<div class="ui pagination menu right" style="float: right">
				<a class="active item"> 1 </a>
				<div class="disabled item">...</div>
				<a class="item"> 10 </a> <a class="item"> 11 </a> <a class="item">
					12 </a>
			</div>
		</div>
	</div>
	

		<!-- employee INFORMATION  -->
		<div id="addemployee" class="ui modal">
			<div class="header">Employee</div>
			<div class="content">
				<g:form class="ui form" controller="user" action="addEmployee">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ef_name" value="${ef_name}" placeholder="first name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="el_name" value="${el_name}" placeholder="last name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="eusername" value="${eusername}" placeholder="username" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="epassword" value="${password}" placeholder="password"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="ecpassword" value="${ecpassword}" placeholder="confirm password"/>
						</div>
					</div>
					<g:hiddenField name="etype" value="E" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="save" action="addEmployee"/>
				<div class="ui button">Add More</div>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>

		<!-- administrator INFORMATION  -->
		<div id="addadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">
				<g:form class="ui form" controller="user" action="addAdmin">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="af_name" value="${af_name}" placeholder="first name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="al_name" value="${al_name}" placeholder="last name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ausername" value="${ausername}" placeholder="username" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="apassword" value="${apassword}" placeholder="password"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="acpassword" value="${acpassword}" placeholder="confirm password"/>
						</div>
					</div>
					<g:hiddenField name="atype" value="A" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="save" action="addAdmin"/>
				<div class="ui button">Add More</div>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>

<!-- edit employee INFORMATION  -->
		<div id="editemployee" class="ui modal">
			<div class="header">employee</div>
			<div class="content">
				<form class="ui form">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Trisha">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Lim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="trishalim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
							<input type="number" value="*******">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
							<input type="number">
						</div>
					</div>
				</form>
			</div>
			<div class="actions">
				<div class="ui approve button">Save</div>
				<div class="ui button">Change Status</div>
				<div class="ui cancel button">Cancel</div>
			</div>
		</div>

		<!-- edit administrator INFORMATION  -->
		<div id="editadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">
				<form class="ui form">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Trisha">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="Lim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
							<input type="text" value="trishalim">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
							<input type="number" value="*******">
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
							<input type="number">
						</div>
					</div>
				</form>
			</div>
			<div class="actions">
				<div class="ui approve button">Save</div>
				<div class="ui button">Change Status</div>
				<div class="ui cancel button">Cancel</div>
			</div>
		</div>

		<div id="logout" class="ui small test modal transition"
			style="margin-top: -92.5px;">
			<div class="header">Log out</div>
			<div class="content">
				<p>Are you sure you want to log out of your account</p>
			</div>
			<div class="actions">
				<div class="ui negative button">No</div>
				<div class="ui positive right labeled icon button">
					Yes <i class="checkmark icon"></i>
				</div>
			</div>
		</div>
		
</div>

<!-- RECEIVABLE INFORMATION -->
<div id="addReceivable" class="ui modal">
  <div class="header">Account Receivable</div>
  <div class="content">
    <form class="ui form">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>administrator Name</label>      
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
		      <label>Employee Name</label>      
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


<!-- employee INFORMATION  -->
<div id="addemployee" class="ui modal">
  <div class="header">Employee</div>
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

<!-- administrator INFORMATION  -->
<div id="addadministrator" class="ui modal">
  <div class="header">Administrator</div>
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
      <div class="ui positive right labeled icon button" >
        <a href="${createLink(absolute:'http://localhost:8080/Moneytor/')}">Yes
        <i class="checkmark icon"></i></a>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
	  //user settings
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
	//-----end user settings
	$('.top.menu .item').tab();
	
	$('#addemployeeBtn').click(function(){
		$('#addemployee').modal('show');
	});
	
	$('#addadministratorBtn').click(function(){
		$('#addadministrator').modal('show');
	});

	$('#editemployeeBtn').click(function() {
		$('#editemployee').modal('show');
	});

	$('#editadministratorBtn').click(function() {
		$('#editadministrator').modal('show');
	});
	
	$('#settingsLink').click(function(){

		$('#userSettings').modal('show');
	});
	
	$('#logoutLink').click(function(){
		$('#logout').modal('show');
	});

</script>
</html>
>>>>>>> master:second/Moneytor/grails-app/views/user/users.gsp
