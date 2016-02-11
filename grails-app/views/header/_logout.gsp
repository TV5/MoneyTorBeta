<div id="logout" class="ui small test modal transition"
	style="margin-top: -92.5px;">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal sign out icon"
			style="margin-right: 10px;"></i>Log Out</div>
	<div class="content">
		<h3>Hello, ${user.f_name}!</h3>
		<p style="margin-top:-10px">Are you sure you want to log out of your account?</p>
	</div>
	<div class="actions">
		<div class="ui negative button">No</div>
		<a href="${createLink(controller: 'main', action: 'logout')}">
			<div class="ui positive right labeled icon button">
				Yes <i class="checkmark icon"></i>
			</div>
		</a>
	</div>
</div>