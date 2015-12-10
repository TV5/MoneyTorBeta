package moneytor

import grails.transaction.Transactional

@Transactional
class PaymentService {

    def getPaymentList() {
		return Payment.getAll()
	}
	
	def addPayment(payment){
		payment.save()
	}
}
