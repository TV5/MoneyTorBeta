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
	
	$('.paymentsBtn').click(function(){
		$('#payments').modal('show');
	});
	
	$('#logoutLink').click(function(){
		$('#logout').modal('show');
	});
	
	function editData() {
	    $('#editPayable').modal('show');
	}
	function editDataR() {
	    $('#editReceivable').modal('show');
	}
	
	

	function edit(){
		$('#saveBtn').show();
		$('.displayFirst').hide();
		$('.displaySec').show();
		$('#editBtn').hide();
	}
	
	function save(){
		$('#saveBtn').hide();
		$('.displayFirst').show();
		$('.displaySec').hide();
		$('#editBtn').show();
		$('#newPass').hide();
		$('.oldPass').show();
	}

	function changePassword(){
		$('.oldPass').hide();
		$('#newPass').show();
	}
	
	function editUserAccount(id, f_name, l_name, password){
		document.getElementById("uId").value=id;
		document.getElementById("uF_name").value=f_name;
		document.getElementById("uL_name").value=l_name;
		document.getElementById("uNewPass").value=password;

		$('#editemployee').modal('show');
	}

