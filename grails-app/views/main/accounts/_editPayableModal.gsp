<div id="editPayable" class="ui modal">
  <div class="header">Edit Account Payable</div>
  <div class="content">
    <g:form class="ui form" controller="account">
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Supplier Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <select id="epsupplier_name" class="ui dropdown" id="payablesNumEntries">
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
		      <input type="date" id="eptransaction_date">
		      <%--<g:datePicker name="eptransaction_date" precision="day"/>
		    --%></div>
		</div>
		<g:hiddenField name="payable_id"/>
		<g:hiddenField name="type" value="P" />
	  </div>
	  <div class="actions">
	    <g:actionSubmit class="ui approve button" value="Save" action="editAccount"/>
	    <div class="ui cancel button teal">Done</div>
	  </div>
    </g:form>
</div> 