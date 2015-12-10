<div id="addSupplier" class="ui modal">
  <div class="header">Supplier</div>
  <div class="content">
    
      <g:form class="ui form" controller="transactor" action="addTransactor">	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		       <g:textField id="sname" name="sname" value="${sname}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="saddress" name="saddress" value="${saddress}" required="true"/>
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Telephone Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="stelephone_no" name="stelephone_no" value="${stelephone_no}" required="true"/>
		    </div>
		</div>
		
		<div class="inline fields">
		    <div class="two wide field">
		      <label>Mobile Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <g:textField id="smobile_no" name="smobile_no" value="${smobile_no}" required="true"/>
		    </div>
		</div>
		
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		       <g:field id="sterms" type="number" name="sterms" value="${sterms}" required="true"/>
		    </div>
		    <div class="seven wide field">
		    <g:select id="sselect" name="sselect" value="${sselect}"
          from="${['d': 'days', 'w': 'weeks', 'm': 'months', 'y':'years']}"
          optionKey="key" optionValue="value" />
          </div>
        		    
		</div>    	
		<g:hiddenField name="stype" value="S" />
		<g:hiddenField name="sstatus" value="A" />
		<input type='reset' id="sresetBtn" value='Reset' hidden />
		
		<div class="actions">
    		<g:submitToRemote url="[controller: 'Transactor' ,action: 'addSupplier']"  
    		class="ui teal button"
    		id="ssaveBtn"  
    		update="saddMoreBtn"
    		value="Save" 
    		onComplete ="ssaved()" />
			
			<g:submitToRemote  url="" 
			update="ssaveBtn" 
			class="ui button" 
			value="Add More" 
			id="saddMoreBtn" 
			onComplete="saddmoreClick()"
			/>
			
			<input type='reset' id="sresetBtn" value='Reset' hidden />
			<div class="ui cancel button"  " >Cancel</div>
		</div>
    	
    </g:form>
  </div>

</div>