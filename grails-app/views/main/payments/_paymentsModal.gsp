<div id="payments" class="ui modal small">
  <div class="header">Payment History</div>
  <div class="content">
  
    <table id="paymentsTable" class="ui  padded table">
      <thead>
        <tr>
    	  <th>Date</th>	
    	  <th>Amount</th>
    	</tr>
      </thead>
      <tbody>
        <g:each in="${paymentList}" var="payments">
		  	<tr>
		    <td><g:formatDate format="MM/dd/yyyy" date="${payments.received_date}"/></td>
		    <td>${payable.amount }</td>
		  	</tr>	  		
	  	</g:each>
      </tbody>
    </table>
    <g:form class="ui form" controller="payment">
		<div class="inline fields">
		    <div class="thirteen wide field">
		      <g:textField type="number" placeholder="Amount paid" name="pmAmount"/>
		    </div>
		    <div class="three wide field">
		    <g:actionSubmit class="ui button teal addP" value="Add Payment" action="addPayment"/>
		    </div>
		</div>
		<g:hiddenField name="pmAccount_id" />
    </g:form>
  </div>
		<div class="actions">
			<div class="ui approve button teal">Done</div>
		</div>
</div>