<div id="editadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">

				<g:form class="ui form" controller="user">
				<div class="ui error message"></div>		
					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="adminF_name"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="adminL_name" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="adminUsername" />
						</div>
						<div class="three wide field">
		    			<g:submitToRemote url="[controller: 'User' ,action: 'checkUsername']"  class="ui button" value="Check Username" update="ausernameTaken"/>
		    			</div>
						<div id="ausernameTaken"></div>	
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="adminPassword" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="adminCpassword" />
						</div>
					</div>
					<g:hiddenField name="adminId" />
					<g:hiddenField name="adminStatus" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
					<g:hiddenField name="userType" value="${user.type}" />
				
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve button" value="Save" action="editAdmin"/>		
				<g:actionSubmit class="ui button" value="Deactivate" action="changeStatus"/>				
			</g:form>
				<div class="ui cancel button">Cancel</div>
			</div>

		</div>