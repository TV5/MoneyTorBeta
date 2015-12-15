<div id="addemployee" class="ui modal">
	<div class="header">Employee</div>
		
		<div class="content">
			<g:form name="addEmployeeForm" class="ui form" id="addEmployeeForm">
    			<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="ef_name" required="true"/>
						</div>
				</div>

				<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField id="el_name" name="el_name" required="true"/>
						</div>
				</div>

				<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField id="eusername" name="eusername" required="true"/>
						</div>

				</div>
				
				<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField id="epassword" name="epassword" required="true"/>
						</div>
				</div>
				<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField id="ecpassword"  name="ecpassword" required="true"/>
						</div>
				</div>
			
				<g:hiddenField name="etype" value="E" />
				<!--<div id="euserSaved" hidden/></div>-->
				<div id="usernameTakene" hidden></div>	
			<div class="actions">				
    			<g:submitToRemote url="[controller: 'User' ,action: 'addEmployee']"  id="esaveB" class="ui teal button" value="Save" update="usernameTakene" onSuccess="addedEmployee()"/>
    			<g:submitToRemote style="display:none;" url="" id="eaddMoreB" class="ui button" value="Add More" update="euserSaved" onSuccess="addedMoreEmployee()"/>
    			<input type='reset' id="eresetBtn" value='Reset' hidden />
    			
    			<div class="ui cancel button" id="eCancelBtn" >Cancel</div>
				<div class="ui button" id="eDoneBtn" style="display: none;" onclick="location.href = '/Moneytor/user/users';" >Done</div>
	 		
    			
			</div>
			</g:form>
		</div>
</div>

