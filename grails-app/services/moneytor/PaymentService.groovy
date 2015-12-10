package moneytor

import grails.transaction.Transactional

@Transactional
class PaymentService {

    def getPaymentList(acct_id) {
		return Payment.findAllByAccount(acct_id)
	}
	
	def addPayment(payment){
		payment.save()
	}
}
