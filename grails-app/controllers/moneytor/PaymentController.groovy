package moneytor

class PaymentController {

    def paymentService
	
	def getPaymentList() {
		def paymentList = paymentService.getPaymentList() 
		return paymentList
	}
	
	def addPayment() {
		def payment = new Payment(
			account: params.pmAccount_id,
			amount: params.pmAmount,
			received_date: new Date()
		)
		if(params.pmAmount > '0'){
			paymentService.addPayment(payment)
		}		
	}
}
