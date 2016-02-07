<div class="ui bottom attached tab segment" data-tab="customersTab" style="padding-bottom:50px">
	<div class="ui form ">
		<div class="inline fields">
			<div class="inline fields">
				<div class="seven wide field">
					<label>Entries per page</label> 
					<select class="ui dropdown" id="customersNumEntries">
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="30">30</option>
						<option value="100">100</option>
					</select>
				</div>
				<div class="eight wide field">
					<label>Search</label> 
					<input type="text" id="searchCustomers">
				</div>				
			</div>
			<div class="four wide field" style="margin-top:-15px; margin-left: auto; margin-right: 0;">
				<button class="ui labeled icon button teal" style="margin-left: auto; margin-right: 0;" id="addCustomerBtn">
					<i class="add user basic icon"></i>Add Customers
				</button>
			</div>
		</div>
	</div>
	<table id="customersTable" class="display ui celled padded table"  cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Name</th>
			    <th>Address</th>
			    <th>Telephone Number</th>
			    <th>Mobile Number</th>
			    <th>Terms</th>
			    <th>Edit</th>
			</tr>
		</thead>
		<tbody>
	  		<g:each in="${customerList}" var="customer">
        		<tr>			  	
					<td>${customer.name}</td>
					<td>${customer.address}</td>
					<td>${customer.telephone_no}</td>
					<td>${customer.mobile_no}</td>
					<td> 
						<script>
							var days = ${customer.terms};
							if(days%7 == 0)	{
								document.write(days/7 + " week(s)");
							}else if(days%30 == 0)	{
								document.write(days/30 + " month(s)");
							}else if(days%365 == 0){
								document.write(days/365 + " year(s)");
							}else{
								document.write(days + " day(s)");
							}
						</script>
					</td>
					<td>
						<button class="ui right labeled icon button" id="editCustomerBtn" onClick="editCustomer('${customer.name}','${customer.address}','${customer.telephone_no}','${customer.mobile_no}','${customer.terms}','${customer.id}')" >
							EDIT <i class="edit teal icon"></i>
						</button>
					</td>
				</tr>	
        	</g:each>
		</tbody>
	</table>
</div>
