<div id="userSettings" class="ui modal">
  <div class="header">User Settings</div>
  <div class="content">
    <g:form class="ui form" controller="user">
    
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Username</label>      
		    </div>
		    <div class="eight wide field">
		      <label id="username">josephpalmaras</label>
		      <input id="usernametxt" type="text" value="josephpalmaras" disabled/>
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>First Name</label>      
		    </div>
		    <div class="eight wide field">
<<<<<<< HEAD
		    	<label class="displayFirst">${user.f_name}</label>
		      <g:textField class="displaySec" type="text" placeholder="${user.f_name}" name="uF_name"/>
=======
		    	<label id="fname">Joseph Gabriell</label>
		      <input id="fnametxt" type="text" value="Joseph Gabriell"/>
>>>>>>> refs/remotes/origin/master
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Last Name</label>      
		    </div>
		    <div class="eight wide field">
<<<<<<< HEAD
		    	<label class="displayFirst">${user.l_name}</label>
		      <g:textField class="displaySec" type="text" placeholder="${user.l_name}" name="uL_name"/>
=======
		    	<label id="lname">Palmaras</label>
		      <input id="lnametxt" type="text" value="Palmaras"/>
>>>>>>> refs/remotes/origin/master
		    </div>
		</div>
		<div id="currPass" class="inline fields">
		    <div class="two wide field">
		      <label>Password</label>      
		    </div>
		    <div class="eight wide field">
		      <text>********</text> <a id="changepass" href="#" onclick="changePassword()">change password</a>
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
			      <g:passwordField id="newPW" name="uNewPass"/>
			    </div>
			</div>
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Confirm New Password</label>      
			    </div>
			    <div class="eight wide field">
			      <input id = "confNewPW" type="text"/>
			    </div>
			</div>
			<g:hiddenField name="uId" />
		</div>
    </g:form>
  </div>
		<div class="actions">
			<div id="editBtn" class="ui button teal" onclick="edit()">Edit</div>
			<g:actionSubmit id="saveBtn" class="ui approve button teal" onclick="save()" value="Save" action="editUserAccount"/>

		    <div class="ui cancel button teal" onclick="cancelEdit()">Cancel</div>
		</div>
</div>