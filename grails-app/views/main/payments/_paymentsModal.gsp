<div id="payments" class="ui modal small" style="padding-top:-50px!important;">
	<div class="header" style="padding-top: 16px; padding-bottom: 13px;">
		<i class="circular teal dollar icon"
			style="margin-right: 10px;"></i>Payment History
		<h2 id="pmAccountName" class="ui left pointing teal basic label" style="margin-left:10px;"></h2>
	</div>
  	<div class="content" id="paymentsss" style="padding-top:10px;padding-bottom:0px;">	  
  		<div id="yeah" hidden>${paymentList}</div>
		<div id="tablePymnt"></div>
    	<g:formRemote name="subForm" url="[controller:'payment', action:'addPayment']" class="ui form">
    		<div class="inline fields" style="margin-top:14px">
    			<div class="eleven wide field">
    				<h4 style="text-align:right; margin-left:auto; margin-right:0;">Balance: </h4>
    			</div>
    			<div class="five wide field">
	    			<h3 style="text-align:right; margin-left:auto; margin-right:30px;" id="totalpymnt"></h3>
	    		</div>
	    	</div>
	    	<div class="ui divider"></div>
  			<div class="ui error message"></div> 		
			<div class="inline fields">
		    	<div class="twelve wide field">
		      		<g:textField name="pmAmount"/>
		    	</div>
		    	<g:hiddenField name="pmAccount_id"/>
		    	<div class="four wide field">
		    		<button class="ui labeled icon button teal" onclick="pymntAdded()"><i class="dollar basic icon"></i>Add Payment</button>
		    	</div>
			</div>
    	</g:formRemote>
  	</div>
	<div class="actions">
		<div id="pymntDone" onClick="loadPayment()" class="ui right labeled icon approve button"><i class="checkmark icon"></i>Done</div>
		<div class="ui right labeled icon cancel button"><i class="cancel basic icon"></i>Cancel</div>
	</div>
</div>