<div id="editCustomerModal" class="ui modal">

  <div class="header">Edit Customer</div>
  <div class="content">
    <g:form class="ui form" id="editCustomerForm"  controller="transactor">	
    	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="ecname" name="ecname" value="${ecname}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		        <g:textField id="ecaddress" name="ecaddress" value="${ecaddress}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Telephone Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="ectelephone_no" name="ectelephone_no" value="${ectelephone_no}" required="true"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Mobile Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="ecmobile_no" name="ecmobile_no" value="${ecmobile_no}" required="true"/>
		    </div>
		</div>
		
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		       <g:field id="ecterms" type="number" name="ecterms" value="${ecterms}" required="true"/>
		    </div>
		    <div class="seven wide field">
		    <g:select id="ecselect" name="ecselect" value="${ecselect}"
          from="${['d': 'day(s)', 'w': 'week(s)', 'm': 'month(s)', 'y':'year(s)']}"
          optionKey="key" optionValue="value" />
          </div>
        		 
		</div>    	
		<g:hiddenField name="ectype" value="C" />
		<g:hiddenField name="ecstatus" value="A" />
		<g:hiddenField name="ecid" value="${ecid}" />
		
		<input type='reset' id="ecresetBtn" value='Reset' hidden />
		
		
    	<div class="actions">
    		<g:actionSubmit id= "ecsave" class="ui approve button teal" value="Save" action="editCustomer"/>
			
			<!--<g:field id="addmore" class="ui button" type="reset" name="myReset"  update="saveBtn" value="Add More" url="" onComplete="addmoreClick()"/> -->
			<div class="ui cancel button"  " >Cancel</div>
		</div>
   </g:form>
  </div>
 
</div>