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
	

	def days(){
		def list = getTransactorList()
		list.toList()
		def ret =" "
		def str = []
		assert str.size() == 0
		str.toList()
		list.each{
			def days = it.terms
				if(days % 7 == 0)	{
					ret = days/7 + " week(s)"
					
				}else if(days % 30 == 0){
					ret = days/30 + " month(s)"
				}else if(days % 365 == 0){
					ret =  days/365 + " year(s)"
				}else{
				ret = days +" week(s)"
				}
				str.add(ret)
		}
		return str;
	}
	
	

	def getTransactorIDByName(name, type){
		def transactor = Transactor.findByNameAndStatusAndType(name, "A", type)
		System.out.println("ts:" +transactor.id)
		return transactor.id
	}

}
