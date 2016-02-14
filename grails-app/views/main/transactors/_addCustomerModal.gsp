<div id="addCustomer" class="ui modal">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal user icon" style="margin-right: 10px;"></i>New
		Customer
	</div>
	<div class="content">
		<g:form class="ui form" id="addCustomerForm">

			<div class="inline fields">
				<div class="two wide field">
					<label>Name</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="cname" name="cname" value="${cname}"
						required="true" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Address</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="caddress" name="caddress" value="${caddress}"
						required="true" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Telephone Number</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="ctelephone_no" name="ctelephone_no"
						value="${ctelephone_no}" required="true" />
				</div>
			</div>

			<div class="inline fields">
				<div class="two wide field">
					<label>Mobile Number</label>
				</div>
				<div class="fourteen wide field">
					<g:textField id="cmobile_no" name="cmobile_no"
						value="${cmobile_no}" required="true" />
				</div>
			</div>


			<div class="inline fields">
				<div class="two wide field">
					<label>Terms</label>
				</div>
				<div class="seven wide field">
					<g:field id="cterms" type="number" name="cterms" value="${cterms}"
						required="true" />
				</div>
				<div class="seven wide field">
					<g:select id="cselect" name="cselect" value="${cselect}"
						from="${['d': 'day(s)', 'w': 'week(s)', 'm': 'month(s)', 'y':'year(s)']}"
						optionKey="key" optionValue="value" />
				</div>

			</div>
			<g:hiddenField name="ctype" value="C" />
			<g:hiddenField name="cstatus" value="A" />
			<input type='reset' id="cresetBtn" value='Reset' hidden />
			<div class="ui divider"></div>
			<div id="Validations" class="ui negative small message" hidden></div>
			<div class="actions" style="float: right; margin-bottom: 14px;">
				<g:submitToRemote
					url="[controller: 'Transactor' ,action: 'addCustomer']"
					class="ui teal button" id="csaveBtn" update="Validations"
					value="Save" onComplete="csaved()" />

				<!--<g:submitToRemote url="" update="csaveBtn" class="ui button"
					value="Add More" id="caddMoreBtn" onComplete="caddmoreClick()" />-->
					
					<button class="ui button" value="Add More" id="caddMoreBtn"
					onClick="caddmoreClick()"><i class="add icon"></i>Add More</button>

				<!--<g:field id="addmore" class="ui button" type="reset" name="myReset"  update="saveBtn" value="Add More" url="" onComplete="addmoreClick()"/> -->
				<div class="ui right labeled icon cancel button" id="cCancelBtn">
					<i class="cancel basic icon"></i>Cancel
				</div>
				<div class="ui right labeled icon button" id="cDoneBtn"
					style="display: none;"
					onclick="location.href = '/Moneytor/main/main?tab=customersTabLink';">
					<i class="checkmark icon"></i>Done
				</div>
			</div>
		</g:form>
	</div>
</div>