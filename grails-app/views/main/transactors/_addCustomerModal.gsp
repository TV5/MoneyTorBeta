<div id="addCustomer" class="ui modal">

  <div class="header">Customer</div>
  <div class="content">
    <g:form class="ui form" controller="transactor" action="addTransactor" id="myForm">	
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="name" name="name" value="${name}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		        <g:textField id="address" name="address" value="${address}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Telephone Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="telephone_no" name="telephone_no" value="${telephone_no}" required="true"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Mobile Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="mobile_no" name="mobile_no" value="${mobile_no}" required="true"/>
		    </div>
		</div>
		
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		       <g:field id="terms" type="number" name="terms" value="${terms}" required="true"/>
		    </div>
		    
		    
		    <div class="seven wide field">
		      <select id="select" class="ui fluid dropdown">
    			<option value="">days</option>
    			<option value="">weeks</option>
    			<option value="">months</option>
    			<option value="">years</option>
    		  </select>
		    </div>
		</div>    	
		<g:hiddenField name="type" value="C" />
    	<div class="actions">
    		
    		<g:submitToRemote url="[action: 'addTransactor']"  update="saveBtn" class="ui teal button" value="Save" id="saveBtn" onComplete="saved()" />
			<g:submitToRemote  url="" update="saveBtn" class="ui button" value="Add More" id="addMoreBtn" onComplete="addmoreClick()" />
			<!--<g:field id="addmore" class="ui button" type="reset" name="myReset"  update="saveBtn" value="Add More" url="" onComplete="addmoreClick()"/> -->
			<input type='reset' id="resetBtn" value='Reset' hidden />
			<div class="ui cancel button"  " >Cancel</div>
		</div>
   </g:form>
  </div>
 
</div>