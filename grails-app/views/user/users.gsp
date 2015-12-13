
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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

		<!-- Site Properities -->
		<title>User Management</title>
		<link rel="icon" type="image/png" href="${resource(dir: 'images', file: 'icon.png')}" />
	  	<link rel="stylesheet" href="${resource(dir: 'dist', file: 'semantic.css')}" type="text/css">
	  	<link rel="stylesheet" href="${resource(dir: 'datatables/media/css', file: 'jquery.dataTables.min.css')}" type="text/css">
	  
	  	<script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
	  	<script src="${resource(dir: 'datatables/media/js', file: 'jquery.dataTables.min.js')}"></script>
	  	<script src="${resource(dir: 'dist', file: 'semantic.js')}"></script>
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
	<script src="${resource(dir: 'js', file: 'main.js')}"></script>
</html>
