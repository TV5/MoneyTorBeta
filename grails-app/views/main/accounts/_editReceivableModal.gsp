<div id="editReceivableModal" class="ui modal">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal edit icon" style="margin-right: 10px;"></i>Edit
		Account Receivable
	</div>
	<div class="content">
		<g:form class="ui form" controller="account">
			<div class="inline fields">
				<div class="two wide field">
					<label>Customer Name</label>
				</div>
				<div class="fourteen wide field">
					<g:textField name="ercustomer_name" disabled="true" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Official Receipt Number</label>
				</div>
				<div class="fourteen wide field">
					<g:textField name="eror_no" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Amount</label>
				</div>
				<div class="fourteen wide field">
					<g:field type="number" name="eramount" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Transaction Date</label>
				</div>
				<div class="fourteen wide field">
					<input type="date" id="ertransaction_date"
						name="ertransaction_date">
					<%--<g:datePicker name="eptransaction_date" precision="day"/>
		    --%>
				</div>
			</div>
			<g:hiddenField name="receivable_id" />
			<g:hiddenField name="type" value="R" />
		</g:form>		`
	</div>
	<div id="editReceivableErrorList" class="ui negative small message"
		style="display: none;"></div>
	<div class="actions">
		<g:submitToRemote
			url="[controller: 'Account' ,action: 'editReceivable']" value="Save"
			class="ui teal button" id="saveEditReceivableBtn"
			onComplete="resaved()" update="editReceivableErrorList" />
		<div class="ui right labeled icon cancel button">
			<i class="cancel basic icon"></i>Cancel
		</div>
	</div>
</div>
