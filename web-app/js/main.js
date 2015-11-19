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
	
	$('.paymentsBtn').click(function(){
		$('#payments').modal('show');
	});
	
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
	}
	
	$(document)
    .ready(function() {
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
    });
	
	function editUserAccount(id, f_name, l_name, password){
		document.getElementById("uId").value=id;
		document.getElementById("uF_name").value=f_name;
		document.getElementById("uL_name").value=l_name;
		document.getElementById("uNewPass").value=password;
		document.getElementById("uCurrentPass").value=password;
	}
	
	$(document).ready(function() {
	    $('#receivablesTable').DataTable( {
	        dom: '',
	        ajax: '',
	        select: true,
	        buttons: [
	            { extend: 'create', editor: editor },
	            { extend: 'edit',   editor: editor },
	            { extend: 'remove', editor: editor },
	            {
	                extend: 'collection',
	                text: 'Export',
	                buttons: [
	                    'copy',
	                    'excel',
	                    'csv',
	                    'pdf',
	                    'print'
	                ]
	            }
	        ]
	    });
	    $('#customersTable').DataTable();
	    $('#suppliersTable').DataTable();
		var num = $('#payablesNumEntries').val();
	    var payablesTable = $('#payablesTable').DataTable({
			"dom": '<"top"f><"dateFilter">rt<"bottom"ip><"clear">',
			"pageLength": num
		});

	    // payables
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

	$('#settingsLink').click(function(){
		$('#userSettings').modal('show');
		$('.displaySec').hide();
		$('.displayFirst').show();
		$('#changepass').hide();
		$('#saveBtn').hide();
		$('#newPass').hide();
	});	

	/*function editPayable(id,or_no, transactor_id, amount, transaction_date) {
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
	}*/
	
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

	$(document).ready(function() {
	    $('#employeesTable').DataTable();
	    $('#administratorsTable').DataTable();
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
	

	function saved(){
		document.getElementById('addmore').className = 'ui teal button'; 
		document.getElementById('saveBtn').value = 'Saved';

		} 
	
	function addmore(){
		document.getElementById('saveBtn').value = 'Save';
		} 
	
	function checkSave(){
		if(document.getElementById('addmore').className == 'ui teal button'){
			return true;
		}else{
			return false;
		}
	}

		
