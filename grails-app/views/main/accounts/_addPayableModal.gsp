<div id="addPayable" class="ui small modal" >
  <div class="header">Account Payable</div>
  <div class="content">
  <g:renderErrors bean="${account}" />
    <g:form class="ui form" id="addPayableForm" action="" >
    	<div style="overflow-y:scroll;max-height:300px">
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="nine wide field">
			      <select name="transactor_id" class="ui dropdown" id="payabaleSupplierList">
			      	  <option value='0' disabled selected> ---- Select a supplier ---- </option>
				      <g:each in="${supplierList}" var="supplier">
				      	<option value="${supplier.id}">${supplier.name}</option>	
				      </g:each>
			      </select>
		    </div>
		    <div class="five wide field">
		    	<span>Not found in list? <a onCLick="toggleNewSupplier()">Create new record.</a></span>
		    </div>
		</div>
		<div class="payableNewSupplier">
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Name</label>      
			    </div>
			    <div class="fourteen wide field">
			      <input type="text">
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Address</label>      
			    </div>
			    <div class="fourteen wide field">
			      <input type="text">
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Contact Number</label>      
			    </div>
			    <div class="fourteen wide field">
			      <input type="text">
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Terms</label>      
			    </div>
			    <div class="seven wide field">
			      <input type="number">
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
		</div>
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Official Receipt Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="por_no" id="por_no" value="${por_no}"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:field type="number" name="pamount" id="pamount" value="${pamount}"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:datePicker name="pdate" id="pdate" value="${pdate}" precision="day"/>
		    </div>
		</div>
		</div>
		<div class="ui negative small message" id="addPayableErrorDiv" style="display:none;">
		  <div class="header">
		    There were some errors with your submission.
		  </div>	
		  <ul class="list" id="addPayableErrorList">
		  </ul>
		</div>
		  <div class="actions">
		    <g:submitToRemote 
		    	url="[controller: 'Account' ,action: 'addPayable']" 
		    	value="Save" 
		    	class="ui teal button" 
		    	id="savePayableBtn" 
		    	onComplete="psaved()"
		    	/> 
		    <!--<g:submitToRemote update="savePayableBtn" class="ui button" value="Add More" id="paddMoreBtn" onComplete="paddmore()">  </g:submitToRemote>-->
		   
			<button class="ui button" value="Add More" id="paddMoreBtn" onClick="paddmore()">Add More</button>	   
		    <div class="ui button" id="pdone">Done</div>
		    <div class="ui button reset" >Cancel</div>
		  </div>
		</g:form>
	  </div>
    
</div> 