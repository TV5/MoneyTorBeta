<div class="ui bottom attached tab segment" data-tab="receivablesTab" style="padding-bottom:50px">
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
		      <button id="addReceivableBtn" class="ui button teal">Add Receivable</button>
		    </div>
		    <div class="three wide feild" style="float:right">
			    <button class="ui button teal">Print</button>
		    </div>
		  </div>
		  <table class="ui celled padded table">
		  <thead>
		    <tr>
		    <th>OR No. <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Customer <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Amount <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Transaction Date <i class="dropdown icon link" style="float:right"></i></th>
		    <th>Due Date <i class="dropdown icon link" style="float:right"></i></th>
		  	</tr>
		  </thead>
		  <tbody>
		  	<tr>
		    <th>001523</th>
		    <th><a href="#">Ivan Wesley Chua</a>      <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P10,000.00</th>
		    <th>August 18, 2015</th>
		    <th>September 18, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001722</th>
		    <th><a href="#">Jean Lim</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P13,400.00</th>
		    <th>August 12, 2015</th>
		    <th>September 19, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001619</th>
		    <th><a href="#">Klifford Kho</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P1,300.00</th>
		    <th>August 11, 2015</th>
		    <th>October 1, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001605</th>
		    <th><a href="#">Curt Co</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P100.00</th>
		    <th>August 11, 2015</th>
		    <th>October 1, 2015</th>
		  	</tr>
		  	<tr>
		    <th>001528</th>
		    <th><a href="#">Kiefer Lim</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P54,000.00</th>
		    <th>August 9, 2015</th>
		    <th>January 12, 2016</th>
		  	</tr>
		  	<tr>
		    <th>001511</th>
		    <th><a href="#">George Ong</a>   <a href="#" id="eicon" onClick="editDataR()"><i class="edit icon"></i></a></th>
		    <th>P500.00</th>
		    <th>August 8, 2015</th>
		    <th>September 18, 2015</th>
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
		<b>Total Amount: </b> P79,300.00</p>
	</div>