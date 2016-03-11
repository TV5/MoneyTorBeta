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
	
	def getTransactorByName(name) {
		return Transactor.findByName(name)
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
	
	def validate(name, address, telephone_no,mobile_no,terms, transactor_type){
		System.out.println("Validating..")
		def validationList =[]
		if(name==null||name==""||name.matches("^\\s+")){
			validationList.add("Name is required.")
		}
		if(address==null||address==""||address.matches("^\\s+")){
			validationList.add("Address is required.")
		}
		
		if(telephone_no==null||telephone_no==""){
			validationList.add("Telephone Number name is required.")
		}else if(!telephone_no.matches("[0-9]+")){
			validationList.add("Telephone Number must only contain numeric characters")
		}else if(!telephone_no.matches("^.{1,15}")){
			validationList.add("Telephone Number exceeds character limit")
		}

		if(mobile_no==null||mobile_no==""){
			validationList.add("Mobile Number is required.")
		}else if(!mobile_no.matches("[0-9]+")){
			validationList.add("Mobile Number must only contain numeric characters")
		}else if(!mobile_no.matches("^.{1,15}")){
			validationList.add("Mobile Number exceeds character limit")
		}
		
		
		if(terms.matches("[0]+")){
			validationList.add("Terms must be greater than or equal to 1")
		}
		if(terms.matches("\\d\\.\\d{1,3}")){
		validationList.add("Terms must only be in whole number")
		}else if(!terms.matches("[0-9]+")){
			validationList.add("Terms must only contain numeric character/s and only one decimal point")
		}else if(terms==null||terms==""){
			validationList.add("Terms is required.")
		}
		
		if (transactor_type == 'S') {
			if (getTransactorByName(name) != null) {
				validationList.add("Supplier name is already taken.");
			}
		}
		
		return validationList
	}

}
