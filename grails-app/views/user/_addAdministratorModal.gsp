<div id="addadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">
				<g:form class="ui form" controller="user" action="addAdmin">
				<div class="ui error message"></div>		
					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="af_name" value="${af_name}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="al_name" value="${al_name}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ausername" value="${ausername}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="apassword" value="${apassword}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="acpassword" value="${acpassword}" required="true"/>
						</div>
					</div>
					<g:hiddenField name="atype" value="A" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
					<g:hiddenField name="userType" value="${user.type}" />				
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="Save" action="addAdmin"/>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>