<div class="ui bottom attached tab segment" data-tab="suppliersTab" style="padding-bottom: 50px">
	<div class="ui form ">
		<div class="inline fields">
			<div class="inline fields">
				<div class="seven wide field">
					<label>Entries per page</label> 
					<select class="ui dropdown" id="suppliersNumEntries">
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="30">30</option>
						<option value="100">100</option>
					</select>
				</div>
				<div class="eight wide field">
					<label>Search</label> 
					<input type="text" id="searchSuppliers">
				</div>
			</div>
			<div class="four wide field" style="margin-top:-15px; margin-left: auto; margin-right: 0;">
				<button class="ui labeled icon button teal" style="margin-left: auto; margin-right: 0;" id="addSupplierBtn">
					<i class="add user basic icon"></i>Add Suppliers
				</button>
			</div>
		</div>
	</div>
	<table id="suppliersTable" class="display ui celled padded table" cellspacing="0" width="100%">
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
			<g:each in="${supplierList}" var="supplier">
				<tr>
					<td>${supplier.name}</td>
					<td>${supplier.address}</td>
					<td>${supplier.telephone_no}</td>
					<td>${supplier.mobile_no}</td>
					<td>
						<script>
							var days = ${supplier.terms};
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
						<button id="editCustomerBtn" class="ui right labeled icon button" onClick="editSupplier('${supplier.name}','${supplier.address}','${supplier.telephone_no}','${supplier.mobile_no}','${supplier.terms}','${supplier.id}')">
							EDIT <i class="edit teal icon"></i>
						</button>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>
