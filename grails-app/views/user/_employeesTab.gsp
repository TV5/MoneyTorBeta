<div class="ui bottom attached tab segment active" data-tab="employeesTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addemployeeBtn">Add employees</button>
		    </div>
		  </div>
			<table id="employeesTable" class="ui celled padded table display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
				<g:each var="emp" in="${empList}">
					<tr>
						<th>${emp.username }</th>
						<th>${emp.f_name}</th>
						<th>${emp.l_name }</th>
						<th><button class="ui button teal" id="editemployeeBtn">edit</button></th>
					</tr>
					</g:each>
				</tbody>
			</table>	
		</div>