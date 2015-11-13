<div id="addPayable" class="ui modal">
  <div class="header">Account Payable</div>
  <div class="content">
    <g:form class="ui form" controller="account" action="addPayable">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="supplier_name" value="${supplier_name}"/>
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
		      <g:datePicker name="pdate" value="${pdate}" />
		    </div>
		</div>
	  <div class="actions">
	    <g:actionSubmit class="ui approve large teal submit button" value="Save" action="addPayable"/>
	    <div class="ui button teal">Add More</div>
	    <div class="ui cancel button teal">Cancel</div>
	  </div>
    </g:form>
  </div>
</div> 