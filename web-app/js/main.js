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
