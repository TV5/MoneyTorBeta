<div class="ui bottom attached tab segment" data-tab="receivablesTab"
	style="padding-bottom: 50px">
	<div class="ui form ">
		<div class="inline fields" style="float: left">
			<div class="four wide field">
				<label>Entries per page</label> <input type="number" value="10">
			</div>
			<div class="five wide field">
				<label>Start Date</label> <input type="date">
			</div>
			<div class="five wide field">
				<label>End Date</label> <input type="date">
			</div>
		</div>
		<div class="three wide feild" style="float: right">
			<button id="addReceivableBtn" class="ui button teal">Add</button>
		</div>
		<div class="three wide feild" style="float: right">
			<button class="ui button teal">Print</button>
		</div>
	</div>

	<div class="dt-buttons">
		<a class="dt-button buttons-create" tabindex="0"
			aria-controls="example"> <span>New</span>
		</a> <a class="dt-button buttons-selected buttons-edit disabled"
			tabindex="0" aria-controls="example"> <span>Edit</span>
		</a> <a class="dt-button buttons-selected buttons-remove disabled"
			tabindex="0" aria-controls="example"> <span>Delete</span>
		</a> <a class="dt-button buttons-collection" tabindex="0"
			aria-controls="example"> <span>Export</span>
		</a>
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
				<tr>
					<td>
						${receivable.or_no}
					</td>
					<td>Supplier</td>
					<td>P${receivable.amount }</td>
					<td>
						${receivable.transaction_date}
					</td>
					<td>Due date</td>
					<td><a href="#"><i class="edit icon"></i></a></td>
					<td>
						<button class="ui button teal paymentsBtn">View Payments</button>
					</td>
				</tr>
			</g:each>
		</tbody>
	</table>
	<b>Total Amount: </b> P79,300.00
	</p>
</div>