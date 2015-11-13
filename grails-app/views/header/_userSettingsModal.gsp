<div id="userSettings" class="ui modal">
  <div class="header">User Settings</div>
  <div class="content">
    <form class="ui form">
    
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Username</label>      
		    </div>
		    <div class="eight wide field">
		      <label class="displayFirst">${user.username}</label>
		      <input class="displaySec" type="text" value="${user.username}" disabled/>
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>First Name</label>      
		    </div>
		    <div class="eight wide field">
		    	<label class="displayFirst">${user.f_name}</label>
		      <input class="displaySec" type="text" value="${user.f_name}"/>
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Last Name</label>      
		    </div>
		    <div class="eight wide field">
		    	<label class="displayFirst">${user.l_name}</label>
		      <input class="displaySec" type="text" value="${user.l_name}"/>
		    </div>
		</div>
		<div class="inline fields oldPass">
		    <div class="two wide field">
		      <label>Password</label>      
		    </div>
		    <div class="eight wide field">
		      <label>********</label> 
		      <a class="displaySec" href="#" onclick="changePassword()">change password</a>
		    </div>
		</div>
		<div id="newPass">
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Current Password</label>      
			    </div>
			    <div class="eight wide field">
			      <input type="text"/>
			    </div>
			</div>
			<div class="inline fields">
			    <div class="two wide field">
			      <label>New Password</label>      
			    </div>
			    <div class="eight wide field">
			      <input type="text"/>
			    </div>
			</div>
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Confirm New Password</label>      
			    </div>
			    <div class="eight wide field">
			      <input type="text"/>
			    </div>
			</div>
		</div>
    </form>
  </div>
		<div class="actions">
			<div id="editBtn" class="ui button teal" onclick="edit()">Edit</div>
			<div id="saveBtn" class="ui button teal" onclick="save()">Save</div>
		    <div class="ui cancel button teal" onclick="cancelEdit()">Cancel</div>
		</div>
</div>