<div class="ui bottom attached active tab segment" data-tab="payablesTab" style="padding-bottom:50px">
	  <div class="ui form ">
	  	<div class="inline fields" style="float:left">
	    <div class="four wide field">
	      <label>Entries per page</label>
	      <select class="ui dropdown" id="payablesNumEntries">
			  <option value="10">2</option>
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
	      <button id="addPayableBtn" class="ui button teal">Add</button>
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
		    <td>
			<g:findAll in="${supplierList}" expr="it.id == payable.transactor_id">
			    ${it.name}
			</g:findAll>
			</td>
		    <td>${payable.amount }</td>
		    <td><g:formatDate format="MM/dd/yyyy" date="${payable.transaction_date}"/></td>
		    <td>
		    <% def dueDate = payable.transaction_date+it.terms %>
		    <g:formatDate format="MM/dd/yyyy" date="${dueDate}"/>
		    </td>
		    <td><a href="#" onClick="editPayable('${payable.id}','${payable.or_no}','${payable.transactor_id}','${payable.amount}','${payable.transaction_date}')"><i class="edit icon"></i></a></td>
		    <td> <button class="ui button teal paymentsBtn">View</button></td>
		  	</tr>	  		
	  	</g:each>
	  </tbody>
	  </table>
	
	<b>Total Amount:</b><p id="payablesTotal"></p>
	</div>