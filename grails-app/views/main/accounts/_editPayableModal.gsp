<div id="editPayableModal" class="ui small modal">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal edit icon" style="margin-right: 10px;"></i>Edit
		Account Payable
	</div>
	<div class="content">
		<g:form class="ui form" controller="account" action="">
			<div class="inline fields">
				<div class="two wide field">
					<label>Supplier Name</label>
				</div>
				<div class="fourteen wide field">
					<g:textField name="epsupplier_name" disabled="true" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Official Receipt Number</label>
				</div>
				<div class="fourteen wide field">
					<g:textField name="epor_no" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Amount</label>
				</div>
				<div class="fourteen wide field">
					<g:field type="number" name="epamount" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Transaction Date</label>
				</div>
				<div class="fourteen wide field">
					<input type="date" id="eptransaction_date"
						name="eptransaction_date">
				</div>
			</div>
			<g:hiddenField name="payable_id" />
			<g:hiddenField name="type" value="P" />
		</g:form>
	</div>
	<div id="editPayableErrorList" class="ui negative small message"
		style="display: none;"></div>
	<div class="actions">
		<g:submitToRemote url="[controller: 'Account' ,action: 'editPayable']"
			value="Save" class="ui teal button" id="saveEditPayableBtn"
			onComplete="pesaved()" update="editPayableErrorList" />
		<div class="ui right labeled icon cancel button">
			<i class="cancel basic icon"></i>Cancel
		</div>
	</div>
</div>
