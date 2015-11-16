<div class="ui bottom attached active tab segment" data-tab="payablesTab" style="padding-bottom:50px">
	  <div class="ui form ">
	  	<div class="inline fields" style="float:left">
	    <div class="four wide field">
	      <label>Entries per page</label>
	      <select class="ui dropdown" id="payablesNumEntries">
			  <option value="10">10</option>
			  <option value="15">15</option>
			  <option value="30">30</option>
			  <option value="100">100</option>
		  </select>
	    </div>
	  	<div class="five wide field">
	      <label>Start Date</label>
	      <input type="date" id="min">
	    </div>
	    <div class="five wide field">
	      <label>End Date</label>
	      <input type="date" id="max">
	    </div>
	    </div>
	    <div class="three wide feild" style="float:right">
	      <button id="addPayableBtn" class="ui button teal">Add Payable</button>
	    </div>
	    <div class="three wide feild" style="float:right">
		    <button class="ui button teal">Print</button>
	    </div>
	  </div>
	  
	  
	  
	  <table id="payablesTable" class="display ui celled padded table"  cellspacing="0" width="100%">
	  <thead>
	    <tr>
	    <th>OR No.</th>
	    <th>Supplier</th>
	    <th>Amount</th>
	    <th>Transaction Date</th>
	    <th>Due Date</th>
	    <th>Edit</th>
	    <th>Payments</th>
	  	</tr>
	  </thead>
	  <tbody>
	  	<g:each in="${payableList}" var="payable">
		  	<tr>
		    <td>${payable.or_no}</td>
		    <td>Supplier</td>
		    <td>${payable.amount }</td>
		    <td>${payable.transaction_date}</td>
		    <td>Due date</td>
		    <td><a href="#" onClick="editPayable(${payable.or_no})"><i class="edit icon"></i></a></td>
		    <td> <button class="ui button teal paymentsBtn">View Payments</button></td>
		  	</tr>	  		
	  	</g:each>
	  </tbody>
	  </table>
	
	<b>Total Amount: </b> P36,400.00</p>
	</div>