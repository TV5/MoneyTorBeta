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
				            <g:textField name="ef_name" value="${ef_name}" required="true"/>
						</div>
						<div class="two wide field" id="usernameTaken"></div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="el_name" value="${el_name}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="eusername" value="${eusername}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="epassword" value="${epassword}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="ecpassword" value="${ecpassword}" required="true"/>
						</div>
					</div>
					<g:hiddenField name="etype" value="E" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
					<g:hiddenField name="userType" value="${user.type}" />
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="Save" action="addEmployee"/>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>