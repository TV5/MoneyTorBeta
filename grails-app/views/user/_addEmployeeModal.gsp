<div id="addemployee" class="ui modal">
			<div class="header">Employee</div>
			<div class="content">
				<g:form class="ui form" controller="user" action="addEmployee">
				<div class="ui error message"></div>		
					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ef_name" id="ef_name" required="true"/>
						</div>
						<div class="two wide field" id="usernameTaken"></div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="el_name" id="ef_name" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="eusername" id="eusername" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="epassword" id="epassword" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="ecpassword" id="ecpassword" required="true"/>
						</div>
					</div>
					<g:hiddenField name="etype" id="etype" value="E" />
					<g:hiddenField name="userUsername" id="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" id="userId" value="${user.id}" />
			</div>
			<div class="actions">
				<g:submitToRemote url="[action: 'addEmployee']"  class="ui teal large button" value="Save" id="saveBtn" onSuccess="addedEmployee()" />
				<!--<g:submitToRemote  url="" update="saveBtn" class="ui button" value="Add More" id="addMoreBtn" onComplete="addmoreClick()" />-->			
				<g:actionSubmit class="ui approve large teal submit button" value="Save" action="addEmployee"/>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>