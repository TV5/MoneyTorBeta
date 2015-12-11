<div id="editPayableModal" class="ui modal">
  <div class="header">Edit Account Payable</div>
  <div class="content">
    <g:form class="ui form" controller="account">
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="epsupplier_name" disabled="true"/>
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
		      <input type="date" id="eptransaction_date" name="eptransaction_date">
		      <%--<g:datePicker name="eptransaction_date" precision="day"/>
		    --%></div>
		</div>
		<g:hiddenField name="payable_id"/>
		<g:hiddenField name="type" value="P" />
	  </div>
	  <div class="ui negative small message" id="editPayableErrorDiv" style="display:none;">
		  <div class="header">
		    There were some errors with your submission.
		  </div>	
		  <ul class="list" id="editPayableErrorList">
		  </ul>
	  </div>
	  <div class="actions">
	    <g:actionSubmit class="ui approve button teal" value="Save" action="editPayable"/>
		<div class="ui cancel button" >Cancel</div>
	  </div>
    </g:form>
</div> 