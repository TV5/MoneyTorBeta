<div class="ui bottom attached tab segment" data-tab="suppliersTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addSupplierBtn">Add Suppliers</button>
		    </div>
		  </div>
			<table id="suppliersTable" class="display ui celled padded table"  cellspacing="0" width="100%">
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
					<td><a href="#"><i class="edit icon editCustomerBtn"></i></a></td>
				</tr>	
        		</g:each>
			  </tbody>
			  </table>
		</div>
		