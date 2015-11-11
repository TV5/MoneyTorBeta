<div class="ui bottom attached tab segment" data-tab="administratorsTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    <div class="eleven wide field">
		      <label>Entries per page</label>
		      <input type="number" value="10">
		    </div>
		  	
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal"  id="addadministratorBtn">Add administrators</button>
		    </div>
		  </div>
			<table id="administratorsTable" class="ui celled padded table display" cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Updated By</th>
						<th>Updated On</th>						
						<th>Edit</th>
					</tr>
				</thead>
				<tbody>
				<g:each var="admin" in="${adminList}">
					<tr>
						<th>${admin.username }</th>
						<th>${admin.f_name}</th>
						<th>${admin.l_name }</th>
						<th>${admin.updated_by}</th>
						<th>${admin.updated_on }</th>						
						<th><button class="ui button teal" onclick="editEmployee(${admin.id}, '${admin.username}', '${admin.f_name }', '${admin.l_name}', '${admin.password}', ${admin.status})" id="editemployeeBtn">edit</button></th>
					</tr>
					</g:each>				
				</tbody>
			</table>
		</div>
	</div>