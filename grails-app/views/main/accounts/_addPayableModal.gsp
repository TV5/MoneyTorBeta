<div id="addPayable" class="ui small modal">
	<div class="header">Account Payable</div>
	<div class="content">
		<g:renderErrors bean="${account}" />
		<g:form class="ui form" id="addPayableForm" name="addPayableForm"
			action="">
			<div style="overflow-y: scroll; max-height: 300px">
				<div class="inline fields">
					<div class="two wide field">
						<label>Supplier Name</label>
					</div>
					<div class="fourteen wide field">
						<select name="transactor_id" class="ui dropdown"
							id="payabaleSupplierList" onChange="toggleNewSupplier()">
							<option value='0' disabled selected>---- Select a
								supplier ----</option>
							<option value='-1'>---- Create new supplier ----</option>
							<g:each in="${supplierList}" var="supplier">
								<option value="${supplier.id}">
									${supplier.name}
								</option>
							</g:each>
						</select>
					</div>
				</div>
				<div class="payableNewSupplier">
					<div class="inline fields">
						<div class="two wide field">
							<label>Name</label>
						</div>
						<div class="fourteen wide field">
							<g:textField id="pname" name="pname" value="${pname}"
								required="true" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Address</label>
						</div>
						<div class="fourteen wide field">
							<g:textField id="paddress" name="paddress" value="${paddress}"
								required="true" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Telephone Number</label>
						</div>
						<div class="fourteen wide field">
							<g:textField id="ptelephone_no" name="ptelephone_no"
								value="${ptelephone_no}" required="true" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Mobile Number</label>
						</div>
						<div class="fourteen wide field">
							<g:textField id="pmobile_no" name="pmobile_no"
								value="${pmobile_no}" required="true" />
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Terms</label>
						</div>
						<div class="seven wide field">
							<g:field id="pterms" type="number" name="pterms"
								value="${pterms}" required="true" />
						</div>
						<div class="seven wide field">
							<g:select id="pselect" name="pselect" value="${pselect}"
								from="${['d': 'days', 'w': 'weeks', 'm': 'months', 'y':'years']}"
								optionKey="key" optionValue="value" />
						</div>
					</div>

				</div>

				<div class="inline fields">
					<div class="two wide field">
						<label>Official Receipt Number</label>
					</div>
					<div class="fourteen wide field">
						<g:textField name="por_no" id="por_no" value="${por_no}" />
					</div>
				</div>

				<div class="inline fields">
					<div class="two wide field">
						<label>Amount</label>
					</div>
					<div class="fourteen wide field">
						<g:field type="number" name="pamount" id="pamount"
							value="${pamount}" />
					</div>
				</div>

				<div class="inline fields">
					<div class="two wide field">
						<label>Transaction Date</label>
					</div>
					<div class="fourteen wide field">
						<g:datePicker name="pdate" id="pdate" value="${pdate}"
							precision="day" />
					</div>
				</div>
			</div>
			<div id="addPayableErrorList" class="ui negative small message"
				style="display:none;"></div>
			<div class="actions">
				<g:submitToRemote
					url="[controller: 'Account' ,action: 'addPayable']" value="Save"
					class="ui teal button" id="savePayableBtn" onComplete="psaved()"
					update="addPayableErrorList"/>
				<button class="ui teal button" value="Add More" id="paddMoreBtn"
					onClick="paddmore()">Add More</button>
				<div class="ui button" style="display: none;" id="pdone">Done</div>
				<div class="ui cancel button" id="pcancel">Cancel</div>
			</div>
		</g:form>


	</div>