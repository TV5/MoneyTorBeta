<div id="addadministrator" class="ui modal">
			<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal edit icon"
			style="margin-right: 10px;"></i>New Administrator</div>
			
			<div class="content">
				<g:form name="addAdminForm" class="ui form" controller="user" action="addAdmin">
				<div class="ui error message"></div>		
					<div class="inline fields">
						<div class="two wide field">
							<label>First Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="af_name" value="${af_name}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Last Name</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="al_name" value="${al_name}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Username</label>
						</div>
						<div class="fourteen wide field">
				            <g:textField name="ausername" value="${ausername}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField name="apassword" value="${apassword}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Confirm Password</label>
						</div>
						<div class="fourteen wide field">
				            <g:passwordField name="acpassword" value="${acpassword}" required="true"/>
						</div>
					</div>
					<div class="ui divider"></div>
					<g:hiddenField name="atype" value="A" />
<!--  					<div id="auserSaved" hidden/>true</div>-->
					<div id="usernameTakena" hidden></div>	
			<div class="actions" style="float:right; margin-bottom:14px;">
    			<g:submitToRemote url="[controller: 'User' ,action: 'addAdmin']"  id="asaveB" class="ui teal button" value="Save" update="usernameTakena" onSuccess="addedAdmin()"/>
    			<g:submitToRemote url="" id="aaddMoreB" class="ui button" value="Add More" update="auserSaved" onComplete="addedMoreAdmin()"/>
    			<input type='reset' id="aresetBtn" value='Reset' hidden />
				<div class="ui right labeled icon cancel button" id="aCancelBtn" ><i class="cancel basic icon"></i>Cancel</div>
				<div class="ui right labeled icon button" id="aDoneBtn" style="display: none;" onclick="location.href = '/Moneytor/user/users?tab=administratorsTab';" ><i class="checkmark icon"></i>Done</div>
	 		
				
			</div>
			</g:form>
			</div>
		</div>