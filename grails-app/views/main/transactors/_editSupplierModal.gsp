<div id="editSupplierModal" class="ui modal">
  <div class="header">Edit Supplier</div>
  <div class="content">
    
      <g:form class="ui form" controller="transactor" >	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		       <g:textField id="esname" name="esname" value="${esname}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="esaddress" name="esaddress" value="${esaddress}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Telephone Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="estelephone_no" name="estelephone_no" value="${estelephone_no}" required="true"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Mobile Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="esmobile_no" name="esmobile_no" value="${esmobile_no}" required="true"/>
		    </div>
		</div>
		
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		       <g:field id="esterms" type="number" name="esterms" value="${esterms}" required="true"/>
		    </div>
		    <div class="seven wide field">
		    <g:select id="esselect" name="esselect" value="${esselect}"
          from="${['d': 'days', 'w': 'weeks', 'm': 'months', 'y':'years']}"
          optionKey="key" optionValue="value" />
          </div>
        		    
		</div>    	
		<g:hiddenField name="estype" value="S" />
		<g:hiddenField name="esstatus" value="A" />
		<g:hiddenField name="esid" value="${esid}" />
		<input type='reset' id="sresetBtn" value='Reset' hidden />
		
		<div class="actions">
		<g:actionSubmit id= "essave" class="ui approve button teal" value="Save" action="editSupplier"/>
			
			<input type='reset' id="sresetBtn" value='Reset' hidden />
			<div class="ui cancel button"  " >Cancel</div>
		</div>
    	
    </g:form>
  </div>

</div>