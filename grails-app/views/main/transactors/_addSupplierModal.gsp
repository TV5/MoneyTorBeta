<div id="addSupplier" class="ui modal">
  <div class="header">Supplier</div>
  <div class="content">
    
      <g:form class="ui form" controller="transactor" action="addTransactor">	
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Name</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Address</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Contact Number</label>      
		    </div>
		    <div class="fourteen wide field">
		      <input type="text">
		    </div>
		</div>
		
    	<div class="inline fields">
		    <div class="two wide field">
		      <label>Terms</label>      
		    </div>
		    <div class="seven wide field">
		      <input type="number">
		    </div>
		    <div class="seven wide field">
		      <select class="ui fluid dropdown">
    			<option value="">days</option>
    			<option value="">weeks</option>
    			<option value="">months</option>
    			<option value="">years</option>
    		  </select>
		    </div>
		</div>    	
    	
    </g:form>
  </div>
  <div class="actions">
    <div class="ui approve button">Save</div>
    <div class="ui button">Add More</div>
    <div class="ui cancel button">Cancel</div>
  </div>
</div>