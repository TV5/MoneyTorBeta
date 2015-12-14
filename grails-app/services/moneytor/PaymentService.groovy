package moneytor

import grails.converters.*
import grails.transaction.Transactional

@Transactional
class PaymentService {

    def getPaymentList() {
		return Payment.getAll() as JSON
	}
	
	def addPayment(payment){
		payment.save()
	}
}
