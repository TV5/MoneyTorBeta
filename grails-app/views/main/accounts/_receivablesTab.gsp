<div class="ui bottom attached tab segment" data-tab="receivablesTab"
	style="padding-bottom: 50px">
	<div class="ui form ">
		<div class="inline fields">
			<div class="inline fields thirteen wide" style="float: left">
				<div class="three wide field">
					<label>Entries per page</label> <select class="ui dropdown"
						id="receivablesNumEntries">
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="30">30</option>
						<option value="100">100</option>
					</select>
				</div>
				<div class="three wide field">
					<label>Start Date</label> <input type="text" id="minR">
				</div>
				<div class="three wide field">
					<label>End Date</label> <input type="text" id="maxR">
				</div>
				<div class="four wide field">
					<label>Search</label> <input type="text" id="searchReceivables">
				</div>
				<div class="six wide field">
					<button id="addReceivableBtn"
						style="margin-left: auto; margin-right: 0;"
						class="ui labeled icon button teal">
						<i class="add icon"></i>Add Receivables
					</button>
				</div>
			</div>
		</div>
	</div>
	<table id="receivablesTable" class="display ui celled padded table"
		cellspacing="0" width="100%">
		<thead>
			<tr>
				<th class="two wide">OR No.</th>
				<th class="two wide">Customer</th>
				<th class="two wide">Amount</th>
				<th class="two wide">Transaction Date</th>
				<th class="three wide">Due Date</th>
				<th class="two wide">Edit</th>
				<th class="two wide">Payments</th>
			</tr>
		</thead>
		<tbody>
			<g:each in="${receivableList}" var="receivable">
				<tr title="Last updated on ${receivable.updated_on}">
					<td>
						${receivable.or_no}
					</td>
					<td><g:findAll in="${customerList}"
							expr="it.id == receivable.transactor_id">
							${it.name}
							<g:set var="customerName" value="${it.name}" />
						</g:findAll></td>
					<td class="sum">
					<g:formatNumber number="${receivable.amount}" format="0.00"/>
					</td>
					<td><g:formatDate format="MM/dd/yyyy"
							date="${receivable.transaction_date}" /></td>
					<td class="dueDate">
						<% def dueDate = receivable.transaction_date+it.terms  %> <g:formatDate
							format="MM/dd/yyyy" date="${dueDate}" />
					</td>
					<td><a href="#"
						onClick="editReceivable($(this),'${receivable.id}','${receivable.or_no}','${receivable.transactor_id}','${receivable.amount}','${receivable.transaction_date}','${receivable.status}')"><i
							class="edit icon"></i></a></td>
					<td>
						<button class="ui right labeled icon button"
							onClick="addPayment('${receivable.id}','${customerName}','${receivable.amount}', 'r')">
							<i class="search basic teal icon"></i>View
						</button>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<b>Total Amount:</b>
	<p id="receivablesTotal"></p>
</div>

<div id="cantedit" class="ui small test modal transition"
	style="margin-top: -92.5px;">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal warning icon"
			style="margin-right: 10px;"></i>Edit Account</div>
	<div class="content">
		<p style="margin-top:-10px">Payments have already been made to this account. Modifications are no longer allowed.</p>
	</div>
	<div class="actions">
		<div class="ui cancel teal button">OK</div>
	</div>
</div>