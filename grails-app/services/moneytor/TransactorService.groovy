package moneytor

import grails.transaction.Transactional

@Transactional
class TransactorService {

    def serviceMethod() {

    }
	def addTransactor(transactor) {
		transactor.save()
	}
	
	def getTransactorList() {
		def tList = Transactor.findAllByType("C")
		return tList
	}
	
	def getSupplierList() {
		def supplierList = Transactor.findAllByType("S")
		return supplierList
	}
}
