<div id="editemployee" class="ui modal">
			<div class="header">Employee</div>
			<div class="content">
				<g:form class="ui form" controller="user">
					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="empF_name"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="empL_name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="empUsername" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField name="empPassword" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField name="empCpassword" />
						</div>
					</div>
						
					<g:hiddenField name="empId" />
					<g:hiddenField name="empStatus" />
				<div id="eusernameTaken" ></div>	
				<div id="deactivated" hidden></div>
			<div class="actions">
    			<g:submitToRemote url="[controller: 'User' ,action: 'editEmployee']" class="ui teal button" value="Save" update="eusernameTaken" onSuccess="editedEmployee()"/>
    			<g:submitToRemote url="[controller: 'User' ,action: 'changeStatus']" id="edeactivate" class="ui button" update="deactivated" value="Deactivate" onSuccess="changeUserStatus()"/>
				<div class="ui cancel button" id="ecancelB">Cancel</div>
			</div>
				
			</div>
			</g:form>
		</div>