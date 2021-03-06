<div class="ui bottom attached active tab segment" data-tab="payablesTab" style="padding-bottom: 50px">
	<div class="ui form ">
		<div class="inline fields">
			<div class="inline fields thirteen wide" style="float: left">
				<div class="three wide field">
					<label>Entries per page</label> 
					<select class="ui dropdown"
						id="payablesNumEntries">
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="30">30</option>
						<option value="100">100</option>
					</select>
				</div>
				<div class="three wide field">
					<label>Start Date</label> 
					<input type="text" id="minP">
				</div>
				<div class="three wide field">
					<label>End Date</label> 
					<input type="text" id="maxP">
				</div>
				<div class="four wide field">
					<label>Search</label> 
					<input type="text" id="searchPayables">
				</div>
				<div class="six wide field">
					<button id="addPayableBtn" style="margin-left: auto; margin-right: 0;" class="ui labeled icon button teal">
						<i class="add icon"></i>Add Payables
					</button>
				</div>
			</div>
		</div>
	</div>
	<table id="payablesTable" class="display ui celled padded table"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th class="two wide">OR No.</th>
				<th class="two wide">Supplier</th>
				<th class="two wide">Amount</th>
				<th class="two wide">Transaction Date</th>
				<th class="three wide">Due Date</th>
				<th class="two wide">Edit</th>
				<th class="two wide">Payments</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${payableList}" var="payable">
				<tr title="Last updated on ${payable.updated_on}">
					<td>
						${payable.or_no}
					</td>
					<td><g:findAll in="${supplierList}"
							expr="it.id == payable.transactor_id">
							${it.name}
							<g:set var="supplierName" value="${it.name}" />
						</g:findAll></td>
					<td class="sum">
						<g:formatNumber number="${payable.amount}" format="0.00"/>
					</td>
					<td><g:formatDate format="MM/dd/yyyy"
							date="${payable.transaction_date}" /></td>
					<td class="dueDate">
						<% def dueDate = payable.transaction_date+it.terms %> <g:formatDate
							format="MM/dd/yyyy" date="${dueDate}" />
					</td>
					<td>
						<a href="#"	onClick="editPayable($(this),'${payable.id}','${payable.or_no}','${payable.transactor_id}','${payable.amount}','${payable.transaction_date}','${payable.status}')">
							<i class="edit icon"></i>
						</a>
					</td>
					<td>
						<button class="ui right labeled icon button"
							onClick="addPayment('${payable.id}','${supplierName}','${payable.amount}','p')">
							<i class="search basic teal icon"></i>View
						</button>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<b>Total Amount:</b>
	<p id="payablesTotal"></p>
</div>