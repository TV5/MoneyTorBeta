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
			    <th>Contact</th>
			    <th>Terms</th>
			    <th>Date Created</th>
			    <th>Date Updated</th>
			  	</tr>
			  </thead>
			  <tbody>
			  	<g:each in="${supplierList}" var="transactor">
        		<tr>			  	
					<td>${transactor.name}</td>
					<td>${transactor.address}</td>
					<td>${transactor.telephone_no}</td>
					<td>${transactor.mobile_no}</td>
					<td>${transactor.terms}</td>
					<td><a href="#"><i class="edit icon editCustomerBtn"></i></a></td>
				</tr>	
        		</g:each>
			  </tbody>
			  </table>
		</div>
		