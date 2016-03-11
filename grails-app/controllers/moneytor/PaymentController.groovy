package moneytor

class PaymentController {

    def paymentService
	def accountService
	
	def getPaymentList() {
		def paymentList = paymentService.getPaymentList() 
		return paymentList
	}
	
	def addPayment() {
		if(session.user){
			def total
			def payment = new Payment(
				account: params.pmAccount_id,
				amount: params.pmAmount,
				received_date: new Date()
			)
			
			if(payment.amount.toString().isNumber() && params.pmAmount > '0'){
				if(params.pmAmount.matches("^\\s*(?=.*[1-9])\\d*(?:\\.\\d{1,2})?\\s*\$")) {
					paymentService.addPayment(payment)
					total = paymentService.getPayments(params.pmAccount_id)
					accountService.makePaid(params.pmAccount_id, session.user.id, total)
				}			
			}
		}		
	}
}
