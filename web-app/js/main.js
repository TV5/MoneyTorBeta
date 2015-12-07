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
		$('#addPayable').modal({
			closable: false
		})
		$('#addPayable').modal('show');
	});
	
	$('#addReceivableBtn').click(function(){
		$('#addReceivable').modal({
			closable: false
		})
		$('#addReceivable').modal('show');
	});
	
	$('#addSupplierBtn').click(function(){
		$('#addSupplier').modal({
			closable: false
		})
		$('#addSupplier').modal('show');
	});
	
	$('#addCustomerBtn').click(function(){
		$('#addCustomer').modal({
			closable: false
		})
		$('#addCustomer').modal('show');
	});
	
	function addNewCustomer() {
		$('#addCustomerBtn').click();
	}
	
	function addPayment(account_id){
		document.getElementById("pmAccount_id").value=account_id;
		$('#payments').modal('show');
	}
	
	$('#logoutLink').click(function(){
		$('#logout').modal('show');
	});

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
		
		$('.ui.form')
        .form({
          fields: {
              uCurrentPass: {
                identifier  : 'uCurrentPass'         
              },
            uCurrPass: {
              identifier  : 'uCurrPass',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter current password'
                },                
                {
                    type   : 'match[uCurrentPass]',
                    prompt : 'The current password entered is incorrect.'
                  }
                  
              ]
            },
            uNewPass: {
              identifier  : 'uNewPass',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your new password'
                },
                {
                  type   : 'length[8]',
                  prompt : 'Your new password must be at least 8 characters'
                }
              ]              
            },
            uCNewPass: {
              identifier  : 'uCNewPass',
              rules: [
                {
                  type   : 'match[uNewPass]',
                  prompt : 'Password does not match'
                }
              ]              
            }
          }
        });
	}
	
	$(document).ready(function() {
      $('.ui.form')
        .form({
          fields: {
            eusername: {
              identifier  : 'eusername',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your username'
                },                
                {
                    type   : 'length[8]',
                    prompt : 'Your username must be at least 8 characters'
                  }
                  
              ]
            },
            epassword: {
              identifier  : 'epassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[8]',
                  prompt : 'Your password must be at least 8 characters'
                }
              ]              
            },
            ecpassword: {
              identifier  : 'ecpassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please confirm your password'
                },
                {
                  type   : 'match[epassword]',
                  prompt : 'Password does not match'
                }
              ]              
            },
            ausername: {
              identifier  : 'ausername',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your username'
                },                
                {
                    type   : 'length[8]',
                    prompt : 'Your username must be at least 8 characters'
                 }
                  
              ]
            },
            apassword: {
              identifier  : 'apassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[8]',
                  prompt : 'Your password must be at least 8 characters'
                }
              ]              
            },
            acpassword: {
              identifier  : 'acpassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'match[apassword]',
                  prompt : 'Password does not match'
                }
              ]              
            },
            empUsername: {
              identifier  : 'empUsername',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your username'
                },                
                {
                    type   : 'length[8]',
                    prompt : 'Your username must be at least 8 characters'
                  }
                  
              ]
            },
            empPassword: {
              identifier  : 'empPassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[8]',
                  prompt : 'Your password must be at least 8 characters'
                }
              ]              
            },
            empCpassword: {
              identifier  : 'empCpassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'match[empPassword]',
                  prompt : 'Password does not match'
                }
              ]              
            },
            adminUsername: {
              identifier  : 'adminUsername',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your username'
                },                
                {
                    type   : 'length[8]',
                    prompt : 'Your username must be at least 8 characters'
                  }
                  
              ]
            },
            adminPassword: {
              identifier  : 'adminPassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[8]',
                  prompt : 'Your password must be at least 8 characters'
                }
              ]              
            },
            adminCpassword: {
              identifier  : 'adminCpassword',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'match[adminPassword]',
                  prompt : 'Password does not match'
                }
              ]              
            },
            uF_name: {
              identifier  : 'uF_name',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your First Name'
                }
              ]
            },
            uL_name: {
              identifier  : 'uL_name',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your Last Name'
                }
              ]
            },
            username: {
                identifier  : 'username',
                rules: [
                  {
                    type   : 'empty',
                    prompt : 'Please enter your username'
                  },                
                  {
                      type   : 'length[8]',
                      prompt : 'Your username must be at least 8 characters'
                    }
                    
                ]
              },
              password: {
                identifier  : 'password',
                rules: [
                  {
                    type   : 'empty',
                    prompt : 'Please enter your password'
                  },
                  {
                    type   : 'length[8]',
                    prompt : 'Your password must be at least 8 characters'
                  }
                ]
              }
          }
        });
    })
	
	function editUserAccount(id, f_name, l_name, password){
		document.getElementById("uId").value=id;
		document.getElementById("uF_name").value=f_name;
		document.getElementById("uL_name").value=l_name;
		document.getElementById("uCurrentPass").value=password;
	}
	
	function toggleNewSupplier(){
		$(".payableNewSupplier").toggle();
	}
	
	function toggleNewCustomer(){
		$(".receivableNewCustomer").toggle();
	}

	$(document).ready(function() {
		
		if(window.location.href.indexOf("?")!=-1){
			var tabId = window.location.href.split("?")[1].split("=")[1];
			var tabId = '#'+tabId;
			$(tabId).click();		
		}

		
		$(".payableNewSupplier").hide();
		$(".receivableNewCustomer").hide();
		
		//receivables
		var num = $('#receivablesNumEntries').val();
	    var receivablesTable = $('#receivablesTable').DataTable({
	    	"dom": '<"top"><"dateFilter">rt<"bottom"ip><"clear">',
			"pageLength": $('#receivablesNumEntries').val(),
			"order": [[4, "asc"]]
		});
	    function setreceivablesTotalAmt(){
		    var receivablesAmounts = $("#receivablesTable").dataTable().$('tr', {"filter":"applied"}).find(':nth-child(3)');
			var receivablesTotal=0;
			for (var i = 0; i<receivablesAmounts.length; i++){
				receivablesAmounts[i] = receivablesAmounts[i].textContent;
				receivablesTotal+=parseFloat(receivablesAmounts[i]);
			}
			$('#receivablesTotal').html("Php "+receivablesTotal);
		}
		setreceivablesTotalAmt();
	    $('#maxR').val(new Date().toDateInputValue());
		var maxR = new Date();
		maxR.setMonth(maxR.getMonth() - 1);
		$('#minR').val(maxR.toDateInputValue());
		receivablesTable.draw();
	    $('#minR, #maxR').change( function() {
	        receivablesTable.draw();
	        setreceivablesTotalAmt();
	    } );
	    new $.fn.dataTable.Buttons(receivablesTable, {
	        buttons: [
				{
				    extend: 'collection',
				    text: 'Export',
				    className: 'ui button teal',
				    buttons: [
						{
						    extend: 'copyHtml5',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'excelHtml5',
						    title: 'Receivables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'csvHtml5',
						    title: 'Receivables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'pdfHtml5',
						    title: 'Receivables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'print',
						    title: 'Receivables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						        columns: [ 0, 1, 2, 3, 4 ]
						    }
						}
				    ]
				}
	        ]
	    });

	    receivablesTable.buttons(0, null).container().prependTo(receivablesTable.table().container());

	    
	    $('#searchReceivables').keyup(function(){
	          receivablesTable.search($(this).val()).draw() ;
	    })
	    var filterR = receivablesTable.rows( { search:'applied' } ).data().each(function(value, index) {});
		$('#receivablesNumEntries').change(function(){
			 receivablesTable.page.len($('#receivablesNumEntries').val()).draw();
		});
	    
	    $('#paymentsTable').DataTable();
	    $('#customersTable').DataTable();
	    $('#suppliersTable').DataTable();

	    // payables
		var num = $('#payablesNumEntries').val();
		
	    var payablesTable = $('#payablesTable').DataTable({
			"dom": '<"top"><"dateFilter">rt<"bottom"ip><"clear">',
			"pageLength": $('#payablesNumEntries').val(),
			"order": [[4, "asc"]]
		});

	    new $.fn.dataTable.Buttons(payablesTable, {
	        buttons: [
				{
				    extend: 'collection',
				    text: 'Export',
				    className: 'ui button teal',
				    buttons: [
						{
						    extend: 'copyHtml5',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'excelHtml5',
						    title: 'Payables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'csvHtml5',
						    title: 'Payables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'pdfHtml5',
						    title: 'Payables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						    	columns: [ 0, 1, 2, 3, 4 ]
						    }
						},
						{
						    extend: 'print',
						    title: 'Payables Summary',
						    orientation: 'portrait',
						    pageSize: 'LETTER',
						    exportOptions: {
						        columns: [ 0, 1, 2, 3, 4 ]
						    }
						}
				    ]
				}
	        ]
	    });
	    payablesTable.buttons(0, null).container().prependTo(payablesTable.table().container());

		$('#max').val(new Date().toDateInputValue());
		var max = new Date();
		max.setMonth(max.getMonth() - 1);
		$('#min').val(max.toDateInputValue());
		payablesTable.draw();
	    function setPayablesTotalAmt(){
		    var payablesAmounts = $("#payablesTable").dataTable().$('tr', {"filter":"applied"}).find(':nth-child(3)');
			var payablesTotal=0;
			for (var i = 0; i<payablesAmounts.length; i++){
				payablesAmounts[i] = payablesAmounts[i].textContent;
				payablesTotal+=parseFloat(payablesAmounts[i]);
			}
			$('#payablesTotal').html("Php "+payablesTotal);
		}
		setPayablesTotalAmt();
	    $('#min, #max').change( function() {
	        payablesTable.draw();
	    	setPayablesTotalAmt();
	    } );
	    $('#searchPayables').keyup(function(){
	          payablesTable.search($(this).val()).draw() ;
	    })
	    var filter = payablesTable.rows( { search:'applied' } ).data().each(function(value, index) {});
		$('#payablesNumEntries').change(function(){
			 payablesTable.page.len($('#payablesNumEntries').val()).draw();
		});
		$('#pdone').click(function() {
		    location.reload();
		});
		$('#rdone').click(function() {
		    window.location.replace("main?tab=receivablesTabLink");
		});
		$('#raddMoreBtn').attr("disabled", true);	
		$('#paddMoreBtn').attr("disabled", true);	
		$('#pcancel').on('click',function(){
			$('#addPayableForm').form('reset');
			$('#addPayable').modal('hide');
		});
	} );
	
	function psaved(){
		$('#addPayableErrorList').empty();
		var por_no = $('#por_no').val();
		if($('#payabaleSupplierList').val()==null||por_no==""||$('#pamount').val()==""||$('#pamount').val()<1||/[^a-zA-Z0-9]/.test( por_no)){
			$('#addPayableErrorDiv').show();
			
			if($('#payabaleSupplierList').val()==null){
				$('#addPayableErrorList').append('<li>Please select a supplier from the list provided.'+
						' If you cannot find the supplier you are looking for, please click <b>Create new record</b>'+
				' to add a new supplier.</li>');
			}
			
			if(por_no==""){
				$('#addPayableErrorList').append('<li>Please enter an official receipt number.</li>');
			}
			else if( /[^a-zA-Z0-9]/.test( por_no) ){
				$('#addPayableErrorList').append('<li>Official receipt number must be alphanumeric.</li>');
			}
			
			if ($('#pamount').val()==""){
				$('#addPayableErrorList').append('<li>Please enter an amount.</li>');
			}
			else if($('#pamount').val()<1){
				$('#addPayableErrorList').append('<li>Amount must be greater than zero.</li>');
			}
		}
		else {
			$('#addPayableErrorDiv').hide();
			$('#paddMoreBtn').attr("disabled", false);	
			$('#savePayableBtn').val('Saved');
			$('#savePayableBtn').attr("disabled", "disabled");	
			$('#addPayableForm :input').attr('readonly','readonly');
		}
	} 

	function paddmore(){
		$('#pdate').val('');
		$('#pamount').val('');
		$('#por_no').val('');
		$('#payabaleSupplierList').val('0');
		$('#savePayableBtn').val('Save');
		document.getElementById('paddMoreBtn').className = 'ui button'; 
		$('#savePayableBtn').removeAttr("disabled");
		$("#paddMoreBtn").attr("disabled", "disabled");
		
	}
	
	function rsaved(){
		$('#addReceivableErrorList').empty();
		var ror_no = $('#ror_no').val();
		if($('#receivableCustomerList').val()==null||ror_no==""||$('#ramount').val()==""||$('#ramount').val()<1||/[^a-zA-Z0-9]/.test( ror_no)){
			$('#addReceivableErrorDiv').show();
			
			if($('#receivableCustomerList').val()==null){
				$('#addReceivableErrorList').append('<li>Please select a customer from the list provided.'+
						' If you cannot find the customer you are looking for, please click <b>Create new record</b>'+
				' to add a new customer.</li>');
			}
			
			if(ror_no==""){
				$('#addReceivableErrorList').append('<li>Please enter an official receipt number.</li>');
			}
			else if( /[^a-zA-Z0-9]/.test( ror_no) ){
				$('#addReceivableErrorList').append('<li>Official receipt number must be alphanumeric.</li>');
			}
			
			if ($('#ramount').val()==""){
				$('#addReceivableErrorList').append('<li>Please enter an amount.</li>');
			}
			else if($('#ramount').val()<1){
				$('#addReceivableErrorList').append('<li>Amount must be greater than zero.</li>');
			}
		}
		else {
			$('#addReceivableErrorDiv').hide();
			$('#raddMoreBtn').attr("disabled", false);	
			$('#saveReceivableBtn').val('Saved');
			$('#saveReceivableBtn').attr("disabled", "disabled");			
		}
	}
	
	function raddmore(){
		$('#rdate').val('');
		$('#ramount').val('');
		$('#ror_no').val('');
		$('#receivableCustomerList').val('0');
		$('#saveReceivableBtn').val('Save');
		document.getElementById('raddMoreBtn').className = 'ui button'; 
		$('#saveReceivableBtn').removeAttr("disabled");
		$("#raddMoreBtn").attr("disabled", "disabled");
	}
	
	Date.prototype.toDateInputValue = (function() {
	    var local = new Date(this);
	    local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
	    return local.toJSON().slice(0,10);
	});

	$('#settingsLink').click(function(){
		$('#userSettings').modal('show');
		$('.displaySec').hide();
		$('.displayFirst').show();
		$('#changepass').hide();
		$('#saveBtn').hide();
		$('#newPass').hide();
		$('.oldPass').show();
	});	

	function editReceivable(id, or_no, transactor_id, amount, date){
		$('#ercustomer_name').val(transactor_id);
		$('#eror_no').val(or_no);
		$('#eramount').val(amount);
		$('#ertransaction_date').val(date.toString().split(' ')[0]);
		$('#receivable_id').val(id);
		$('#editReceivableModal').modal('show');
	}
	
	function editPayable(id, or_no, transactor_id, amount, date){
		$('#epsupplier_name').val(transactor_id);
		$('#epor_no').val(or_no);
		$('#epamount').val(amount);
		$('#eptransaction_date').val(date.toString().split(' ')[0]);
		$('#payable_id').val(id);
		$('#editPayableModal').modal('show');
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
	


	$(document).ready(function() {
	    $('#employeesTable').DataTable();
	    $('#administratorsTable').DataTable();
	    $("#caddMoreBtn").attr("disabled", "disabled");
	    
	} );
	
	function editEmployee(id, username, f_name, l_name, password, status){
		document.getElementById("empId").value=id;
		document.getElementById("empUsername").value=username;
		document.getElementById("empF_name").value=f_name;
		document.getElementById("empL_name").value=l_name;
		document.getElementById("empPassword").value=password;
		document.getElementById("empCpassword").value=password;

		$('#editemployee').modal('show');
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

	function csaved(){
	
		document.getElementById('caddMoreBtn').className = 'ui teal button'; 
		document.getElementById('csaveBtn').value = 'Saved';
		$("#csaveBtn").attr("disabled", "disabled");
		$("#caddMoreBtn").removeAttr("disabled");
		$('#cname').prop('readonly', true);
		$('#caddress').prop('readonly', true);
		$('#ctelephone_no').prop('readonly', true);
		$('#cmobile_no').prop('readonly', true);
		$('#cterms').prop('readonly', true);
		$('#cselect').prop('disabled', true);
		} 

	function addedEmployee(){
		alert("Employee has been added!");		
		alert("added");
		/*document.getElementById('addMoreBtn').className = 'ui teal button'; 
		document.getElementById('saveBtn').value = 'Saved';
		$("#saveBtn").attr("disabled", "disabled");
		$("#addMoreBtn").removeAttr("disabled");*/

		} 
	function addedAdmin(){
		alert("added");
		/*document.getElementById('addMoreBtn').className = 'ui teal button'; 
		document.getElementById('saveBtn').value = 'Saved';
		$("#saveBtn").attr("disabled", "disabled");
		$("#addMoreBtn").removeAttr("disabled");*/

		} 
	function addmoreClick(){
		document.getElementById('saveBtn').value = 'Save';
		document.getElementById('addMoreBtn').className = 'ui button'; 
		$("#saveBtn").removeAttr("disabled");
		$("#addMoreBtn").attr("disabled", "disabled");
		document.getElementById('resetBtn').click();
		$('#name').prop('readonly', false);
		$('#address').prop('readonly', false);
		$('#telephone_no').prop('readonly', false);
		$('#mobile_no').prop('readonly', false);
		$('#terms').prop('readonly', false);
		$('#select').prop('disabled', false);
	}
	
	function caddmoreClick(){
		document.getElementById('csaveBtn').value = 'Save';
		document.getElementById('caddMoreBtn').className = 'ui button'; 
		$("#csaveBtn").removeAttr("disabled");
		$("#caddMoreBtn").attr("disabled", "disabled");
		document.getElementById('cresetBtn').click();
		$('#cname').prop('readonly', false);
		$('#caddress').prop('readonly', false);
		$('#ctelephone_no').prop('readonly', false);
		$('#cmobile_no').prop('readonly', false);
		$('#cterms').prop('readonly', false);
		$('#cselect').prop('disabled', false);

		} 
	
	function validateForm() {
		var form = document.getElementById('addCustomerForm');
		  if(form.validate()) {
		          return true;
		        }else {
		          alert('Form contains invalid data.  Please correct first');
		          return false;
		        }
		          return true;
		  }

	function convertTerms(days){
		if(days > 7 && days < 30)	{
			
		}	
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
	
	$.fn.dataTable.Api.register( 'sum()', function ( ) {
	    return this.flatten().reduce( function ( a, b ) {
	        if ( typeof a === 'string' ) {
	            a = a.replace(/[^\d.-]/g, '') * 1;
	        }
	        if ( typeof b === 'string' ) {
	            b = b.replace(/[^\d.-]/g, '') * 1;
	        }
	 
	        return a + b;
	    }, 0 );
	} );
	

