<div id="payments" class="ui modal small" style="padding-top:-50px!important;">
	<div class="header" >Payment History
		<h2 id="pmAccountName" class="ui teal large tag label" style="margin-left:25px;"></h2>
	</div>
  	<div class="content" id="paymentsss">	  	  	
		<table id="paymentsTable" class="ui padded table">
      		<thead>
        		<tr>
    	  			<th>Date</th>	
    	  			<th>Amount</th>
    			</tr>
      		</thead>
      		<tbody>
        		<g:findAll in="${paymentList}" expr="it.account == 10">
		  			<tr>
		  				<td><g:formatDate format="MM/dd/yyyy" date="${it.received_date}"/></td>
		    			<td><g:formatNumber type="currency" number="${it.amount}" currencyCode="PHP"/></td>
		  			</tr>	  
	  			</g:findAll>
      		</tbody>
    	</table>
    	<g:formRemote name="subForm" url="[controller:'payment', action:'addPayment']" class="ui form">
  			<div class="ui error message"></div> 		
			<div class="inline fields">
		    	<div class="thirteen wide field">
		      		<g:textField name="pmAmount"/>
		    	</div>
		    	<g:hiddenField name="pmAccount_id"/>
		    	<div class="three wide field">
		    		<button class="ui button teal" onclick="pymntAdded()">Add Payment</button>
		    	</div>
			</div>
    	</g:formRemote>
  	</div>
	<div class="actions">
		<div class="ui approve button teal">Done</div>
	</div>
</div>