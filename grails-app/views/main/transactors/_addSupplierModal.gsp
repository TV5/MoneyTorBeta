<div id="addSupplier" class="ui modal">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal user icon" style="margin-right: 10px;"></i>New
		Supplier
	</div>
	<div class="content">
		<g:form id="saddform" class="ui form">
			<div class="inline fields">
				<div class="two wide field">
					<label>Name</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="sname" name="sname" value="${sname}"
						required="true" />
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
					<label>Address</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="saddress" name="saddress" value="${saddress}"
						required="true" />
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
					<label>Telephone Number</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="stelephone_no" name="stelephone_no"
						value="${stelephone_no}" required="true" />
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
					<label>Mobile Number</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="smobile_no" name="smobile_no"
						value="${smobile_no}" required="true" />
				</div>
			</div>
			<div class="inline fields">
				<div class="two wide field">
					<label>Terms</label>
				</div>
				<div class="seven wide field">
					<g:field id="sterms" type="number" name="sterms" value="${sterms}"
						required="true" />
				</div>
				<div class="seven wide field">
					<g:select id="sselect" name="sselect" value="${sselect}"
						from="${['d': 'day(s)', 'w': 'week(s)', 'm': 'month(s)', 'y':'year(s)']}"
						optionKey="key" optionValue="value" />
				</div>
			</div>
			<g:hiddenField name="stype" value="S" />
			<g:hiddenField name="sstatus" value="A" />
		</g:form>
		<div class="ui divider"></div>
		<div id="svalidations" class="ui negative small message" hidden></div>
		<input type='reset' id="saddResetBtn" value='Reset' hidden />

		<div class="actions" style="float: right; margin-bottom: 14px;">
			<g:submitToRemote
				url="[controller: 'Transactor' ,action: 'addSupplier']"
				class="ui teal button" id="ssaveBtn" update="svalidations"
				value="Save" onComplete="ssaved()" />

			<g:submitToRemote url="" update="ssaveBtn" class="ui button"
				value="Add More" id="saddMoreBtn" onComplete="saddmoreClick()" />

			<div class="ui right labeled icon cancel button" id="sCancelBtn">
				<i class="cancel basic icon"></i>Cancel
			</div>
			<div class="ui right labeled icon button" id="sDoneBtn"
				style="display: none;"
				onclick="location.href = '/Moneytor/main/main?tab=suppliersTabLink';">
				<i class="checkmark icon"></i>Done
			</div>
		</div>
	</div>
</div>