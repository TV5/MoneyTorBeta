	<div class="ui text menu firstmenu" width="100%">
	  <img src="${resource(dir: 'images', file: 'logo.png')}" style="width:30px;height:30px;margin-top:5px">
	  <div class="header item">	   <a class="item" href="${createLink(controller: 'main', action: 'main')}">
		MONEYTOR	
	   </a>
	   </div>
	  
	  
	  <div class="right menu">
	   <a class="item link">
	     <b>${user.username}</b>
	   </a>
	   <g:if test="${user.type=='A'}">
	   <a class="item" href="${createLink(controller: 'user', action: 'users')}">
			Users
	   </a>
	   </g:if>
	   <a id="settingsLink" class="item">
	     Settings
	   </a>
	   <a id="logoutLink" class="ui item">
	      Log out
	    </a>
	  </div>
	  
	</div>