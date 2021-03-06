<div class="ui bottom attached tab segment active"
	data-tab="employeesTab" style="padding-bottom: 50px">
	<div class="ui form">
		<div class="inline fields">
			<div class="inline fields">
				<div class="seven wide field">
					<label>Entries per page</label> <select class="ui dropdown"
						id="employeesNumEntries">
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="30">30</option>
						<option value="100">100</option>
					</select>
				</div>
				<div class="eight wide field">
					<label>Search</label> <input type="text" id="searchEmployees">
				</div>
			</div>
			<div class="four wide field"
				style="margin-top: -15px; margin-left: auto; margin-right: 0;">
				<button class="ui labeled icon button teal"
					style="margin-left: auto; margin-right: 0;" id="addemployeeBtn">
					<i class="add user basic icon"></i>Add Employees
				</button>
			</div>
		</div>
	</div>


	<table id="employeesTable" class="display ui celled padded table"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>Username</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Updated By</th>
				<th>Updated On</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<g:each var="emp" in="${empList}">
				<tr>
					<td>
						${emp.username }
					</td>
					<td>
						${emp.f_name}
					</td>
					<td>
						${emp.l_name }
					</td>
					<td><g:findAll in="${allAdminList}"
							expr="it.id == emp.updated_by">
							${it.username}
						</g:findAll></td>
					<td><g:formatDate format="MM/dd/yyyy"
							date="${emp.updated_on }" /></td>
					<td>
						<button class="ui labeled icon button"
							onclick="editEmployee(${emp.id}, '${emp.username}', '${emp.f_name }', '${emp.l_name}', '${emp.password}', ${emp.status})"
							id="editemployeeBtn">
							EDIT <i class="edit basic icon"></i>
						</button>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>

</div>