<div id="editPayable" class="ui modal">
  <div class="header">Edit Account Payable</div>
  <div class="content">
    <g:form class="ui form" controller="account">
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="epsupplier_name"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Official Receipt Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="epor_no"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:field type="number" name="epamount"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:datePicker name="eptransaction_date"/>
		    </div>
		</div>
		<g:hiddenField name="type" value="P" />
	  </div>
	  <div class="actions">
	    <g:actionSubmit class="ui approve button" value="Save" action="editAccount"/>
	    <div class="ui cancel button teal">Done</div>
	  </div>
    </g:form>
</div> 