<div class="ui bottom attached tab segment active" data-tab="employeesTab" style="padding-bottom:50px">
			<div class="ui form ">
		  	<div class="inline fields" style="float:left">
		    
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal" id="addemployeeBtn">Add employees</button>
		    </div>
		  </div>
		</br></br></br>
			<table id="employeesTable" class="ui celled padded table display" cellspacing="0" width="100%">
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

				<g:each var="emp" in="${empList}">
					<tr>
						<td>${emp.username }</td>
						<td>${emp.f_name}</td>
						<td>${emp.l_name }</td>
						<td><g:findAll in="${allAdminList}" expr="it.id == emp.updated_by">
			    			${it.username}
							</g:findAll>
						</td>
						<td><g:formatDate format="MM/dd/yyyy" date="${emp.updated_on }"/></td>
						<td><button class="ui button teal" onclick="editEmployee(${emp.id}, '${emp.username}', '${emp.f_name }', '${emp.l_name}', '${emp.password}', ${emp.status})" id="editemployeeBtn">edit</button></td>
					</tr>

					</g:each>
				</tbody>
			</table>	

		</div>