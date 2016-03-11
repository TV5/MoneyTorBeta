<div id="userSettings" class="ui small modal">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal wrench icon"
			style="margin-right: 10px;"></i>User Settings</div>
	<div class="content" id="">
		<g:form class="ui form" id="userSet" controller="user">		
		    <div class="inline fields">
				<div class="two wide field u">
					<label style="color:#808080;">Username</label>					    
				</div>
				<div class="thirteen wide field">
				    <label class="displayFirst">${user.username}</label>
				    <input class="displaySec" id="usernametxt" type="text" value="${user.username}" disabled/>
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
					<label style="color:#808080;">First Name</label>      
				</div>
				<div class="thirteen wide field">
				   	<label class="displayFirst">${user.f_name}</label>
				    <g:textField class="displaySec" type="text" value="${user.f_name}" name="uF_name"/>
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
				    <label style="color:#808080;">Last Name</label>      
				</div>
				<div class="thirteen wide field">
				   	<label class="displayFirst">${user.l_name}</label>
				    <g:textField class="displaySec" type="text" value="${user.l_name}" name="uL_name"/>
				</div>
			</div>
			<div class="inline fields oldPass">
				<div class="two wide field">
				   	<label style="color:#808080;">Password</label>      
				</div>
				<div class="thirteen wide field">
				   	<text class="displayFirst">********</text>
				    <input class="displaySec" type="password" value="${user.password}" disabled/>
				    <g:hiddenField name="cpassClicked" id="cpassClicked"  value="no"/>
				    <a class="displaySec" href="#" onclick="changePassword('${user.password}')" style="margin-left:10px !important;">change password</a>
				</div>
			</div>
			<div id="newPass">
				<div class="inline fields">
					<div class="two wide field">
						<label style="color:#808080;">Current Password</label>      
					</div>
					<div class="thirteen wide field">
					    <g:passwordField name="uCurrPass"/>
					</div>
				</div>
				<div class="inline fields">
					<div class="two wide field">
						<label style="color:#808080;">New Password</label>      
					</div>
					<div class="thirteen wide field">
						<g:passwordField name="uNewPass"/>
					</div>
				</div>
				<div class="inline fields">
					<div class="two wide field">
						<label style="color:#808080;">Confirm New Password</label>      
					</div>
					<div class="thirteen wide field">
						<g:passwordField name="uCNewPass"/>
					</div>
				</div>
			</div>
			<div class="ui error message"></div>
			<div class="ui divider"></div>
		    <g:hiddenField name="uId" />
			<g:hiddenField name="uCurrentPass" />
			<div id="userEdit" hidden></div>	
			<div class="actions" style="float:right; margin-bottom:14px;">
				<div id="editBtn" class="ui right labeled icon button teal displayFirst" onclick="edit()">
					<i class="edit basic icon"></i>Edit
				</div>
				<g:submitToRemote url="[controller: 'User' ,action: 'editUserAccount']"  id="usaveB" class="ui teal button" value="Save" update="userEdit" onSuccess="editedUser()"/>
				<!--<g:actionSubmit class="ui button teal displaySec" value="Save" action="editUserAccount"/>-->
				<div class="ui right labeled icon cancel button" onclick="cancelEdit()">					
					<i class="cancel basic icon"></i>Cancel
				</div>
			</div>
		</g:form>
	</div>
</div>