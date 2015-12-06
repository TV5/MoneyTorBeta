package moneytor

import grails.transaction.Transactional

@Transactional
class PaymentService {

    def getPaymentList() {
		return Payment.findAllByAccount('11')
	}
	
	def addPayment(payment){
		payment.save()
	}
}
