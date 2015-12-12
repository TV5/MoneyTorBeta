<div id="addReceivable" class="ui modal">
  <div class="header">Account Receivable</div>
  <div class="content">
    <g:form class="ui form" controller="account" action="addReceivable">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Customer Name</label>      
		    </div>
		    <div class="nine wide field">
			      <select name="rtransactor_id" class="ui dropdown" id="receivableCustomerList" onChange="toggleNewCustomer()">
			      	  <option value='0'  disabled selected> ---- Select a customer ---- </option>
				      <g:each in="${customerList}" var="customer">
				      	<option value="${customer.id}">${customer.name}</option>	
				      </g:each>
				      <option value='-1'> ---- Create new customer ---- </option>
			      </select>
		    </div>
		    <div class="five wide field">
		    	<span>Not found in list? Choose "Create new customer"".</a></span>
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
	        		    
			  <!-- <div class="seven wide field">
			      <select id="cselect" class="ui fluid dropdown">
	    			<option value="">days</option>
	    			<option value="">weeks</option>
	    			<option value="">months</option>
	    			<option value="">years</option>
	    		  </select>
			    </div> -->  
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
	  <div class="ui negative small message" id="addReceivableErrorDiv" style="display:none;">
		  <div class="header">
		    There were some errors with your submission.
		  </div>	
		  <ul class="list" id="addReceivableErrorList">
		  </ul>
	  </div>
	  <div class="actions">

	    <g:submitToRemote 
		    	url="[controller: 'Account' ,action: 'addReceivable']" 
		    	value="Save" 
		    	class="ui teal button" 
		    	id="saveReceivableBtn" 
		    	onComplete="rsaved()"
		    	/> 
		<!--<g:submitToRemote  url="" update="saveReceivableBtn" class="ui button" value="Add More" id="raddMoreBtn" onComplete="raddmoreClick()" />-->
	    <button class="ui button" value="Add More" id="raddMoreBtn" onClick="raddmore()">Add More</button>
	    <div class="ui button" id="rdone">Done</div>
	    <div class="ui cancel button" >Cancel</div>
	  </div>
    </g:form>
	  </div>
</div> 