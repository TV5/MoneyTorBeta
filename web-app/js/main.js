//document ready functions
	var admn;
	var empt;
	
	var rDates;
	var pDates;
	
$(document).ready(function() {
	// Admin Search & Entries per page
	var numA = $('#adminNumEntries').val();
	window.admn = $('#administratorsTable').DataTable({
		"dom" : '<"top">tRip',
		"pageLength" : numA
	});
	$('#searchAdmins').keyup(function() {
		admn.search($(this).val()).draw();
	})
	$('#adminNumEntries').change(function() {
		admn.page.len($('#adminNumEntries').val()).draw();
	});
	var filterA = admn.rows({
		search : 'applied'
	}).data().each(function(value, index) {
	});

	// Employees Search & Entries per page

	var numE = $('#employeesNumEntries').val();
	window.empt = $('#employeesTable').DataTable({
		"dom" : '<"top">tRip',
		"pageLength" : $('#employeesNumEntries').val(),
		"order" : [ [ 0, "asc" ] ]
	});
	$('#employeesNumEntries').change(function() {
		empt.page.len($('#employeesNumEntries').val()).draw();
	});
	$('#searchEmployees').keyup(function() {
		empt.search($(this).val()).draw();
	})

	var filterE = empt.rows({
		search : 'applied'
	}).data().each(function(value, index) {
	});

	// var empt = $('#employeesTable').DataTable();



	// $('#administratorsTable').DataTable({"order":[[0,"asc"]]});
	if (window.location.href.indexOf("?") != -1) {
		var tabId = window.location.href.split("?")[1].split("=")[1];
		var tabId = '#' + tabId;
		$(tabId).click();
	}

	$("#caddMoreBtn").attr("disabled", "disabled");
	$("#eaddMoreB").attr("disabled", "disabled");
	$("#aaddMoreB").attr("disabled", "disabled");
	$("#maxP").datepicker();
	$("#maxR").datepicker();

	$(".payableNewSupplier").hide();
	$(".receivableNewCustomer").hide();

	// Customers Search & Entries per page
	$('#customersNumEntries').change(function() {
		customersTable.page.len($('#customersNumEntries').val()).draw();
	});
	var numC = $('#customersNumEntries').val();
	var customersTable = $('#customersTable').DataTable({
		"dom" : '<"top">tRip',
		"pageLength" : numC
	});
	$('#searchCustomers').keyup(function() {
		customersTable.search($(this).val()).draw();
	})

	var filterC = customersTable.rows({
		search : 'applied'
	}).data().each(function(value, index) {
	});

	// Suppliers Search & Entries per page
	$('#suppliersNumEntries').change(function() {
		suppliersTable.page.len($('#suppliersNumEntries').val()).draw();
	});
	var numS = $('#suppliersNumEntries').val();
	var suppliersTable = $('#suppliersTable').DataTable({
		"dom" : '<"top">tRip',
		"pageLength" : numS
	});
	$('#searchSuppliers').keyup(function() {
		suppliersTable.search($(this).val()).draw();
	})

	var filterS = suppliersTable.rows({
		search : 'applied'
	}).data().each(function(value, index) {
	});

	// receivables
	
	var num = $('#receivablesNumEntries').val();

	// receivablesTable.buttons(0,
	// null).container().appendTo(receivablesTable.table().container());

	$('#maxR').val(new Date().toDateInputValue());

	var maxR = new Date();

	maxR.setMonth(maxR.getMonth() - 1);
	$('#minR').val(maxR.toDateInputValue());

	var rend = $("#maxR").val();
	var rdate = new Date(rend);
	var ry = rdate.getFullYear();
	var rd = rdate.getDate();
	var rm = rdate.getMonth() - 1;
	var rNewDate = new Date(py, pm, pd);
	$('#minR').datepicker("setDate", rNewDate);
	pUpdateStartDate($("#maxR"), $("#minR"));
	$("#maxR").on('change', function() {
		notifyDue();
		pUpdateStartDate($("#maxR"), $("#minR"));
	});
	$('#minR').datepicker();
	pUpdateStartDate($("#maxR"), $("#minR"));
	$('#minR').datepicker("setDate", new Date(ry, rm, rd));

	var rstart = $('#minR').val();
	var rdate2 = new Date(rstart);
	var ry2 = rdate2.getFullYear();
	var rd2 = rdate2.getDate();
	var rm2 = rdate2.getMonth() - 1;
	var rNewDate2 = new Date(ry2, rm2, rd2);
	$('#maxR').datepicker("setDate", rNewDate2);
	pUpdateEndDate($("#minR"), $("#maxR"));
	$("#minR").on('change', function() {
		// alert('change minR');
		notifyDue();
		pUpdateEndDate($("#minR"), $("#maxR"));
	});
	pUpdateEndDate($("#minR"), $("#maxR"));
	$('#maxR').datepicker("setDate", new Date());
	
	rDates = $('#minR').val() + " - " + $('#maxR').val();
	console.log("rDates:" + rDates);
	
	var receivablesTable = $('#receivablesTable').DataTable({
		"dom" : 'tBp',
		"pageLength" : $('#receivablesNumEntries').val(),
		"buttons" : [ {
			extend : 'excelHtml5',
			title : 'Receivables Summary',
			orientation : 'portrait',
			pageSize : 'LETTER',
			exportOptions : {
				columns : [ 0, 1, 2, 3, 4 ]
			}
		}, {
			extend : 'pdfHtml5',
			title : 'Receivables Summary',
			orientation : 'portrait',
			pageSize : 'LETTER',
			exportOptions : {
				columns : [ 0, 1, 2, 3, 4 ]
			}
		}, {
			extend : 'print',
			title : 'Receivables Summary',
			orientation : 'portrait',
			pageSize : 'LETTER',
			exportOptions : {
				columns : [ 0, 1, 2, 3, 4 ]
			}
		} ],
		"order" : [ [ 3, "desc" ] ]
	});
	
	receivablesTable.draw();

	function setreceivablesTotalAmt() {
		var receivablesAmounts = $("#receivablesTable").dataTable().$('tr', {
			"filter" : "applied"
		}).find(':nth-child(3)');
		var receivablesTotal = 0;
		for (var i = 0; i < receivablesAmounts.length; i++) {
			receivablesAmounts[i] = receivablesAmounts[i].textContent;
			receivablesTotal += parseFloat(receivablesAmounts[i]);
		}
		$('#receivablesTotal').html("Php " + receivablesTotal.toFixed(2));
	}

	setreceivablesTotalAmt();

	$('#minR, #maxR').change(function() {
		notifyDue();
		rDates = $('#minR').val() + " - " + $('#maxR').val();
		console.log("rDates:" + rDates);
		receivablesTable.draw();
		setreceivablesTotalAmt();
		// alert('change minR maxR');
	});

	$('#searchReceivables').keyup(function() {
		notifyDue();
		receivablesTable.search($(this).val()).draw();
	})

	var filterR = receivablesTable.rows({
		search : 'applied'
	}).data().each(function(value, index) {
	});

	$('#receivablesNumEntries').change(function() {
		notifyDue();
		receivablesTable.page.len($('#receivablesNumEntries').val()).draw();
	});

	// payables
	// '<"top"><"toolbar"><"dateFilter">rt<"bottom"p><"exportBar">B<"clear">',
	var num = $('#payablesNumEntries').val();

	// payablesTable.buttons(0,
	// null).container().prependTo(payablesTable.table().container());

	$('#maxP').val(new Date().toDateInputValue());

	var max = new Date();

	max.setMonth(max.getMonth() - 1);
	$('#minP').val(max.toDateInputValue());

	var pend = $("#maxP").val();
	var pdate = new Date(pend);
	var py = pdate.getFullYear();
	var pd = pdate.getDate();
	var pm = pdate.getMonth() - 1;
	var pNewDate = new Date(py, pm, pd);
	$('#minP').datepicker("setDate", pNewDate);
	pUpdateStartDate($("#maxP"), $("#minP"));
	$("#maxP").on('change', function() {
		notifyDue();
		pUpdateStartDate($("#maxP"), $("#minP"));
	});
	$('#minP').datepicker();
	pUpdateStartDate($("#maxP"), $("#minP"));
	$('#minP').datepicker("setDate", new Date(py, pm, pd));

	var pstart = $('#minP').val();
	var pdate2 = new Date(pstart);
	var py2 = pdate2.getFullYear();
	var pd2 = pdate2.getDate();
	var pm2 = pdate2.getMonth() - 1;
	var pNewDate2 = new Date(py2, pm2, pd2);
	$('#maxP').datepicker("setDate", pNewDate2);
	pUpdateEndDate($("#minP"), $("#maxP"));
	$("#minP").on('change', function() {
		notifyDue();
		pUpdateEndDate($("#minP"), $("#maxP"));
	});
	$('#maxP').datepicker();
	pUpdateEndDate($("#minP"), $("#maxP"));
	$('#maxP').datepicker("setDate", new Date());
	
	pDates = $('#minP').val() + " - " + $('#maxP').val();
	console.log("pDates:" + pDates);
	
	var payablesTable = $('#payablesTable').DataTable({
		"dom" : 'tBp',
		"pageLength" : $('#payablesNumEntries').val(),
		"buttons" : [ {
			extend : 'excelHtml5',
			title : 'Payables Summary',
			orientation : 'portrait',
			pageSize : 'LETTER',
			exportOptions : {
				columns : [ 0, 1, 2, 3, 4 ]
			}
		}, {
			extend : 'pdfHtml5',
			title : 'Payables Summary',
			orientation : 'portrait',
			pageSize : 'LETTER',
			exportOptions : {
				columns : [ 0, 1, 2, 3, 4 ]
			}
		}, {
			extend : 'print',
			title : 'Payables Summary',
			orientation : 'portrait',
			pageSize : 'LETTER',
			exportOptions : {
				columns : [ 0, 1, 2, 3, 4 ]
			}
		} ],
		"order" : [ [ 3, "desc" ] ]
	});
	
	payablesTable.draw();

	function setPayablesTotalAmt() {
		var payablesAmounts = $("#payablesTable").dataTable().$('tr', {
			"filter" : "applied"
		}).find(':nth-child(3)');
		var payablesTotal = 0;
		for (var i = 0; i < payablesAmounts.length; i++) {
			payablesAmounts[i] = payablesAmounts[i].textContent;
			payablesTotal += parseFloat(payablesAmounts[i]);
		}
		$('#payablesTotal').html("Php " + payablesTotal.toFixed(2));
	}

	setPayablesTotalAmt();

	$('#minP, #maxP').change(function() {
		notifyDue();
		pDates = $('#minP').val() + " - " + $('#maxP').val();
		console.log("pDates:" + pDates);
		payablesTable.draw();
		setPayablesTotalAmt();
	});

	$('#searchPayables').keyup(function() {
		notifyDue();
		payablesTable.search($(this).val()).draw();
	})

	var filter = payablesTable.rows({
		search : 'applied'
	}).data().each(function(value, index) {
	});

	$('#payablesNumEntries').change(function() {
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

	$('#pcancel').on('click', function() {
		$('#addPayableForm').form('reset');
		$('#addPayable').modal('hide');
	});
	$('.ui.form').form({
		fields : {
			uF_name : {
				identifier : 'uF_name',
				rules : [ {
					type : 'empty',
					prompt : 'First Name must not be blank.'
				}, {
					type : 'regExp[/^[a-zA-Z .]+$/]',
					prompt : 'Invalid input.'
				} ]
			},
			uL_name : {
				identifier : 'uL_name',
				rules : [ {
					type : 'empty',
					prompt : 'Last Name must not be blank.'
				}, {
					type : 'regExp[/^[a-zA-Z .]+$/]',
					prompt : 'Invalid input.'
				} ]
			},
			username : {
				identifier : 'username',
				rules : [ {
					type : 'empty',
					prompt : 'Please enter your username'
				}, {
					type : 'length[8]',
					prompt : 'Your username must be at least 8 characters'
				} ]
			},
			password : {
				identifier : 'password',
				rules : [ {
					type : 'empty',
					prompt : 'Please enter your password'
				}, {
					type : 'length[8]',
					prompt : 'Your password must be at least 8 characters'
				} ]
			}
		}
	});

	notifyDue();
	$('.dt-button').addClass("export-btn ui tiny teal button");
	$('.export-btn').removeClass("dt-button buttons-pdf buttons-html5");

	$('#payablesNumEntries').on('change', notifyDue);
	$('#receivablesNumEntries').on('change', notifyDue);
});

function notifyDue() {
	var today = new Date();
	today.setHours(0, 0, 0, 0);
	var overdue = '<div class="ui left red pointing label">Overdue</div>';
	var dueToday = '<div class="ui left orange pointing label">Due today</div>';
	$('.dueDate').each(function() {
		var due = new Date(this.innerHTML);
		due.setHours(0, 0, 0, 0);
		if (today.getTime() == due.getTime())
			this.innerHTML += dueToday;
		else if (today > due)
			this.innerHTML += overdue;
	});
}
function pUpdateStartDate(max, min) {
	var maxVal = max.val();
	var date = new Date(maxVal);
	var date = new Date(maxVal);
	var currentMonth = date.getMonth();
	var currentDate = date.getDate() - 1;
	var currentYear = date.getFullYear();
	min.datepicker("option", "maxDate", new Date(currentYear, currentMonth,
			currentDate));
}

function pUpdateEndDate(min, max) {
	var maxVal = min.val();
	var date = new Date(maxVal);
	var date = new Date(maxVal);
	var currentMonth = date.getMonth();
	var currentDate = date.getDate() + 1;
	var currentYear = date.getFullYear();
	max.datepicker("option", "minDate", new Date(currentYear, currentMonth,
			currentDate));
}

// MODALS
$('.top.menu .item').tab();

$('#addemployeeBtn').click(function() {
	$('#addemployee').modal({
		closable : false
	})
	$('#addemployee').modal('show');
});

$('#addadministratorBtn').click(function() {
	$('#addadministrator').modal({
		closable : false
	})
	$('#addadministrator').modal('show');
});

$('#addPayableBtn').click(function() {
	$('#addPayable').modal({
		closable : false
	})

	$('#addPayable').modal('show');
});

$('#addReceivableBtn').click(function() {
	$('#addReceivable').modal({
		closable : false
	})
	$('#addReceivable').modal('show');
});

$('#addSupplierBtn').click(function() {
	$('#addSupplier').modal({
		closable : false
	})
	$('#addSupplier').modal('show');
});

$('#addCustomerBtn').click(function() {
	$('#addCustomer').modal({
		closable : false
	})
	$('#addCustomer').modal('show');
});

$('#logoutLink').click(function() {
	$('#logout').modal('show');
});

// edit stuffs
function editAdmin(id, username, f_name, l_name, password, status) {
	document.getElementById("adminId").value = id;
	document.getElementById("adminUsername").value = username;
	document.getElementById("adminF_name").value = f_name;
	document.getElementById("adminL_name").value = l_name;
	document.getElementById("adminPassword").value = password;
	document.getElementById("adminCpassword").value = password;
	document.getElementById('ausernameTaken').innerText = null;
	document.getElementById('ausernameTaken').setAttribute("class", "");
	$('#editadministrator').modal({
		closable : false
	})
	$('#editadministrator').modal('show');
}

function paginate() {
	$('table.paginated')
			.each(
					function() {
						var currentPage = 0;
						var numPerPage = 4;
						var $table = $(this);
						$table.bind('repaginate', function() {
							$table.find('tbody tr').hide().slice(
									currentPage * numPerPage,
									(currentPage + 1) * numPerPage).show();
						});
						$table.trigger('repaginate');
						var numRows = $table.find('tbody tr').length;
						var numPages = Math.ceil(numRows / numPerPage);
						var $pager = $('<div class="ui pagination menu pager" style="float:right; margin-bottom:5px;"></div>');
						for (var page = 0; page < numPages; page++) {
							$('<span class="ui teal item page-number"></span>')
									.text(page + 1)
									.bind(
											'click',
											{
												newPage : page
											},
											function(event) {
												currentPage = event.data['newPage'];
												$table.trigger('repaginate');
												$(this).addClass('active')
														.siblings()
														.removeClass('active');
											}).appendTo($pager).addClass(
											'clickable');
						}
						$pager.insertBefore($table).find(
								'span.page-number:first').addClass('active');
					});
}

function editEmployee(id, username, f_name, l_name, password, status) {
	document.getElementById("empId").value = id;
	document.getElementById("empUsername").value = username;
	document.getElementById("empF_name").value = f_name;
	document.getElementById("empL_name").value = l_name;
	document.getElementById("empPassword").value = password;
	document.getElementById("empCpassword").value = password;
	document.getElementById('deactivated').innerText = null;
	document.getElementById('eusernameTaken').innerText = null;
	document.getElementById('eusernameTaken').setAttribute("class", "");
	$('#editemployee').modal({
		closable : false
	})
	$('#editemployee').modal('show');
}

function editSupplier(esname, esaddress, estelephone_no, esmobile_no, esterms,
		esid) {
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

function editCustomer(ecname, ecaddress, ectelephone_no, ecmobile_no, ecterms,
		ecid) {
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

function editReceivable(that, id, or_no, transactor_id, amount, date, status) {
	var transName = $(that).parent().parent().find(":nth-child(2)").html()
	transName = $.trim(transName);
	$('#ercustomer_name').val(transName);
	$('#eror_no').val(or_no);
	$('#eramount').val(amount);
	$('#ertransaction_date').val(date.toString().split(' ')[0]);
	$('#receivable_id').val(id);
	if (status == 'H') {
		alert("Cannot edit because this account has a payment already!");
	} else {
		$('#editReceivableModal').modal('show');
	}
}

function editPayable(that, id, or_no, transactor_id, amount, date, status) {
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
	if (status == 'H') {
		alert("Cannot edit because this account has a payment already!");
	} else {
		$('#editPayableModal').modal('show');
	}	
}

function editTransactor(name, address, telephone_no, mobile_no, terms) {
	document.getElementById("empId").value = id;
	document.getElementById("empUsername").value = username;
	document.getElementById("empF_name").value = f_name;
	document.getElementById("empL_name").value = l_name;
	document.getElementById("empPassword").value = password;
	document.getElementById("empCpassword").value = password;

	$('#editemployee').modal('show');
}

function editUserAccount(vid, vf_name, vl_name, vpassword) {
	document.getElementById("uId").value = vid;
	document.getElementById("uF_name").value = vf_name;
	document.getElementById("uL_name").value = vl_name;
	document.getElementById("uCurrentPass").value = vpassword;
}

// unsorted
function edit() {
	$('#saveBtn').show();
	$('.displayFirst').hide();
	$('.displaySec').show();
	$('#editBtn').hide();
}

function save() {
	$('#saveBtn').hide();
	$('.displayFirst').show();
	$('.displaySec').hide();
	$('#editBtn').show();
	$('#newPass').hide();
	$('.oldPass').show();
}

function changePassword() {
	$('.oldPass').hide();
	$('#newPass').show();

	$('.ui.form').form({
		fields : {
			uCurrentPass : {
				identifier : 'uCurrentPass'
			},
			uCurrPass : {
				identifier : 'uCurrPass',
				rules : [ {
					type : 'empty',
					prompt : 'Please input current password'
				}, {
					type : 'match[uCurrentPass]',
					prompt : 'The current password inputted is incorrect.'
				} ]
			},
			uNewPass : {
				identifier : 'uNewPass',
				rules : [ {
					type : 'empty',
					prompt : 'Please input your new password'
				}, {
					type : 'length[8]',
					prompt : 'New password must be at least 8 characters'
				}, {
					type : 'different[uCurrentPass]',
					prompt : 'New password matches your old password. Please input a new one.'
				} ]
			},
			uCNewPass : {
				identifier : 'uCNewPass',
				rules : [{
					type : 'empty',
					prompt : 'Please confirm your new password'
				}, {
					type : 'match[uNewPass]',
					prompt : 'Passwords do not match.'
				} ]
			}
		}
	});
}

function toggleNewSupplier() {
	var selectedValue = document.getElementById("payabaleSupplierList").value;
	if (selectedValue == -1) {
		$(".payableNewSupplier").show();
	} else {
		$(".payableNewSupplier").hide();
	}
}

function toggleNewCustomer() {
	var selectedValue = document.getElementById("receivableCustomerList").value;
	if (selectedValue == -1) {
		$(".receivableNewCustomer").show();
	} else {
		$(".receivableNewCustomer").hide();
	}
}

function addNewCustomer() {
	$('#addCustomerBtn').click();
}

// used to check if input is a number with 2 decimal places
function checkDec(el) {
	var ex = /^[0-9]+\.?[0-9]*$/;
	if (ex.test(el.value) == false) {
		el.value = el.value.substring(0, el.value.length - 1);
	}
}

var amtbal;
var boom;
function tablePayment(acct_id) {
	$('#errr').hide();
	var d;
	var datestring;
	var myRow = " ";
	var myTable = '<table id="paymentsTable" class="ui teal celled padded fixed table"><thead><tr><th>Date Received</th><th>Amount</th></tr></thead><tbody>';
	boom = document.getElementById("yeah").innerHTML;
	$(jQuery.parseJSON(boom)).each(
			function() {
				if (this.account == acct_id) {
					d = new Date(this.received_date);

					myRow = '<tr><td>' + d.toLocaleString()
							+ '</td><td hidden>' + this.amount
							+ '</td><td>PHP ' + (this.amount).toFixed(2)
							+ '</td></tr>' + myRow;
				}

			});
	myTable = myTable + myRow + '</tbody></table>';
	document.getElementById("tablePymnt").innerHTML = myTable;
	var grr = document.getElementById("paymentsTable");
	if(grr.rows.length == 1){
		var rrow = grr.insertRow(1);
		var cellz = rrow.insertCell(0);
		var cellz1 = rrow.insertCell(1);
		cellz.innerHTML = "No payments added yet.";
		grr.rows[1].style.backgroundColor = "#F9F9F9";
		grr.rows[1].style.textAlign = "center";	
		$('#totalpymnt').text("PHP " + parseFloat(amtbal).toFixed(2));
	}
	else
		balance();
}

var amt;
var acct_type;
function addPayment(account_id, acct_name, amts, type) {
	accid = account_id;
	acct_type = type;
	amtbal = amts;
	amt = amtbal;
	tablePayment(account_id);
	document.getElementById("pmAccount_id").value = account_id;
	$('#pmAccountName').html(acct_name);

	$('#payments').modal({
		closable : false
	});
	$('#payments').modal('show');
	$('.ui.form').form({
		fields : {
			pmAmount : {
				identifier : 'pmAmount',
				rules : [ {
					type : 'empty',
					prompt : 'Please input amount.'
				}, {
					type : 'doesntContainExactly[-]',
					prompt : 'Amount must be greater than 0.00 PHP'
				}, {
					type : 'notExactly[0]',
					prompt : 'Amount must be greater than 0.00 PHP'
				},{
					type : 'regExp[/^(\\d+|\\d{1,3}(,\\d{3})*)(\\.\\d+)?$/]',
					prompt : 'Amount must only contain valid decimal numbers.'
				}]
			}
		}
	});
}

function pymntAdded() {
	var smt = document.getElementById("pmAmount").value;
	if(!isNaN(smt.replace(/,/g, ''))){
		setTimeout(function(){
			amt -= parseFloat(smt.replace(/,/g, ''));
			if(amt >= 0) {
				$('#errr').hide();
				if($('.ui .error .message').length == 0){
					$("#yeah").load(location.href + " #yeah", function() {});
					var appTable = document.getElementById("paymentsTable");
					var row = appTable.insertRow(2);
					if(appTable.rows[1].cells[0].innerHTML == "No payments added yet.")
						appTable.deleteRow(1);
					var cell1 = row.insertCell(0);
					var cell2 = row.insertCell(1);
					var date = new Date();	
					
					cell1.innerHTML = date.toLocaleString();
					cell2.innerHTML = "PHP " + parseFloat(smt.replace(/,/g, '')).toFixed(2);
							
					$("#totalpymnt").html("PHP " + amt.toFixed(2));
					if (amt == 0)				
						document.getElementById("totalpymnt").style.color = "green";
				}
			}
			else if(amt < 0){
				amt += parseFloat(smt.replace(/,/g, ''));
				$('#errr').show();
			}
		}, 300);
	}
}

function confirmPay(){	
	if(amt == 0){
		$("#confirm").show();
	}
	else{
		loadPayment();
	}
}

function loadPayment(){
	if(acct_type == "p")
		window.location.replace("main?tab=payablesTabLink");
	else if(acct_type == "r")
		window.location.replace("main?tab=receivablesTabLink");
}

function balance(){	   
	var rawr = 0;
	var rowsP = $("#paymentsTable tr:gt(0)");
	rowsP.children("td:nth-child(2)").each(function() {
		rawr += parseFloat($(this).html());
	});
	amt = amtbal - rawr;
	$("#totalpymnt").html("PHP " + amt.toFixed(2));
	document.getElementById("totalpymnt").style.color = "red";
}

function psaved() {
	$('#addPayableErrorList').show();
	$('#pdone').show();
	$('#pcancel').hide();
	if (document.getElementById('addPayableErrorList').innerText == "") {
		$('#addPayableForm')
				.find(
						'input[type="text"], input[type="number"], input[type="checkbox"], select')
				.prop("disabled", true);
		$('#paddMoreBtn').attr("disabled", false);
		$('#savePayableBtn').val('Saved');
		$('#savePayableBtn').attr("disabled", "disabled");
		$('#addPayableErrorList').hide();
	}
}

function pesaved() {
	$('#editPayableErrorList').show();
	if (document.getElementById('editPayableErrorList').innerText == "") {
		$('#editPayableErrorList').hide();
		window.location.replace("main?tab=payablesTabLink");
	}
}
function resaved() {
	$('#editReceivableErrorList').show();
	if (document.getElementById('editReceivableErrorList').innerText == "") {
		$('#editReceivableErrorList').hide();
		window.location.replace("main?tab=receivablesTabLink");
	}
}
function paddmore() {
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
	$('#addPayableForm')
			.find(
					'input[type="text"], input[type="number"], input[type="checkbox"], select')
			.prop("disabled", false);
	$('#addPayableForm')
			.find(
					'input[type="text"], input[type="number"], input[type="checkbox"], select')
			.attr("readonly", false);
	document.getElementById('addPayableErrorList').innerText == null;
	$('#addPayableErrorList').hide();
}

function rsaved() {
	$('#addReceivableErrorList').show();
	$('#rdone').show();
	$('#rcancel').hide();
	if (document.getElementById('addReceivableErrorList').innerText == "") {
		$('#addReceivableForm')
				.find(
						'input[type="text"], input[type="number"], input[type="checkbox"], select')
				.prop("disabled", true);
		$('#raddMoreBtn').attr("disabled", false);
		$('#saveReceivableBtn').val('Saved');
		$('#saveReceivableBtn').attr("disabled", "disabled");
		$('#addReceivableErrorList').hide();
	}
}

function raddmore() {
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
	$('#addReceivableForm')
			.find(
					'input[type="text"], input[type="number"], input[type="checkbox"], select')
			.prop("disabled", false);
	$('#addReceivableForm')
			.find(
					'input[type="text"], input[type="number"], input[type="checkbox"], select')
			.attr("readonly", false);
	document.getElementById('addReceivableErrorList').innerText == null;
	$('#addReceivableErrorList').hide();
}

Date.prototype.toDateInputValue = (function() {
	var local = new Date(this);
	local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
	return local.toJSON().slice(0, 10);
});

$('#settingsLink').click(function() {
	$('#userSettings').modal('show');
	$('.displaySec').hide();
	$('.displayFirst').show();
	$('#changepass').hide();
	$('#saveBtn').hide();
	$('#newPass').hide();
	$('.oldPass').show();
});

function csaved() {
	document.getElementById('Validations').setAttribute("hidden", "hidden");
	var status = document.getElementById('Validations').innerText;
	if (status == "") {
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
	} else {
		document.getElementById('Validations').removeAttribute("hidden");
	}
}

function ssaved() {
	document.getElementById('svalidations').setAttribute("hidden", "hidden");
	var status = document.getElementById('svalidations').innerText;
	if (status == "") {
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
	} else {
		document.getElementById('svalidations').removeAttribute("hidden");
	}
}

function addedEmployee() {
	var status = document.getElementById('usernameTakene').innerText;
	if (status == "User has been saved.") {
		$("#eaddMoreB").removeAttr("disabled");
		document.getElementById('esaveB').value = 'Saved';
		document.getElementById('esaveB').setAttribute("disabled", "disabled");
		document.getElementById('usernameTakene').setAttribute("hidden",
				"hidden");
		$('#addEmployeeForm')
				.find(
						'input[type="text"],input[type="password"], input[type="number"], input[type="checkbox"], select')
				.prop("disabled", true);
		$("#eDoneBtn").show();
		$("#eCancelBtn").hide();
	} else {
		document.getElementById('usernameTakene').removeAttribute("hidden");
		document.getElementById('usernameTakene').setAttribute("class", "");
		document.getElementById('usernameTakene').setAttribute("class",
				"ui negative small message");
	}
}

function changeUserStatus() {
	var status = document.getElementById('deactivated').innerText;
	if (status = "deactivated") {
		var empID = document.getElementById('empID').value;
		var adminID = document.getElementById('adminID').value;
		if(empID){
			$('#editemployee').modal('hide');
			window.location.replace("users");
		}
		if(adminID){
			$('#editadministrator').modal('hide');
			window.location.replace("users?tab=administratorsTab");			
		}
	}
}
function editedEmployee() {
	document.getElementById('eusernameTaken').setAttribute("hidden", "hidden");
	document.getElementById('eusernameTaken').setAttribute("class", "");
	var status = document.getElementById('eusernameTaken').innerText;
	if (status == "User information has been saved.") {
		$('#editemployee').modal('hide');
		window.location.replace("users");
	} else {
		document.getElementById('eusernameTaken').setAttribute("class",
				"ui negative small message");
		document.getElementById('eusernameTaken').removeAttribute("hidden");
	}
	
}
function editedAdmin() {
	var status = document.getElementById('ausernameTaken').innerText;
	if (status == "User information has been saved.") {
		$('#editadministrator').modal('hide');
		window.location.replace("users?tab=administratorsTab");
	} else {
		document.getElementById('ausernameTaken').setAttribute("class",
				"ui negative small message");
		document.getElementById('ausernameTaken').removeAttribute("hidden");
	}
}
function editedSupplier() {
	document.getElementById('sTaken').setAttribute("class", "");
	var status = document.getElementById('sTaken').innerText;
	if (status == "Transactor information has been saved.") {
		$('#editSupplierModal').modal('hide');
		window.location.replace("main?tab=suppliersTabLink");
	} else {
		document.getElementById('sTaken').setAttribute("class",
				"ui negative small message");
		document.getElementById('sTaken').removeAttribute("hidden");
	}
}
function editedCustomer() {
	document.getElementById('cTaken').setAttribute("class", "");
	var status = document.getElementById('cTaken').innerText;
	if (status == "Transactor information has been saved.") {
		$('#editCustomerModal').modal('hide');
		window.location.replace("main?tab=customersTabLink");
	} else {
		document.getElementById('cTaken').setAttribute("class",
				"ui negative small message");
		document.getElementById('cTaken').removeAttribute("hidden");
	}
}
function addedMoreEmployee() {

//	var status = document.getElementById('euserSaved').innerText;
	//if (status == "true") {
		document.getElementById('esaveB').value = 'Save';
		$("#esaveB").removeAttr("disabled");
		document.getElementById('eaddMoreB').setAttribute("disabled",
				"disabled");
		document.getElementById('usernameTakene').innerText = null;
		//document.getElementById('euserSaved').innerText = null;
		document.getElementById('usernameTakene').setAttribute("class", "")
		document.getElementById('eresetBtn').click();
		$('#addEmployeeForm')
				.find(
						'input[type="text"], input[type="password"], input[type="number"], input[type="checkbox"], select')
				.prop("disabled", false);
		$('#addEmployeeForm')
				.find(
						'input[type="text"], input[type="password"], input[type="number"], input[type="checkbox"], select')
				.attr("readonly", false);

	//}
}

function addedAdmin() {
	document.getElementById('usernameTakena').setAttribute("class", "");
	var status = document.getElementById('usernameTakena').innerText;
	if (status == "User has been saved.") {
		document.getElementById('usernameTakena').setAttribute("class",
				"ui message");
		$("#aaddMoreB").removeAttr("disabled");
		document.getElementById('asaveB').value = 'Saved';
		document.getElementById('asaveB').setAttribute("disabled", "disabled");
		document.getElementById('usernameTakena').setAttribute("hidden",
				"hidden");
		$("#aDoneBtn").show();
		$("#aCancelBtn").hide();
		$('#addAdminForm')
				.find(
						'input[type="text"],input[type="password"], input[type="number"], input[type="checkbox"], select')
				.prop("disabled", true);

	} else {
		document.getElementById('usernameTakena').setAttribute("class",
				"ui negative small message");
		document.getElementById('usernameTakena').removeAttribute("hidden");
	}
}

function addedMoreAdmin() {
//	var status = document.getElementById('auserSaved').innerText;
	//if (status == "true") {
		$("#asaveB").removeAttr("disabled");
		document.getElementById('aaddMoreB').setAttribute("disabled",
				"disabled");
		document.getElementById('usernameTakena').innerText = null;
		//document.getElementById('auserSaved').innerText = null;
		document.getElementById('usernameTakena').setAttribute("class", "")
		document.getElementById('aresetBtn').click();
		$('#addAdminForm')
		.find(
				'input[type="text"], input[type="password"], input[type="number"], input[type="checkbox"], select')
		.prop("disabled", false);
		$('#addAdminForm')
		.find(
				'input[type="text"], input[type="password"], input[type="number"], input[type="checkbox"], select')
		.attr("readonly", false);

	//}
}

function addmoreClick() {
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

function saddmoreClick() {
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

function caddmoreClick() {
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

$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
	if (settings.nTable != document.getElementById('receivablesTable')) {
		return true;
	}
	var min = Date.parse($('#minR').val(), 10);
	var max = Date.parse($('#maxR').val());
	var date = Date.parse(data[3].toString().split(' ')[0]) || 0;
	if ((isNaN(min) && isNaN(max)) || (isNaN(min) && date <= max)
			|| (min <= date && isNaN(max)) || (min <= date && date <= max)) {
		return true;
	}
	return false;
});

$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
	if (settings.nTable != document.getElementById('payablesTable')) {
		return true;
	}
	var min = Date.parse($('#minP').val(), 10);
	var max = Date.parse($('#maxP').val());
	var date = Date.parse(data[3].toString().split(' ')[0]) || 0;
	if ((isNaN(min) && isNaN(max)) || (isNaN(min) && date <= max)
			|| (min <= date && isNaN(max)) || (min <= date && date <= max)) {
		return true;
	}
	return false;
});

$.fn.dataTable.Api.register('sum()', function() {
	return this.flatten().reduce(function(a, b) {
		if (typeof a === 'string') {
			a = a.replace(/[^\d.-]/g, '') * 1;
		}
		if (typeof b === 'string') {
			b = b.replace(/[^\d.-]/g, '') * 1;
		}

		return a + b;
	}, 0);
});