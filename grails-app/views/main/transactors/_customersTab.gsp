<div class="ui bottom attached tab segment" data-tab="customersTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addCustomerBtn">Add Customers</button>
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
	  	        <g:each in="${transactorList}" var="transactor">
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
	</div>