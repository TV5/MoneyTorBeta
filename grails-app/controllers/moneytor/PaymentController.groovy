package moneytor

class PaymentController {

    def paymentService
	def accountService
	
	def getPaymentList() {
		def paymentList = paymentService.getPaymentList() 
		return paymentList
	}
	
	def addPayment() {
		def total
		def payment = new Payment(
			account: params.pmAccount_id,
			amount: params.pmAmount,
			received_date: new Date()
		)
		
		if(payment.amount.toString().isNumber() && params.pmAmount > '0'){			
			paymentService.addPayment(payment)
			total = paymentService.getPayments(params.pmAccount_id)
			accountService.makePaid(params.pmAccount_id, session.user.id, total)
		}		
	}
}
