<div id="addReceivable" class="ui small modal">
  <div class="header">Account Receivable</div>
  <div class="content">
    <g:form class="ui form" name="addReceivableForm" controller="account" action="addReceivable">
    	<div style="overflow-y: scroll; max-height: 300px">
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Customer Name</label>      
		    </div>
		    <div class="fourteen wide field">
			      <select name="rtransactor_id" class="ui dropdown" id="receivableCustomerList" onChange="toggleNewCustomer()">
			      	  <option value='0'  disabled selected> ---- Select a customer ---- </option>
				      <option value='-1'> ---- Create new customer ---- </option>
				      <g:each in="${customerList}" var="customer">
				      	<option value="${customer.id}">${customer.name}</option>	
				      </g:each>
			      </select>
		    </div>
		</div>
		<div class="receivableNewCustomer">
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Name</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="rname" name="rname" value="${rname}" required="true"/>
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Address</label>      
			    </div>
			    <div class="fourteen wide field">
			        <g:textField id="raddress" name="raddress" value="${raddress}" required="true"/>
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Telephone Number</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="rtelephone_no" name="rtelephone_no" value="${rtelephone_no}" required="true"/>
			    </div>
			</div>
			
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Mobile Number</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="rmobile_no" name="rmobile_no" value="${rmobile_no}" required="true"/>
			    </div>
			</div>
			
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Terms</label>      
			    </div>
			    <div class="seven wide field">
			       <g:field id="rterms" type="number" name="rterms" value="${rterms}" required="true"/>
			    </div>
			    <div class="seven wide field">
			    <g:select id="rselect" name="rselect" value="${rselect}"
	          from="${['d': 'days', 'w': 'weeks', 'm': 'months', 'y':'years']}"
	          optionKey="key" optionValue="value" />
	          </div>
			</div>  
		</div>
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Official Receipt Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField name="ror_no" value="${ror_no}"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Amount</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:field type="number" name="ramount" value="${ramount}"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Transaction Date</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:datePicker name="rdate" value="${rdate}" precision="day"/>
		    </div>
		</div>
		</div>
	  <div id="addReceivableErrorList" class="ui negative small message" style="display:none;"></div>
	  <div class="actions">

	    <g:submitToRemote 
		    	url="[controller: 'Account' ,action: 'addReceivable']" 
		    	value="Save" 
		    	class="ui teal button" 
		    	id="saveReceivableBtn" 
		    	update="addReceivableErrorList"
		    	onSuccess="rsaved()"
		    	/> 
	    <button class="ui teal button" value="Add More" id="raddMoreBtn" onClick="raddmore()">Add More</button>
	    <div class="ui button" style="display: none;" id="rdone">Done</div>
		<div class="ui cancel button" id="rcancel">Cancel</div>
	  </div>
    </g:form>
	  </div>
</div> 