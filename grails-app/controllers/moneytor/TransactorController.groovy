package moneytor

class TransactorController {

	def transactorService
    def index() { 
		def tList = getTransactorList()
		def sList = getSupplierList()
		def cList = getCustomerList()
		[transactorList:tList, supplierList: sList, customerList: cList]
		
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
			
			def transactor = new Transactor(
				name: params.cname,
				address: params.caddress,
				telephone_no: params.ctelephone_no,
				mobile_no: params.cmobile_no,
				terms: cconvertTerms(),
				type: params.ctype,
				status: params.cstatus
				)
			transactorService.addTransactor(transactor)
			System.out.println(params.cselect)
			System.out.println("added!")
	}
	
	def addSupplier() {
		System.out.println("add supplier")
		System.out.println("hehe")
		
		def transactor = new Transactor(
			name: params.sname,
			address: params.saddress,
			telephone_no: params.stelephone_no,
			mobile_no: params.smobile_no,
			terms: sconvertTerms(),
			type: params.stype,
			status: params.sstatus
			)
		transactorService.addTransactor(transactor)
		System.out.println(params.sselect)
		System.out.println("added!")
}


	def sconvertTerms(){
		int value = params.sterms.toInteger()
		if(params.sselect == 'w'){
			return value * 7
		}else if(params.sselect == 'm'){
			return value * 30
		}else if(params.sselect == 'y'){
			return value * 365
		}else
			return value
	}
	
	def cconvertTerms(){
		int value = params.sterms.toInteger()
		if(params.sselect == 'w'){
			return value * 7
		}else if(params.sselect == 'm'){
			return value * 30
		}else if(params.sselect == 'y'){
			return value * 365
		}else
			return value
	}
	
	def getTransactorList() {
		def transactorList = transactorService.getTransactorList()
		return transactorList
	}
	
	def getSupplierList() {
		def SupplierList = transactorService.getSupplierList()
		return SupplierList
	}
	
	def getCustomerList() {
		def customerList = transactorService.getCustomerList()
		return customerList
	}

	
	
}
