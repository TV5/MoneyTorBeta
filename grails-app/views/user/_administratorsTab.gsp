<div class="ui bottom attached tab segment" data-tab="administratorsTab" style="padding-bottom: 50px">
	<div class="ui form ">
		<div class="inline fields" style="float: left"></div>
		<div class="three wide feild" style="float: right">
			<button class="ui labeled icon button teal" id="addadministratorBtn">
				<i class="add user basic icon"></i>Add Administrators
			</button>
		</div>
	</div>
	</br></br></br>
	<table id="administratorsTable" class="ui celled padded table display" cellspacing="0" width="100%">
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
			<g:each var="admin" in="${adminList}">
				<tr>
					<td>
						${admin.username }
					</td>
					<td>
						${admin.f_name}
					</td>
					<td>
						${admin.l_name }
					</td>
					<td>
						<g:findAll in="${allAdminList}" expr="it.id == admin.updated_by">
							${it.username}
						</g:findAll>
					</td>
					<td>
						<g:formatDate format="MM/dd/yyyy" date="${admin.updated_on }" />
					</td>
					<td>
						<button class="ui labeled icon button" onclick="editAdmin(${admin.id}, '${admin.username}', '${admin.f_name }', '${admin.l_name}', '${admin.password}', ${admin.status})" id="editemployeeBtn">
							EDIT <i class="edit basic icon"></i>
						</button>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
</div>