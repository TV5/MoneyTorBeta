<div class="ui bottom attached active tab segment" data-tab="payablesTab" style="padding-bottom:50px">
	  <div class="ui form ">
	  	<div class="inline fields" style="float:left">
	    <div class="four wide field">
	      <label>Entries per page</label>
	      <input type="number" value="10">
	    </div>
	  	<div class="five wide field">
	      <label>Start Date</label>
	      <input type="date">
	    </div>
	    <div class="five wide field">
	      <label>End Date</label>
	      <input type="date">
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
		    <th>${payable.or_no}</th>
		    <th>Supplier</th>
		    <th>P${payable.amount }</th>
		    <th>${payable.transaction_date}</th>
		    <th>Due date</th>
		    <th><a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
		    <th> <button class="ui button teal paymentsBtn" >View Payments</button></th>
		  	</tr>	  		
	  	</g:each>
	  
	  <!-- 
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	<tr>
	    <th>001724</th>
	    <th>SM Entertainment </th>
	    <th>P16,400.00</th>
	    <th>August 12, 2015</th>
	    <th>September 19, 2015</th>
	    <th> <a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn">View Payments</button></th>
	  	</tr>
	  	 -->
	  </tbody>
	  </table>
	
	<b>Total Amount: </b> P36,400.00</p>
	</div>