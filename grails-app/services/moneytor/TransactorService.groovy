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
	
	
	def getTransactorIDByName(name, type){
		def transactor = Transactor.findAllByNameAndStatusAndType(name, "A", type)
		return transactor.id
	}
	
	def editTransactor(id, Transactor transactor) {
		Transactor newTransactor = Transactor.get(id)
		newTransactor.name = transactor.name
		newTransactor.address = transactor.address
		newTransactor.telephone_no = transactor.telephone_no
		newTransactor.mobile_no = transactor.mobile_no
		newTransactor.terms = transactor.terms 
		newTransactor.type = transactor.type
		newTransactor.status = transactor.status
		newTransactor.save()
	}

}
