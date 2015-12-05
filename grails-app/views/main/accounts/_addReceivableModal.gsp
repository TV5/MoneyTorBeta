<div id="addReceivable" class="ui modal">
  <div class="header">Account Receivable</div>
  <div class="content">
    <g:form class="ui form" controller="account" action="addReceivable">
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Customer Name</label>      
		    </div>
		    <div class="nine wide field">
			      <select name="rtransactor_id" class="ui dropdown" id="receivableCustomerList">
			      	  <option value='0'  disabled selected> ---- Select a customer ---- </option>
				      <g:each in="${customerList}" var="customer">
				      	<option value="${customer.id}">${customer.name}</option>	
				      </g:each>
			      </select>
		    </div>
		    <div class="five wide field">
		    	<span>Not found in list? <a onClick="toggleNewCustomer()">Create new record.</a></span>
		    </div>
		</div>
		<div class="receivableNewCustomer">
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Name</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="cname" name="cname" value="${cname}" required="true"/>
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Address</label>      
			    </div>
			    <div class="fourteen wide field">
			        <g:textField id="caddress" name="caddress" value="${caddress}" required="true"/>
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Telephone Number</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="ctelephone_no" name="ctelephone_no" value="${ctelephone_no}" required="true"/>
			    </div>
			</div>
			
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Mobile Number</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="cmobile_no" name="cmobile_no" value="${cmobile_no}" required="true"/>
			    </div>
			</div>
			
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Terms</label>      
			    </div>
			    <div class="seven wide field">
			       <g:field id="cterms" type="number" name="cterms" value="${cterms}" required="true"/>
			    </div>
			    <div class="seven wide field">
			    <g:select id="cselect" name="cselect" value="${cselect}"
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
	  </div>
    </g:form>
	  </div>
</div> 