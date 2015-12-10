<div id="addCustomer" class="ui modal">

  <div class="header">Add Customer</div>
  <div class="content">
    <g:form class="ui form" id="addCustomerForm">	
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="cname" name="cname" value="${cname}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		        <g:textField id="caddress" name="caddress" value="${caddress}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Telephone Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="ctelephone_no" name="ctelephone_no" value="${ctelephone_no}" required="true"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Mobile Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="cmobile_no" name="cmobile_no" value="${cmobile_no}" required="true"/>
		    </div>
		</div>
		
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		       <g:field id="cterms" type="number" name="cterms" value="${cterms}" required="true"/>
		    </div>
		    <div class="seven wide field">
		    <g:select id="cselect" name="cselect" value="${cselect}"
          from="${['d': 'days', 'w': 'weeks', 'm': 'months', 'y':'years']}"
          optionKey="key" optionValue="value" />
          </div>
        		 
		</div>    	
		<g:hiddenField name="ctype" value="C" />
		<g:hiddenField name="cstatus" value="A" />
		<input type='reset' id="cresetBtn" value='Reset' hidden />
		
		
    	<div class="actions">
    		<g:submitToRemote url="[controller: 'Transactor' ,action: 'addCustomer']"  
    		class="ui teal button"
    		id="csaveBtn"  
    		update="caddMoreBtn"
    		value="Save" 
    		onComplete ="csaved()" />
			
			<g:submitToRemote  url="" 
			update="csaveBtn" 
			class="ui button" 
			value="Add More" 
			id="caddMoreBtn" 
			onComplete="caddmoreClick()"
			/>
			
			<!--<g:field id="addmore" class="ui button" type="reset" name="myReset"  update="saveBtn" value="Add More" url="" onComplete="addmoreClick()"/> -->
			<div class="ui cancel button" id="cCancelBtn" >Cancel</div>
			<div class="ui button" id="cDoneBtn" style="display: none;" onclick="location.href = '/Moneytor/main/main?tab=customersTabLink';" >Done</div>
	 		
		</div>
   </g:form>
  </div>
 
</div>