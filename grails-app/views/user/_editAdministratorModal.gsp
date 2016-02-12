<div id="editadministrator" class="ui modal">
			<div class="header"  style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal edit icon"
			style="margin-right: 10px;"></i>Administrator</div>
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
					<div class="ui divider"></div>
					<g:hiddenField name="adminId" />
					<g:hiddenField name="adminStatus" />
					<div id="ausernameTaken" hidden></div>	
					<div id="deactivated" hidden></div>
			<div class="actions" style="float:right; margin-bottom:14px;">
    			<g:submitToRemote url="[controller: 'User' ,action: 'editAdmin']" class="ui teal button" value="Save" update="ausernameTaken" onSuccess="editedAdmin()"/>
    			<g:submitToRemote url="[controller: 'User' ,action: 'changeStatus']" id="adeactivate" update="deactivated" class="ui button" value="Deactivate" onSuccess="changeUserStatus()"/>		
				<div class="ui right labeled icon cancel button"><i class="cancel basic icon"></i>Cancel</div>
			</div>
			</g:form>
			</div>

		</div>