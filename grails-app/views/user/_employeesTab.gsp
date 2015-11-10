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
			<table id="employeesTable" class="ui celled padded table">
				<thead>
					<tr>
						<th>Username <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>First Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th>Last Name <i class="dropdown icon link"
							style="float: right"></i></th>
						<th></th>
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
		  
			<div class="ui pagination menu right" style="float:right">
			  <a class="active item">
			    1
			  </a>
			  <div class="disabled item">
			    ...
			  </div>
			  <a class="item">
			    10
			  </a>
			  <a class="item">
			    11
			  </a>
			  <a class="item">
			    12
			  </a>
			</div>
		</div>