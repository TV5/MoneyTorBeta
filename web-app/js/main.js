//document ready functions
$(document).ready(function() {
	$('#employeesTable').DataTable();
    $('#administratorsTable').DataTable();
    $('#customersTable').DataTable();
    $('#suppliersTable').DataTable();
    if(window.location.href.indexOf("?")!=-1){
		var tabId = window.location.href.split("?")[1].split("=")[1];
		var tabId = '#'+tabId;
		$(tabId).click();		
	}
    
    $("#caddMoreBtn").attr("disabled", "disabled");	    
    $("#eaddMoreB").attr("disabled", "disabled");	
    $("#aaddMoreB").attr("disabled", "disabled");	
    $("#max").datepicker();
    $("#maxR").datepicker();
    
	$(".payableNewSupplier").hide();
	$(".receivableNewCustomer").hide();
	
	//receivables
	var num = $('#receivablesNumEntries').val();
    var receivablesTable = $('#receivablesTable').DataTable({
    	"dom": '<"top"><"dateFilter">rt<"bottom"pB><"clear">',
		"pageLength": $('#receivablesNumEntries').val(),
		"buttons": ['excel', 'pdf', 'print'],
		"order": [[3, "asc"]]
	});

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

    //receivablesTable.buttons(0, null).container().appendTo(receivablesTable.table().container());
    
    $('#maxR').val(new Date().toDateInputValue());

	var maxR = new Date();

	maxR.setMonth(maxR.getMonth() - 1);
	$('#minR').val(maxR.toDateInputValue());
	
	
	var rend = $("#maxR").val();
  	var rdate = new Date(rend);
  	var ry = rdate.getFullYear();
  	var rd = rdate.getDate();
  	var rm = rdate.getMonth()-1;
  	var rNewDate = new Date(py,pm,pd);
  	$('#minR').datepicker( "setDate", rNewDate);
  	pUpdateStartDate($("#maxR"),$("#minR"));
  	$("#maxR").on('change', function(){
  		notifyDue();
  		pUpdateStartDate($("#maxR"),$("#minR"));
  	});
  	$('#minR').datepicker();
  	pUpdateStartDate($("#maxR"),$("#minR"));
  	$('#minR').datepicker( "setDate", new Date(ry, rm, rd));
  	
  	var rstart = $('#minR').val();
  	var rdate2 = new Date(rstart);
  	var ry2 = rdate2.getFullYear();
  	var rd2 = rdate2.getDate();
  	var rm2 = rdate2.getMonth()-1;
  	var rNewDate2 = new Date(ry2,rm2,rd2);
  	$('#maxR').datepicker( "setDate", rNewDate2);
  	pUpdateEndDate($("#minR"),$("#maxR"));
  	$("#minR").on('change', function(){
  		alert('change minR');
  		notifyDue();
  		pUpdateEndDate($("#minR"),$("#maxR"));
  	});
  	pUpdateEndDate($("#minR"),$("#maxR"));
  	$('#maxR').datepicker( "setDate", new Date());
	receivablesTable.draw();

	 function setreceivablesTotalAmt() {
	    var receivablesAmounts = $("#receivablesTable").dataTable().$('tr', {"filter":"applied"}).find(':nth-child(3)');
		var receivablesTotal = 0;
		for (var i = 0; i<receivablesAmounts.length; i++){
			receivablesAmounts[i] = receivablesAmounts[i].textContent;
			receivablesTotal+=parseFloat(receivablesAmounts[i]);
		}
		$('#receivablesTotal').html("Php "+receivablesTotal);
	}

	setreceivablesTotalAmt();
	
    $('#minR, #maxR').change( function() {
    	notifyDue();
        receivablesTable.draw();
        setreceivablesTotalAmt();
        alert('change minR maxR');
    });

   
    $('#searchReceivables').keyup(function(){
        notifyDue();  
    	receivablesTable.search($(this).val()).draw() ;
    })

    var filterR = receivablesTable.rows( { search:'applied' } ).data().each(function(value, index) {});

	$('#receivablesNumEntries').change(function(){
		notifyDue();
		 receivablesTable.page.len($('#receivablesNumEntries').val()).draw();
	});
    
    // payables
	//'<"top"><"toolbar"><"dateFilter">rt<"bottom"p><"exportBar">B<"clear">',
	var num = $('#payablesNumEntries').val();
	
    var payablesTable = $('#payablesTable').DataTable({
    	"dom": 'tBp',
		"pageLength": $('#payablesNumEntries').val(),
		"buttons": ['excel', 'pdf', 'print'],
		"order": [[3, "asc"]]
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

   // payablesTable.buttons(0, null).container().prependTo(payablesTable.table().container());

	$('#max').val(new Date().toDateInputValue());

	var max = new Date();

	max.setMonth(max.getMonth() - 1);
	$('#min').val(max.toDateInputValue());
	

  	var pend = $("#max").val();
  	var pdate = new Date(pend);
  	var py = pdate.getFullYear();
  	var pd = pdate.getDate();
  	var pm = pdate.getMonth()-1;
  	var pNewDate = new Date(py,pm,pd);
  	$('#min').datepicker( "setDate", pNewDate);
  	pUpdateStartDate($("#max"),$("#min"));
  	$("#max").on('change', function(){
  		notifyDue();
  		pUpdateStartDate($("#max"),$("#min"));
  	});
  	$('#min').datepicker();
  	pUpdateStartDate($("#max"),$("#min"));
  	$('#min').datepicker( "setDate", new Date(py, pm, pd));
  	
  	var pstart = $('#min').val();
  	var pdate2 = new Date(pstart);
  	var py2 = pdate2.getFullYear();
  	var pd2 = pdate2.getDate();
  	var pm2 = pdate2.getMonth()-1;
  	var pNewDate2 = new Date(py2,pm2,pd2);
  	$('#max').datepicker( "setDate", pNewDate2);
  	pUpdateEndDate($("#min"),$("#max"));
  	$("#min").on('change', function(){
  		notifyDue();
  		pUpdateEndDate($("#min"),$("#max"));
  	});
  	$('#max').datepicker();
  	pUpdateEndDate($("#min"),$("#max"));
  	$('#max').datepicker( "setDate", new Date());
	payablesTable.draw();
    
    function setPayablesTotalAmt(){
	    var payablesAmounts = $("#payablesTable").dataTable().$('tr', {"filter":"applied"}).find(':nth-child(3)');
		var payablesTotal=0;
		for (var i = 0; i<payablesAmounts.length; i++){
			payablesAmounts[i] = payablesAmounts[i].textContent;
			payablesTotal+=parseFloat(payablesAmounts[i]);
		}
		$('#payablesTotal').html("Php "+payablesTotal.toFixed(2));
	}

	setPayablesTotalAmt();

    $('#min, #max').change( function() {
    	notifyDue();
        payablesTable.draw();
    	setPayablesTotalAmt();
    });

    $('#searchPayables').keyup(function(){
    	notifyDue();
          payablesTable.search($(this).val()).draw() ;
    })

    var filter = payablesTable.rows( { search:'applied' } ).data().each(function(value, index) {});

	$('#payablesNumEntries').change(function(){
		notifyDue();
		payablesTable.page.len($('#payablesNumEntries').val()).draw();
	});
	
	

	$('#pdone').click(function() {
	    location.reload();
	});

	$('#rdone').click(function() {
	    window.location.replace("main?tab=receivablesTabLink");
	});
	
	$('#addCustDoneBtn').click(function() {
	    window.location.replace("main?tab=customersTabLink");
	});
	$('#sdone').click(function() {
	    window.location.replace("main?tab=suppliersTabLink");
	});
	
	$('#ecsave').click(function() {
	    window.location.replace("main?tab=customersTabLink");
	});
	$('#essave').click(function() {
	    window.location.replace("main?tab=suppliersTabLink");
	});
	
	$('#raddMoreBtn').attr("disabled", true);	
	$('#paddMoreBtn').attr("disabled", true);	
	
	$('#pcancel').on('click',function(){
		$('#addPayableForm').form('reset');
		$('#addPayable').modal('hide');
	});	
  	$('.ui.form').form({
  		fields: {
        	uF_name: {
          		identifier  : 'uF_name',
          		rules: [
	                {
	                  type   : 'empty',
	                  prompt : 'Please enter your First Name'
	                },
	                {
	                    type   : 'regExp[/^[a-zA-Z ]+$/]',
	                    prompt : 'Invalid input.'
	                }
          		]
            },
            uL_name: {
              	identifier  : 'uL_name',
              	rules: [
	                {
	                  	type   : 'empty',
	                  	prompt : 'Please enter your Last Name'
	                },
	                {
	                    type   : 'regExp[/^[a-zA-Z ]+$/]',
	                    prompt : 'Invalid input.'
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
  	
  	notifyDue();
  	$('.dt-button').addClass("export-btn ui tiny teal button")
  	$('.export-btn').removeClass("dt-button buttons-pdf buttons-html5");
});

function notifyDue(){
	var today = new Date();
  	today.setHours(0,0,0,0);
  	var overdue = '<div class="ui left red pointing label">Overdue</div>';
  	var dueToday = '<div class="ui left orange pointing label">Due today</div>';
  	$('.dueDate').each(function(){
  		var due = new Date (this.innerHTML);
  		due.setHours(0,0,0,0);
  		if(today.getTime() == due.getTime())
  			this.innerHTML += dueToday;
  		else if (today>due)
  			this.innerHTML += overdue;
  	});
}
>>>>>>> refs/remotes/origin/master

function pUpdateStartDate(max, min) {
	var maxVal =max.val(); 
    var date = new Date(maxVal);
    var date = new Date(maxVal);
    var currentMonth = date.getMonth();
    var currentDate = date.getDate()-1;
    var currentYear = date.getFullYear();
    min.datepicker( "option", "maxDate", new Date(currentYear, currentMonth, currentDate));
}

function pUpdateEndDate(min, max) {
	var maxVal =min.val(); 
    var date = new Date(maxVal);
    var date = new Date(maxVal);
    var currentMonth = date.getMonth();
    var currentDate = date.getDate()+1;
    var currentYear = date.getFullYear();
    max.datepicker( "option", "minDate", new Date(currentYear, currentMonth, currentDate));
}

//MODALS
$('.top.menu .item').tab();

$('#addemployeeBtn').click(function(){
	$('#addemployee').modal({
		closable: false
	})
	$('#addemployee').modal('show');
});	

$('#addadministratorBtn').click(function(){
	$('#addadministrator').modal({
		closable: false
	})
	$('#addadministrator').modal('show');
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

$('#logoutLink').click(function(){
	$('#logout').modal('show');
});

//edit stuffs
function editAdmin(id, username, f_name, l_name, password, status){
	document.getElementById("adminId").value = id;
	document.getElementById("adminUsername").value = username;
	document.getElementById("adminF_name").value = f_name;
	document.getElementById("adminL_name").value = l_name;
	document.getElementById("adminPassword").value = password;
	document.getElementById("adminCpassword").value = password;
	document.getElementById('ausernameTaken').innerText= null;
	document.getElementById('ausernameTaken').setAttribute("class", "");
	$('#editadministrator').modal({
		closable: false
	})
	$('#editadministrator').modal('show');
}

function paginate(){
	$('table.paginated').each(function() {
	    var currentPage = 0;
	    var numPerPage = 4;
	    var $table = $(this);
	    $table.bind('repaginate', function() {
	        $table.find('tbody tr').hide().slice(currentPage * numPerPage, (currentPage + 1) * numPerPage).show();
	    });
	    $table.trigger('repaginate');
	    var numRows = $table.find('tbody tr').length;
	    var numPages = Math.ceil(numRows / numPerPage);
	    var $pager = $('<div class="ui pagination menu pager" style="float:right; margin-bottom:5px;"></div>');
	    for (var page = 0; page < numPages; page++) {
	        $('<span class="ui teal item page-number"></span>').text(page + 1).bind('click', {
	            newPage: page
	        }, function(event) {
	            currentPage = event.data['newPage'];
	            $table.trigger('repaginate');
	            $(this).addClass('active').siblings().removeClass('active');
	        }).appendTo($pager).addClass('clickable');
	    }
	    $pager.insertBefore($table).find('span.page-number:first').addClass('active');
	});
}

function editEmployee(id, username, f_name, l_name, password, status){
	document.getElementById("empId").value = id;
	document.getElementById("empUsername").value = username;
	document.getElementById("empF_name").value = f_name;
	document.getElementById("empL_name").value = l_name;
	document.getElementById("empPassword").value = password;
	document.getElementById("empCpassword").value = password;
	document.getElementById('deactivated').innerText = null;
	document.getElementById('eusernameTaken').innerText= null;
	document.getElementById('eusernameTaken').setAttribute("class", "");
	$('#editemployee').modal({
		closable: false
	})
	$('#editemployee').modal('show');
}

function editSupplier(esname,esaddress,estelephone_no, esmobile_no,esterms,esid){
	$('#editSupplierModal').modal('show');
	$('#esname').val(esname);
	$('#esaddress').val(esaddress);
	$('#estelephone_no').val(estelephone_no);
	$('#esmobile_no').val(esmobile_no);
	var days = esterms;
	var esselect = "d";
	if (days % 7 == 0) {
		days = days / 7;
		esselect = "w";
	} else if (days % 30 == 0) {
		days = days / 30;
		esselect = "m";
	} else if (days % 365 == 0) {
		days = days / 365;
		esselect = "y";
	} else {
		days = days;
	}
	$('#esterms').val(days);
	$("#esselect").val(esselect);
	$("#esid").val(esid);
}

function editCustomer(ecname,ecaddress,ectelephone_no, ecmobile_no,ecterms,ecid){
	$('#editCustomerModal').modal('show');
	$('#ecname').val(ecname);
	$('#ecaddress').val(ecaddress);
	$('#ectelephone_no').val(ectelephone_no);
	$('#ecmobile_no').val(ecmobile_no);
	var days = ecterms;
	var ecselect = "d";
	if (days % 7 == 0) {
		days = days / 7;
		ecselect = "w";
	} else if (days % 30 == 0) {
		days = days / 30;
		ecselect = "m";
	} else if (days % 365 == 0) {
		days = days / 365;
		ecselect = "y";
	} else {
		days = days;
	}
	$('#ecterms').val(days);
	$("#ecselect").val(ecselect);
	$("#ecid").val(ecid);
}

function editReceivable(that, id, or_no, transactor_id, amount, date){
	var transName = $(that).parent().parent().find(":nth-child(2)").html()
	transName = $.trim(transName);
	$('#ercustomer_name').val(transName);
	$('#eror_no').val(or_no);
	$('#eramount').val(amount);
	$('#ertransaction_date').val(date.toString().split(' ')[0]);
	$('#receivable_id').val(id);
	$('#editReceivableModal').modal('show');
}

function editPayable(that,id, or_no, transactor_id, amount, date){
	var t = this.find(":nth-child(2)");
	console.log(t);
	sample = that;
	var transName = $(that).parent().parent().find(":nth-child(2)").html()
	transName = $.trim(transName);
	$('#epsupplier_name').val(transName);
	$('#epor_no').val(or_no);
	$('#epamount').val(amount);
	$('#eptransaction_date').val(date.toString().split(' ')[0]);
	$('#payable_id').val(id);
	$('#editPayableModal').modal('show');
}

function editTransactor(name, address, telephone_no, mobile_no, terms){
	document.getElementById("empId").value = id;
	document.getElementById("empUsername").value = username;
	document.getElementById("empF_name").value = f_name;
	document.getElementById("empL_name").value = l_name;
	document.getElementById("empPassword").value = password;
	document.getElementById("empCpassword").value = password;

	$('#editemployee').modal('show');
	
}

function editUserAccount(id, f_name, l_name, password){
	document.getElementById("uId").value = id;
	document.getElementById("uF_name").value = f_name;
	document.getElementById("uL_name").value = l_name;
	document.getElementById("uCurrentPass").value = password;
}

//unsorted
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
	
	$('.ui.form').form({
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

function toggleNewSupplier(){
	var selectedValue = document.getElementById("payabaleSupplierList").value;
	if(selectedValue == -1) {
		$(".payableNewSupplier").show();
	} else {
		$(".payableNewSupplier").hide();
	}
}

function toggleNewCustomer(){
	var selectedValue = document.getElementById("receivableCustomerList").value;
	if(selectedValue == -1) {
		$(".receivableNewCustomer").show();
	} else {
		$(".receivableNewCustomer").hide();
	}
}

function addNewCustomer() {
	$('#addCustomerBtn').click();
}

//used to check if input is a number with 2 decimal places
function checkDec(el){
	 var ex = /^[0-9]+\.?[0-9]*$/;
	 if(ex.test(el.value) == false){
	   el.value = el.value.substring(0,el.value.length - 1);
	 }
}

function tablePayment(acct_id){
	document.getElementById("tablePymnt").innerHTML = ""
	var d;
	var datestring;
	var myTable = '<table id="paymentsTable" class="ui paginated teal celled padded fixed table"><thead><tr><th>Date Received</th><th>Amount</th></tr></thead><tbody>';
	var boom = document.getElementById("yeah").innerHTML;
	$(jQuery.parseJSON(boom)).each(function() {  
        if(this.account == acct_id){
        	d = new Date(this.received_date);

        	myTable = myTable + '<tr><td>'+ d.toLocaleString() + '</td><td hidden>' + this.amount + '</td><td>PHP ' + (this.amount).toFixed(2) + '</td></tr>';
        }
		
	});
	myTable += '</tbody></table>';
	document.getElementById("tablePymnt").innerHTML = myTable;
	paginate();
}

function addPayment(account_id, acct_name, amt) {
	accid = account_id;
	tablePayment(account_id);
	amtbal = amt;  
	balance();
    
	document.getElementById("pmAccount_id").value = account_id;

	$('#pmAccountName').html(acct_name);
	
	$('#payments').modal({
		closable: false
	});
	$('#payments').modal('show');
	$('.ui.form').form({
      	fields: {
        	pmAmount: {
          		identifier  : 'pmAmount',
	            rules: [
	                {
	                  	type   : 'empty',
	                  	prompt : 'Please enter amount.'
	                },
	                {
	                    type   : 'regExp[/^\\d+\.?\\d{0,2}$/]',
	                    prompt : 'Invalid input.'
	                },
	                {
	                    type   : 'notExactly[0]',
	                    prompt : 'Please enter amount.'
	                }                    
	            ]
        	}
      	}
    });
}

function pymntAdded(){
	$("#yeah").load(location.href + " #yeah","");
	setTimeout(tablePayment(accid), 2000);
	balance();
}

function balance(){	   
	var rawr = 0;
    var rowsP = $("#paymentsTable tr:gt(0)");
    rowsP.children("td:nth-child(2)").each(function() {
    	rawr += parseFloat($(this).html());
    });
    
    if(rawr >= amtbal){
    	document.getElementById("totalpymnt").style.color = "green";
    }
    else{
    	document.getElementById("totalpymnt").style.color = "red";
    }
    
    $("#totalpymnt").html("PHP " + rawr.toFixed(2));
}


function validateAccount(errorList, errorDiv, transactorList, or_no, amount, transactorType, addMoreBtn, saveBtn, formInputs) {
	errorList.empty();
	if(transactorList == null || or_no == "" || amount == "" || amount < 1 || /[^a-zA-Z0-9]/.test( or_no)){
		errorDiv.show();
		
		if(transactorList == null){
			errorList.append('<li>Please select a supplier from the list provided.'+
					' If you cannot find the supplier you are looking for, please click <b>Create new record</b>'+
			' to add a new supplier.</li>');
		}
		
		if(or_no == ""){
			errorList.append('<li>Please enter an official receipt number.</li>');
		}

		else if( /[^a-zA-Z0-9]/.test( or_no) ){
			errorList.append('<li>Official receipt number must be alphanumeric.</li>');
		}
		
		if (amount == ""){
			errorList.append('<li>Please enter an amount.</li>');
		}
		else if(amount < 1){
			errorList.append('<li>Amount must be greater than zero.</li>');
		}
	}
	else {
		errorDiv.hide();
		addMoreBtn.attr("disabled", false);	
		saveBtn.val('Saved');
		saveBtn.attr("disabled", "disabled");	
		formInputs.attr('readonly',true);
		
	}
	
}	


function psaved() {
	var errorList = $('#addPayableErrorList');
	var errorDiv = $('#addPayableErrorDiv');
	var transactorList = $('#payabaleSupplierList').val();
	var or_no = $('#por_no').val();
	var amount = $('#pamount').val();
	var transactorType = "supplier";
	var addMoreBtn = $('#paddMoreBtn');
	var saveBtn = $('#savePayableBtn');
	var formInputs = $('#addPayableForm :input');
	validateAccount(errorList, errorDiv, transactorList, or_no, amount, transactorType, addMoreBtn, saveBtn, formInputs);
	$('#pdone').show();
	$('#pcancel').hide();
	$('#addPayableForm').find('input[type="text"], input[type="number"], input[type="checkbox"], select').prop("disabled", true);
} 

function paddmore(){
	$('#pdate').val('');
	$('#pamount').val('');
	$('#por_no').val('');
	$('#pname').val('');
	$('#paddress').val('');
	$('#ptelephone_no').val('');
	$('#pmobile_no').val('');
	$('#pterms').val('');
	$('#pselect').val('d');
	$('.payableNewSupplier').hide();
	$('#payabaleSupplierList').val('0');
	$('#savePayableBtn').val('Save');
	document.getElementById('paddMoreBtn').className = 'ui button'; 
	$('#savePayableBtn').removeAttr("disabled");
	$("#paddMoreBtn").attr("disabled", "disabled");		
	$('#pcancel').show();
	$('#pdone').hide();
	$('#addPayableForm').find('input[type="text"], input[type="number"], input[type="checkbox"], select').prop("disabled", false);
	$('#addPayableForm').find('input[type="text"], input[type="number"], input[type="checkbox"], select').attr("readonly", false);
}

function rsaved(){
	var errorList = $('#addReceivableErrorList');
	var errorDiv = $('#addReceivableErrorDiv');
	var transactorList = $('#receivableCustomerList').val();
	var or_no = $('#ror_no').val();
	var amount = $('#ramount').val();
	var transactorType = "customer";
	var addMoreBtn = $('#raddMoreBtn');
	var saveBtn = $('#saveReceivableBtn');
	var formInputs = $('#addReceivableForm :input');
	validateAccount(errorList, errorDiv, transactorList, or_no, amount, transactorType, addMoreBtn, saveBtn, formInputs);
	$('#rdone').show();
	$('#rcancel').hide();
	$('#addReceivableForm').find('input[type="text"], input[type="number"], input[type="checkbox"], select').prop("disabled", true);
}

function raddmore(){
	$('#rdate').val('');
	$('#ramount').val('');
	$('#ror_no').val('');
	$('#rname').val('');
	$('#raddress').val('');
	$('#rtelephone_no').val('');
	$('#rmobile_no').val('');
	$('#rterms').val('');
	$('#rselect').val('d');
	$('.receivableNewCustomer').hide();
	$('#receivableCustomerList').val('0');
	$('#saveReceivableBtn').val('Save');
	document.getElementById('raddMoreBtn').className = 'ui button'; 
	$('#saveReceivableBtn').removeAttr("disabled");
	$("#raddMoreBtn").attr("disabled", "disabled");
	$('#rcancel').show();
	$('#rdone').hide();
	$('#addReceivableForm').find('input[type="text"], input[type="number"], input[type="checkbox"], select').prop("disabled", false);
	$('#addReceivableForm').find('input[type="text"], input[type="number"], input[type="checkbox"], select').attr("readonly", false);
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

function csaved(){	
	document.getElementById('caddMoreBtn').className = 'ui teal button'; 
	document.getElementById('csaveBtn').value = 'Saved';
	$("#cDoneBtn").show();
	$("#cCancelBtn").hide();
	$("#csaveBtn").attr("disabled", "disabled");
	$("#caddMoreBtn").removeAttr("disabled");
	$('#cname').prop('readonly', true);
	$('#caddress').prop('readonly', true);
	$('#ctelephone_no').prop('readonly', true);
	$('#cmobile_no').prop('readonly', true);
	$('#cterms').prop('readonly', true);
	$('#cselect').prop('disabled', true);
}

function ssaved(){	
	document.getElementById('saddMoreBtn').className = 'ui teal button'; 
	document.getElementById('ssaveBtn').value = 'Saved';
	$("#sDoneBtn").show();
	$("#sCancelBtn").hide();
	$("#ssaveBtn").attr("disabled", "disabled");
	$("#saddMoreBtn").removeAttr("disabled");
	$('#sname').prop('readonly', true);
	$('#saddress').prop('readonly', true);
	$('#stelephone_no').prop('readonly', true);
	$('#smobile_no').prop('readonly', true);
	$('#sterms').prop('readonly', true);
	$('#sselect').prop('disabled', true);
}


	function addedEmployee(){
		var status = document.getElementById('usernameTakene').innerText;
		alert(status);
		if(status == "User has been saved."){
			$("#eaddMoreB").removeAttr("disabled");
			document.getElementById('esaveB').value = 'Saved';
			document.getElementById('esaveB').setAttribute("disabled","disabled");
		}else{
			document.getElementById('usernameTakene').removeAttribute("hidden");
			document.getElementById('usernameTakene').setAttribute("class", "");
			document.getElementById('usernameTakene').setAttribute("class","ui negative small message");
		}
}
	function changeUserStatus(){
		var status = document.getElementById('deactivated').innerText;
		if(status="deactivated"){
			$('#editemployee').modal('hide');
			$('#editadministrator').modal('hide');		
		}
	}
	function editedEmployee(){
		document.getElementById('eusernameTaken').setAttribute("class", "");
		var status = document.getElementById('eusernameTaken').innerText;
		if(status == "User information has been saved."){
			$('#editemployee').modal('hide');
		}else{
			document.getElementById('eusernameTaken').setAttribute("class","ui negative small message");
			document.getElementById('eusernameTaken').removeAttribute("hidden");
		}
	}
	function editedAdmin(){
		document.getElementById('eusernameTaken').setAttribute("class", "");		
		var status = document.getElementById('ausernameTaken').innerText;
		if(status == "User information has been saved."){
			$('#editadministrator').modal('hide');
		}else{
			document.getElementById('ausernameTaken').setAttribute("class","ui negative small message");
			document.getElementById('ausernameTaken').removeAttr("hidden");
		}
	}
function addedMoreEmployee(){
	alert("addmore");
	var status = document.getElementById('euserSaved').innerText;
	if(status == "true"){
		document.getElementById('esaveB').value = 'Save';
		$("#esaveB").removeAttr("disabled");
		document.getElementById('eaddMoreB').setAttribute("disabled","disabled");
		document.getElementById('usernameTakene').innerText = null;
		document.getElementById('euserSaved').innerText = null;
		document.getElementById('usernameTakene').setAttribute("class", "")
		document.getElementById('eresetBtn').click();

	}
}

function addedAdmin(){
	document.getElementById('usernameTakena').setAttribute("class", "");
	var status = document.getElementById('usernameTakena').innerText;
	if(status == "User has been saved."){
		document.getElementById('usernameTakena').setAttribute("class","ui message");
		$("#aaddMoreB").removeAttr("disabled");
		document.getElementById('asaveB').value = 'Saved';
		document.getElementById('asaveB').setAttribute("disabled","disabled");
	}else{
		document.getElementById('usernameTakena').setAttribute("class","ui negative small message");
		document.getElementById('usernameTakena').removeAttribute("hidden");
	}
} 
<<<<<<< HEAD

function addedMoreAdmin(){
	alert("addmore");
	var status = document.getElementById('auserSaved').innerText;
	if(status == "true"){
		$("#asaveB").removeAttr("disabled");
		document.getElementById('aaddMoreB').setAttribute("disabled","disabled");
		document.getElementById('usernameTakena').innerText = null;
		document.getElementById('auserSaved').innerText = null;
		document.getElementById('usernameTakena').setAttribute("class", "")
		document.getElementById('aresetBtn').click();

	}
}

=======
 
>>>>>>> refs/remotes/origin/master
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

function saddmoreClick(){
	document.getElementById('saddResetBtn').click();
	document.getElementById('ssaveBtn').value = 'Save';
	document.getElementById('saddMoreBtn').className = 'ui button'; 
	$("#ssaveBtn").removeAttr("disabled");
	$("#saddMoreBtn").attr("disabled", "disabled");
	$('#sname').prop('readonly', false);
	$('#saddress').prop('readonly', false);
	$('#stelephone_no').prop('readonly', false);
	$('#smobile_no').prop('readonly', false);
	$('#sterms').prop('readonly', false);
	$('#sselect').prop('disabled', false);
} 

function caddmoreClick(){
	document.getElementById('cresetBtn').click();
	document.getElementById('csaveBtn').value = 'Save';
	document.getElementById('caddMoreBtn').className = 'ui button'; 
	$("#csaveBtn").removeAttr("disabled");
	$("#caddMoreBtn").attr("disabled", "disabled");
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
	}
	else {
		alert('Form contains invalid data.  Please correct first');
		return false;
	}

	return true;
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

$.fn.dataTable.Api.register( 'sum()', function () {
    return this.flatten().reduce( function (a, b) {
        if ( typeof a === 'string' ) {
            a = a.replace(/[^\d.-]/g, '') * 1;
        }
        if ( typeof b === 'string' ) {
            b = b.replace(/[^\d.-]/g, '') * 1;
        }
 
        return a + b;
    }, 0 );
});
