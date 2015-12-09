package moneytor

class PaymentController {

    def paymentService
	
	def getPaymentList() {
		def paymentList = paymentService.getPaymentList(params.acct_id) 
		return paymentList
	}
	
	def addPayment() {
		def payment = new Payment(
			account: params.pmAccount_id,
			amount: params.pmAmount,
			received_date: new Date()
		)
		paymentService.addPayment(payment)
	}
}
