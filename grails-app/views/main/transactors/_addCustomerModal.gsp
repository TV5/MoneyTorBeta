<div id="addCustomer" class="ui modal">

  <div class="header">Customer</div>
  <div class="content">
    <g:form class="ui form" controller="transactor" action="addTransactor" id="myForm">	
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="name" value="${name}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		        <g:textField name="address" value="${address}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Telephone Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="telephone_no" value="${telephone_no}" required="true"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Mobile Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="mobile_no" value="${mobile_no}" required="true"/>
		    </div>
		</div>
		
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		       <g:field type="number" name="terms" value="${terms}" required="true"/>
		    </div>
		    
		    
		    <div class="seven wide field">
		      <select class="ui fluid dropdown">
    			<option value="">days</option>
    			<option value="">weeks</option>
    			<option value="">months</option>
    			<option value="">years</option>
    		  </select>
		    </div>
		</div>    	
		<g:hiddenField name="type" value="C" />
    	<div class="actions">
    		
    		<g:submitToRemote url="[action: 'addTransactor']"  update="saveBtn" class="ui teal button" value="${saveName}" id="saveBtn" onComplete="saved()" />
			
			<g:field id="addmore" class="ui button" type="reset" name="myReset" value="Add More"/>
			<div class="ui button"  onclick="myFunction()" >Cancel</div>
			<div class="ui cancel button"  " >Cancel</div>
		</div>
   </g:form>
  </div>
 
</div>