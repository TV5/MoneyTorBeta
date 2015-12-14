<div class="ui bottom attached tab segment" data-tab="customersTab" style="padding-bottom:50px">
	<div class="ui form ">
		<div class="inline fields">
			<div class="inline fields thirteen wide" style="float: left">
				<div class="three wide field">
					<label>Entries per page</label> <select class="ui dropdown" id="customersNumEntries">
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="30">30</option>
						<option value="100">100</option>
					</select>
				</div>
				<div class="three wide field">
					<label>Start Date</label> <input type="text" id="minR">
				</div>
				<div class="three wide field">
					<label>End Date</label> <input type="text" id="maxR">
				</div>
				<div class="four wide field">
					<label>Search</label> <input type="text" id="searchCustomers">
				</div>
					<div class="three wide feild" style="float:right">
								<button class="ui labeled icon button teal" id="addCustomerBtn">
									<i class="add user basic icon"></i>Add Customers
								</button>
					</div>
			</div>
		</div>
	</div>
	<table id="customersTable" class="display ui celled padded table"  cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Name</th>
			    <th>Address</th>
			    <th>Telephone No</th>
			    <th>Mobile No</th>
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
					<td><a href="#" onClick="editCustomer('${customer.name}','${customer.address}','${customer.telephone_no}','${customer.mobile_no}','${customer.terms}','${customer.id}')" ><i class="edit icon editCustomerBtn"></i></a></td>
				</tr>	
        	</g:each>
		</tbody>
	</table>
</div>
