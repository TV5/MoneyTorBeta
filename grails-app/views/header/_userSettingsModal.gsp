<div id="userSettings" class="ui modal">
	<div class="header">User Settings</div>
	<div class="content" id="">
		<g:form class="ui form" id="userSet" controller="user">		
		    <div class="inline fields">
				<div class="two wide field">
					<label>Username</label>      
				</div>
				<div class="eight wide field">
				    <label class="displayFirst">${user.username}</label>
				    <input class="displaySec" id="usernametxt" type="text" value="${user.username}" disabled/>
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
					<label>First Name</label>      
				</div>
				<div class="eight wide field">
				   	<label class="displayFirst">${user.f_name}</label>
				    <g:textField class="displaySec" type="text" value="${user.f_name}" name="uF_name"/>
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
				    <label>Last Name</label>      
				</div>
				<div class="eight wide field">
				   	<label class="displayFirst">${user.l_name}</label>
				    <g:textField class="displaySec" type="text" value="${user.l_name}" name="uL_name"/>
				</div>
			</div>
			<div class="inline fields oldPass">
				<div class="two wide field">
				   	<label>Password</label>      
				</div>
				<div class="eight wide field">
				   	<text class="displayFirst">********</text>
				    <input class="displaySec" type="password" value="${user.password}" disabled/>
				    <a class="displaySec" href="#" onclick="changePassword('${user.password}')" style="left-padding:10px;">change password</a>
				</div>
			</div>
			<div id="newPass">
				<div class="inline fields">
					<div class="two wide field">
						<label>Current Password</label>      
					</div>
					<div class="eight wide field">
					    <g:passwordField name="uCurrPass"/>
					</div>
				</div>
				<div class="inline fields">
					<div class="two wide field">
						<label>New Password</label>      
					</div>
					<div class="eight wide field">
						<g:passwordField name="uNewPass"/>
					</div>
				</div>
				<div class="inline fields">
					<div class="two wide field">
						<label>Confirm New Password</label>      
					</div>
					<div class="eight wide field">
						<g:passwordField name="uCNewPass"/>
					</div>
				</div>
			</div>
			<div class="ui error message"></div>
		    <g:hiddenField name="uId" />
			<g:hiddenField name="uCurrentPass" />
			<div class="actions">
				<div id="editBtn" class="ui button teal displayFirst" onclick="edit()">Edit</div>
				<g:actionSubmit class="ui button teal displaySec" value="Save" action="editUserAccount"/>
				<div class="ui cancel button teal" onclick="cancelEdit()">Cancel</div>
			</div>
		</g:form>
	</div>
</div>