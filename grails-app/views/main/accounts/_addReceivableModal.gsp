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
			      	  <option disabled selected> ---- Select a customer ---- </option>
				      <g:each in="${customerList}" var="customer">
				      	<option value="${customer.id}">${customer.name}</option>	
				      </g:each>
			      </select>
		    </div>
		    <div class="five wide field">
		    	<span>Not found in list? <a onClick="toggleNewCustomer()">Create new record.</a></span>
		    </div>
		</div>
<%--		<div class="receivableNewCustomer">
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Name</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="rname" name="rname" value="${cname}" required="true"/>
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Address</label>      
			    </div>
			    <div class="fourteen wide field">
			        <g:textField id="raddress" name="raddress" value="${caddress}" required="true"/>
			    </div>
			</div>
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Telephone Number</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="rtelephone_no" name="rtelephone_no" value="${ctelephone_no}" required="true"/>
			    </div>
			</div>
			
			<div class="inline fields">
			    <div class="two wide field">
			      <label>Mobile Number</label>      
			    </div>
			    <div class="fourteen wide field">
			      <g:textField id="rmobile_no" name="rmobile_no" value="${cmobile_no}" required="true"/>
			    </div>
			</div>
			
			
	    	<div class="inline fields">
			    <div class="two wide field">
			      <label>Terms</label>      
			    </div>
			    <div class="seven wide field">
			       <g:field id="rterms" type="number" name="rterms" value="${cterms}" required="true"/>
			    </div>
			    <div class="seven wide field">
			    <g:select id="rselect" name="rselect" value="${cselect}"
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
		</div>--%>
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
	  <div class="actions">
	    <g:actionSubmit class="ui approve teal submit button" id="rSubmit" value="Save" action="addReceivable"/>
	    <div class="ui button teal">Add More</div>
	    <div class="ui cancel button teal">Cancel</div>
	  </div>
    </g:form>
</div> 