<div id="userSettings" class="ui modal">
  <div class="header">User Settings</div>
  <div class="content">
    <g:form class="ui form" controller="user">
    <div class="ui error message"></div>		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Username</label>      
		    </div>
		    <div class="eight wide field">
		      <label class="displayFirst" id="username">${user.username}</label>
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
		      <text>********</text> 
		      <a class="displaySec" href="#" onclick="changePassword('${user.password}')">change password</a>
		    </div>
		</div>
		<div id="newPass">
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Current Password</label>      
			    </div>
			    <div class="eight wide field">
			      <g:textField name="uCurrPass"/>
			    </div>
			</div>
			<div class="inline fields">
			    <div class="two wide field">
			      <label>New Password</label>      
			    </div>
			    <div class="eight wide field">
			      <g:textField name="uNewPass"/>
			    </div>
			</div>
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Confirm New Password</label>      
			    </div>
			    <div class="eight wide field">
			      <g:textField name="uCNewPass"/>
			    </div>
			</div>
			<g:hiddenField name="uId" />
			<g:hiddenField name="uCurrentPass" />
		</div>
    
  </div>
		<div class="actions">
			<div id="editBtn" class="ui button teal displayFirst" onclick="edit()">Edit</div>
			<g:actionSubmit class="ui approve button teal displaySec" onClick="save()" value="Save" action="editUserAccount"/>
</g:form>
		    <div class="ui cancel button teal" onclick="cancelEdit()">Cancel</div>
		</div>
</div>