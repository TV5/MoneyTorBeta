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
		      <select id="cselect" class="ui fluid dropdown">
    			<option value="">days</option>
    			<option value="">weeks</option>
    			<option value="">months</option>
    			<option value="">years</option>
    		  </select>
		    </div>
		</div>    	
		<g:hiddenField name="ctype" value="C" />
		<g:hiddenField name="cstatus" value="A" />
		<input type='reset' id="cresetBtn" value='Reset' hidden />
		<g:actionSubmit style="display: none;" id="ad" value=" " action=" "/>
		<input id="af" type="submit"/>
		<input id="aff" type="button"/>
		
    	<div class="actions">
    		
    		<g:submitToRemote url="[controller: 'Transactor' ,action: 'addCustomer']"  update="csaveBtn" class="ui teal button" value="Save" id="csaveBtn" onComplete="csaved()" />
			<g:submitToRemote  url="" update="csaveBtn" class="ui button" value="Add More" id="caddMoreBtn" onComplete="caddmoreClick()" />
			<!--<g:field id="addmore" class="ui button" type="reset" name="myReset"  update="saveBtn" value="Add More" url="" onComplete="addmoreClick()"/> -->
			<input type='reset' id="cresetBtn" value='Reset' hidden />
			<div class="ui cancel button"  " >Cancel</div>
		</div>
   </g:form>
  </div>
 
</div>