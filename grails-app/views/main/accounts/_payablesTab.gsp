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
	  <table class="ui celled padded table">
	  <thead>
	    <tr>
	    <th>OR No. <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Supplier <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Amount <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Transaction Date <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Due Date <i class="dropdown icon link" style="float:right"></i></th>
	    <th>Edit</th>
	    <th>Payments</th>
	  	</tr>
	  </thead>
	  <tbody>
	  	<tr>
	    <th>001823</th>
	    <th>Henwill Marketing</th>
	    <th>P3,000.00</th>
	    <th>August 18, 2015</th>
	    <th>September 18, 2015</th>
	    <th><a href="#" onClick="editData()"><i class="edit icon"></i></a></th>
	    <th> <button class="ui button teal paymentsBtn" >View Payments</button></th>
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
	  	
	  </tbody>
	  </table>
	<div class="ui pagination menu right" style="float:right">
	  <a class="active item">
	    1
	  </a>
	  <div class="disabled item">
	    ...
	  </div>
	  <a class="item">
	    10
	  </a>
	  <a class="item">
	    11
	  </a>
	  <a class="item">
	    12
	  </a>
	</div>
	<b>Total Amount: </b> P36,400.00</p>
	</div>