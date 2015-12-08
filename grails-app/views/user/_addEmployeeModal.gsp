<div id="addemployee" class="ui modal">
	<div class="header">Employee</div>
		
		<div class="content">
			<g:form class="ui form" id="addEmployeeForm">
				<div id="usernameTakene"></div>	
    			<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ef_name" required="true"/>
						</div>
				</div>

				<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="el_name" required="true"/>
						</div>
				</div>

				<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="eusername"required="true"/>
						</div>
				</div>
				
				<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="epassword" required="true"/>
						</div>
				</div>
				<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="ecpassword" required="true"/>
						</div>
				</div>
			
				<g:hiddenField name="etype" value="E" />
			
			<div class="actions">				
    			<g:submitToRemote url="[controller: 'User' ,action: 'addEmployee']"  class="ui teal button" value="Save" update="usernameTakene" onSuccess="addedEmployee()"/>
    			<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>
</div>

