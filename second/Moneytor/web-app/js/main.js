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