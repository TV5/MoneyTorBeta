package moneytor

class TransactorController {

	def transactorService
    def index() { 
		def tList = getTransactorList()
		[transactorList:tList]
	}
	def addTransactor() {
		System.out.println("add transactor")
		def transactor = new Transactor(
			name: params.name,
			address: params.address,
			telephone_no: params.telephone_no,
			mobile_no: params.mobile_no,
			terms: params.terms,
			type: params.type
			)
		transactorService.addTransactor(transactor)
		
		
	}
	def getTransactorList() {
		def transactorList = transactorService.getTransactorList()
		return transactorList
	}
	
}