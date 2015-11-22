package moneytor

class TransactorController {

	def transactorService
    def index() { 
		def tList = getTransactorList()
		[transactorList:tList]
		
	}
	
	def addTransactor() {
		System.out.println("add transactor")
		System.out.println("hehe")
		def transactor = new Transactor(
			name: params.name,
			address: params.address,
			telephone_no: params.telephone_no,
			mobile_no: params.mobile_no,
			terms: params.terms,
			type: params.type
			)
		transactorService.addTransactor(transactor)
		System.out.println("added!")
			
	}
	
	def addCustomer() {
		System.out.println("add customer")
		System.out.println("hehe")
		def calculatedTerms
		//if(params.cterms == )
		
		def transactor = new Transactor(
			name: params.cname,
			address: params.caddress,
			telephone_no: params.ctelephone_no,
			mobile_no: params.cmobile_no,
			terms: convertTerms(),
			type: params.ctype,
			status: params.cstatus
			)
		transactorService.addTransactor(transactor)
		System.out.println(params.cselect)
		System.out.println("added!")
			
	}
	
	def convertTerms(){
		int value = params.cterms.toInteger()
		if(params.cselect == 'w'){
			return value * 7
		}else if(params.cselect == 'm'){
			return value * 30
		}else if(params.cselect == 'y'){
			return value * 365
		}else
			return value
	}
	
	def getTransactorList() {
		def transactorList = transactorService.getTransactorList()
		return transactorList
	}
	
}
