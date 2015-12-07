<div id="editReceivableModal" class="ui modal">
  <div class="header">Edit Account Receivable</div>
  <div class="content">
    <g:form class="ui form" controller="account">
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Customer Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <!-- <select id="ercustomer_name" class="ui dropdown">
			      <g:each in="${customerList}" var="customer">
			      	<option value="${customer.id}">${customer.name}</option>	
			      </g:each>
		      </select> -->
		      <g:select name="ercustomer_name"
		     		from="${customerList }"
		     		value="${account?.transactor_id }"
		     		optionKey="id"
		     		optionValue="${it?.name }"
		     		valueMessagePrefix="${it?.name }"
		     	/>
		    </div>	
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Official Receipt Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="eror_no"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:field type="number" name="eramount"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="date" id="ertransaction_date" name="ertransaction_date">
		      <%--<g:datePicker name="eptransaction_date" precision="day"/>
		    --%></div>
		</div>
		<g:hiddenField name="receivable_id"/>
		<g:hiddenField name="type" value="R" />
	  </div>
	  <div class="actions">
	    <g:actionSubmit class="ui approve button teal" value="Save" action="editReceivable"/>
	    <div class="ui cancel button">Cancel</div>
	  </div>
    </g:form>
</div> 