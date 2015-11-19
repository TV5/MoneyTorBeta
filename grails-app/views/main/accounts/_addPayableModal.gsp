<div id="addPayable" class="ui modal">
  <div class="header">Account Payable</div>
  <div class="content">
    <g:form class="ui form" controller="account" action="addPayable">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <select name="transactor_id" class="ui dropdown" id="payablesNumEntries">
			      <g:each in="${supplierList}" var="supplier">
			      	<option value="${supplier.id}">${supplier.name}</option>	
			      </g:each>
		      </select>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Official Receipt Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="por_no" value="${por_no}"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:field type="number" name="pamount" value="${pamount}"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:datePicker name="pdate" value="${pdate}" precision="day"/>
		    </div>
		</div>
	  </div>
	  <div class="actions">
	    <g:actionSubmit class="ui approve teal submit button" value="Save" action="addPayable"/>
	    <div class="ui button teal">Add More</div>
	    <div class="ui cancel button teal">Cancel</div>
	  </div>
    </g:form>
</div> 