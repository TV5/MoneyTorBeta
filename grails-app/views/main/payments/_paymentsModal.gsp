<div id="payments" class="ui modal small" style="padding-top:-50px!important;">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal dollar icon"
			style="margin-right: 10px;"></i>Payment History
		<h2 id="pmAccountName" class="ui left pointing teal basic label" style="margin-left:10px;"></h2>
	</div>
  	<div class="content" id="paymentsss" style="padding-top:10px;padding-bottom:0px;">	  
  		<div id="yeah" hidden>${paymentList}</div>
		<div style="overflow-y: scroll; max-height: 200px" id="tablePymnt"></div>
    	<g:formRemote name="subForm" url="[controller:'payment', action:'addPayment']" class="ui form">
    		<div class="inline fields" style="margin-top:14px">
    			<div class="eleven wide field">
    				<h4 style="text-align:right; margin-left:auto; margin-right:0;">Balance: </h4>
    			</div>
    			<div class="five wide field">
	    			<h3 style="text-align:right; margin-left:auto; margin-right:30px; color:red;" id="totalpymnt"></h3>
	    		</div>
	    	</div>
	    	<div class="ui divider"></div>
  			<div class="ui error message"></div> 
  			<div id="errr" class="ui warning message">
			  	<div class="content">
			  		<p>Overpayment is not allowed.</p>
			  	</div>
			</div>		
			<div class="inline fields">
		    	<div class="twelve wide field">
		      		<g:textField name="pmAmount"/>
		    	</div>
		    	<g:hiddenField name="pmAccount_id"/>
		    	<div class="four wide field">
		    		<button data-content="Overpayment is not allowed." class="ui labeled icon button teal pop" onclick="pymntAdded()"><i class="dollar basic icon"></i>Add Payment</button>
		    	</div>
			</div>
    	</g:formRemote>
  	</div>
	<div class="actions">
		<div onClick="confirmPay()" class="ui right labeled icon approve button"><i class="checkmark icon"></i>Done</div>
	</div>
</div>

<div id="confirm" class="ui small test modal transition"
	style="margin-top: -92.5px;">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal sign out icon"
			style="margin-right: 10px;"></i>Account Fully Paid</div>
	<div class="content">
		<h5 style="margin-top:-10px">The account has been fully paid. After closing this message, it will automatically be removed from the list of pending accounts.</h5>
	</div>
	<div class="actions">
		<div onClick="loadPayment()" class="ui labeled positive icon button"><i class="checkmark icon"></i>OK</div>
	</div>
</div>