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
		def transactor = Transactor.findByNameAndStatusAndType(name, "A", type)
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
	
	def validate(name, address, telephone_no,mobile_no,terms){
		System.out.println("Validating..")
		def validationList =[]
		if(name==""){
			validationList.add("Name is required.")
		}
		if(address==""){
			validationList.add("Address is required.")
		}
		if(telephone_no==""){
			validationList.add("Telephone Number name is required.")
		}
		if(mobile_no==""){
			validationList.add("Mobile Number is required.")
		}
		if(terms==""){
			validationList.add("Terms is required.")
		}
		if(telephone_no.matches("[0-9]+")){
			validationList.add("Telephone Number must only contain numeric characters")
		}
		if(mobile_no.matches("[0-9]+")){
			validationList.add("Mobile Number must only contain numeric characters")
		}
		if(terms.matches("[0-9]+")){
			validationList.add("Terms must only contain numeric character/s")
		}
		return validationList
	}

}
