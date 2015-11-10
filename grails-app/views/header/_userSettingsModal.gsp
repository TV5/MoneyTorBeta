<div id="userSettings" class="ui modal">
  <div class="header">User Settings</div>
  <div class="content">
    <form class="ui form">
    
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
		    	<label id="fname">Joseph Gabriell</label>
		      <input id="fnametxt" type="text" value="Joseph Gabriell"/>
		    </div>
		</div>
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Last Name</label>      
		    </div>
		    <div class="eight wide field">
		    	<label id="lname">Palmaras</label>
		      <input id="lnametxt" type="text" value="Palmaras"/>
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
			<div id="saveBtn" class="ui button teal" onclick="edit()">Save</div>
		    <div class="ui cancel button teal" onclick="cancelEdit()">Cancel</div>
		</div>
</div>