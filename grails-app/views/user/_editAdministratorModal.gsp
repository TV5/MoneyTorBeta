<div id="editadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">

				<g:form class="ui form" controller="user">
				<div class="ui error message"></div>		
					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="adminF_name"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="adminL_name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="adminUsername" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField name="adminPassword" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField name="adminCpassword" />
						</div>
					</div>
					<g:hiddenField name="adminId" />
					<g:hiddenField name="adminStatus" />
					<div id="ausernameTaken"></div>	
					<div id="deactivated" hidden></div>
			<div class="actions">
    			<g:submitToRemote url="[controller: 'User' ,action: 'editAdmin']" class="ui teal button" value="Save" update="ausernameTaken" onSuccess="editedAdmin()"/>
    			<g:submitToRemote url="[controller: 'User' ,action: 'changeStatus']" id="adeactivate" class="ui button" value="Deactivate" onSuccess="changeUserStatus()"/>		
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
			</div>

		</div>