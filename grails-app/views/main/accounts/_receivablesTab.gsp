<div class="ui bottom attached tab segment" data-tab="receivablesTab"
	style="padding-bottom: 50px">
	<div class="ui form ">
	  <div class="inline fields">
	  	<div class="inline fields thirteen wide" style="float:left">
		    <div class="three wide field">
		      <label>Entries per page</label>
		      <select class="ui dropdown" id="receivablesNumEntries">
				  <option value="10">10</option>
				  <option value="15">15</option>
				  <option value="30">30</option>
				  <option value="100">100</option>
			  </select>
		    </div>
		  	<div class="four wide field">
		      <label>Start Date</label>
		      <input type="date" id="minR">
		    </div>
		    <div class="four wide field">
		      <label>End Date</label>
		      <input type="date" id="maxR">
		    </div>
		    <div class="four wide field">
		      <label>Search</label>
		      <input type="text" id="searchReceivables">
		    </div>
	    </div>
	    <div class="inline fields three wide" style="float:right">
	    	<button id="" class="ui button teal">Export</button>
		    <button id="addReceivableBtn" class="ui button teal">Add</button>
	    </div>
	    </div>
	  </div>

	<table id="receivablesTable" class="display ui celled padded table"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th>OR No.</th>
				<th>Customer</th>
				<th>Amount</th>
				<th>Transaction Date</th>
				<th>Due Date</th>
				<th>Edit</th>
				<th>Payments</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${receivableList}" var="receivable">
			  	<tr title="Last updated on ${receivable.updated_on}">
			    <td>${receivable.or_no}</td>
			    <td>
					<g:findAll in="${customerList}" expr="it.id == receivable.transactor_id">
					    ${it.name}
					</g:findAll>
				</td>
			    <td class="sum">${receivable.amount }</td>
			    <td><g:formatDate format="MM/dd/yyyy" date="${receivable.transaction_date}"/></td>
			    <td>
				    <% def dueDate = receivable.transaction_date+it.terms %>
				    <g:formatDate format="MM/dd/yyyy" date="${dueDate}"/>
			    </td>
			    <td><a href="#" onClick="editReceivable('${receivable.id}','${receivable.or_no}','${receivable.transactor_id}','${receivable.amount}','${receivable.transaction_date}')"><i class="edit icon"></i></a></td>
			    <td> <button class="ui button teal paymentsBtn">View</button></td>
			  	</tr>	  		
	  		</g:each>
		</tbody>
	</table>
	<b>Total Amount:</b><p id="receivablesTotal"></p>
	</p>
</div>