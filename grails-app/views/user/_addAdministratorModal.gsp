<div id="addadministrator" class="ui modal">
			<div class="header">Administrator</div>
			<div class="content">
				<g:form class="ui form" controller="user" action="addAdmin">

					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="af_name" value="${af_name}" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="al_name" value="${al_name}" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="ausername" value="${ausername}" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="apassword" value="${apassword}" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="seven wide field">
				            <g:passwordField name="acpassword" value="${acpassword}" />
						</div>
					</div>
					<g:hiddenField name="atype" value="A" />
					<g:hiddenField name="userUsername" value="${user.username}" />
					<g:hiddenField name="userId" value="${user.id}" />				
					<g:hiddenField name="userType" value="${user.type}" />				
			</div>
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="save" action="addAdmin"/>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
		</div>