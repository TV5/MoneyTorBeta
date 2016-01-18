package moneytor

import grails.converters.*
import grails.transaction.Transactional

@Transactional
class PaymentService {

    def getPaymentList() {
		return Payment.getAll() as JSON
	}
	
	def addPayment(payment){
		def pymnt = Payment.findAllByAccount(payment.account)
		Account acct = Account.get(payment.account)
		if((pymnt.isEmpty() && payment.amount <= acct.amount))
			payment.save()
		else if (pymnt.isEmpty() == false && (pymnt.amount.sum() + payment.amount) <= acct.amount)
			payment.save()
	}
	
	def getPayments(id){
		def tots = Payment.findAllByAccount(id)
		return tots.amount.sum()
	}
}
