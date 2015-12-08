<div id="payments" class="ui modal small">
	<div class="header">Payment History</div>
  	<div class="content" id="paymentsss">
		<table id="paymentsTable" class="ui  padded table">
      		<thead>
        		<tr>
    	  			<th>Date</th>	
    	  			<th>Amount</th>
    			</tr>
      		</thead>
      		<tbody>
        		<g:each in="${paymentList}" var="payment">
		  			<tr>
		  				<td><g:formatDate format="MM/dd/yyyy" date="${payment.received_date}"/></td>
		    			<td>${payment.amount}</td>
		  			</tr>	  		
	  			</g:each>
      		</tbody>
    	</table>
    	<g:form class="ui form">
    		<div class="ui error message"></div>
			<div class="inline fields">
		    	<div class="thirteen wide field">
		      		<g:textField name="pmAmount" />
		    	</div>
		    	<g:hiddenField name="pmAccount_id"/>
		    	<div class="three wide field">
		    		<g:submitToRemote url="[controller:'payment', action:'addPayment']" update="paymentsss" class="ui button teal" onComplete="pymntAdded()" value="Add Payment"/>
		    	</div>
			</div>
    	</g:form>
  	</div>
	<div class="actions">
		<div class="ui approve button teal">Done</div>
	</div>
</div>