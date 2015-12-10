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
		def tList = Transactor.findAllByTypeAndStatus("C","A")
		return tList
	}
	 
	def getSupplierList() {
		def supplierList = Transactor.findAllByType("S")
		return supplierList
	}
	
	def getCustomerList() {
		def customerList = Transactor.findAllByType("C")
		return customerList
	}
	
	def saveName(text){
		return text
	}
	
	def getTransactorIDByName(name, type){
		def transactor = Transactor.findAllByNameAndStatusAndType(name, "A", type)
		return transactor.id
	}
}
