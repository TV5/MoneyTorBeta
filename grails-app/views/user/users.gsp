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
<title>User Management</title>
  <link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.css')}" type="text/css">
  <link rel="stylesheet" href="${resource(dir: 'datatables/media/css', file: 'jquery.dataTables.min.css')}" type="text/css">
  
  <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
  <script src="${resource(dir: 'datatables/media/js', file: 'jquery.dataTables.min.js')}"></script>
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
	<g:render template="../header/header" />
	
	<div class="ui top attached tabular menu">
	  <a data-tab="employeesTab" class="item active" >
	    EMPLOYEES
	  </a>
	  <a data-tab="administratorsTab" class="item">
	    ADMINISTRATORS
	  </a>
	</div>
	
	<g:render template="employeesTab" />
	<g:render template="administratorsTab" />
	<g:render template="addEmployeeModal" />
	<g:render template="addAdministratorModal" />
	<g:render template="editEmployeeModal" />
	<g:render template="editAdministratorModal" />

</div>
<g:render template="../header/userSettingsModal" />
<g:render template="../header/logout" />


</body>
<script type="text/javascript">

	$(document).ready(function() {
	    $('#employeesTable').DataTable();
	    $('#administratorsTable').DataTable();
	} );
	
	  //user settings
	$('#fnametxt').hide();
	$('#usernametxt').hide();
	$('#lnametxt').hide();
	$('#changepass').hide();
	$('#saveBtn').hide();
	$('#newPass').hide();
	
	function editEmployee(id, username, f_name, l_name, password, status){
		document.getElementById("empId").value=id;
		document.getElementById("empUsername").value=username;
		document.getElementById("empF_name").value=f_name;
		document.getElementById("empL_name").value=l_name;
		document.getElementById("empPassword").value=password;
		document.getElementById("empCpassword").value=password;
		document.getElementById("empStatus").value=status;
		$('#editemployee').modal('show');
	}

	function editAdmin(id, username, f_name, l_name, password, status){
		document.getElementById("adminId").value=id;
		document.getElementById("adminUsername").value=username;
		document.getElementById("adminF_name").value=f_name;
		document.getElementById("adminL_name").value=l_name;
		document.getElementById("adminPassword").value=password;
		document.getElementById("adminCpassword").value=password;
		document.getElementById("adminStatus").value=status;
		$('#editadministrator').modal('show');
	}
	
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
/*	$('#editadministratorBtn').click(function() {
		$('#editadministrator').modal('show');
	});
	*/
	$('#settingsLink').click(function(){

		$('#userSettings').modal('show');
	});
	
	$('#logoutLink').click(function(){
		$('#logout').modal('show');
	});

</script>
</html>
