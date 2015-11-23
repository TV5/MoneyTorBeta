package moneytor

import grails.transaction.Transactional

@Transactional
class PaymentService {

    def getPaymentList() {
		return Payment.findAllByAccount(99)
	}
	
	def addPayment(payment){
		payment.save()
	}
}
