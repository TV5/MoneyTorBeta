<div id="editemployee" class="ui modal">
			<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal edit icon"
			style="margin-right: 10px;"></i>Employee</div>
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
						<div class="ui divider"></div>
					<g:hiddenField name="empId" />
					<g:hiddenField name="empStatus" />
				<div id="eusernameTaken" ></div>	
				<div id="deactivated" hidden></div>
				
			<div class="actions" style="float:right; margin-bottom:14px;">
    			<g:submitToRemote url="[controller: 'User' ,action: 'editEmployee']" class="ui teal button" value="Save" update="eusernameTaken" onSuccess="editedEmployee()"/>
    			<g:submitToRemote url="[controller: 'User' ,action: 'changeStatus']" id="edeactivate" update="deactivated" class="ui button" update="deactivated" value="Deactivate" onSuccess="changeUserStatus()"/>
				<div class="ui right labeled icon cancel button" id="ecancelB"><i class="cancel basic icon"></i>Cancel</div>
			</div>
				
			</div>
			</g:form>
		</div>