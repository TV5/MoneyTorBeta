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
			def validationList = transactorService.validate(params.cname,params.caddress,params.ctelephone_no, params.cmobile_no, params.cterms)
			 if(validationList.isEmpty()){
				 System.out.println("EMPTY VALIDATIONS!")
				 def transactor = new Transactor(
					 name: params.cname,
					 address: params.caddress,
					 telephone_no: params.ctelephone_no,
					 mobile_no: params.cmobile_no,
					 terms: convertTerms(params.cterms, params.cselect),
					 type: params.ctype,
					 status: params.cstatus
					 )
				 transactorService.addTransactor(transactor)
				 System.out.println(params.cselect)
				 System.out.println("added!")
				 render ""
			 }else{
			validationList.each{ render '<li>'+it+'</li>' }
		}
	}
	
	def addSupplier() {
		System.out.println("add supplier")
		System.out.println("hehe")
		System.out.println("hgfhg"+params.suname)
		def validationsList = transactorService.validate(params.sname, params.saddress, params.stelephone_no, params.smobile_no, params.sterms)
		System.out.println(validationsList)
		if(validationsList.isEmpty()){
			System.out.println("empty");
			System.out.println("asdas")
				def transactor = new Transactor(
					name: params.sname,
					address: params.saddress,
					telephone_no: params.stelephone_no,
					mobile_no: params.smobile_no,
					terms: convertTerms(params.sterms, params.sselect),
					type: params.stype,
					status: params.sstatus
					)
				transactorService.addTransactor(transactor)
				System.out.println(params.sselect)
				System.out.println("added!")
				render ""
		}else{
		System.out.println("errors")
		validationsList.each{ render '<li>'+it+'</li>' }
	}

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
	
	def editSupplier() {
		def validationsList = transactorService.validate(params.esname, params.esaddress, params.estelephone_no, params.esmobile_no, params.esterms)
		System.out.println(validationsList)
		if(validationsList.isEmpty()){
		def transactor = new Transactor(
				name: params.esname,
				address: params.esaddress,
				telephone_no: params.estelephone_no,
				mobile_no: params.esmobile_no,
				terms: convertTerms(params.esterms, params.esselect),
				type: params.estype,
				status: params.esstatus
				)
		transactorService.editTransactor(params.int('esid'), transactor)
		render "Transactor information has been saved."
		}else{
		System.out.println("errors")
		validationsList.each{ render '<li>'+it+'</li>' }
	}

}
	
	def editCustomer() {
		System.out.println("jasfkas");
		def validationsList = transactorService.validate(params.ecname, params.ecaddress, params.ectelephone_no, params.ecmobile_no, params.ecterms)
		System.out.println(validationsList)
		if(validationsList.isEmpty()){
		def transactor = new Transactor(
				name: params.ecname,
				address: params.ecaddress,
				telephone_no: params.ectelephone_no,
				mobile_no: params.ecmobile_no,
				terms: convertTerms(params.ecterms, params.ecselect),
				type: params.ectype,
				status: params.ecstatus
				)
		transactorService.editTransactor(params.int('ecid'), transactor)
		render "Transactor information has been saved."
		}else{
		System.out.println("errors")
		validationsList.each{ render '<li>'+it+'</li>' }
	}
	}
	def convertTerms(String num, String terms ){
		int value = num.toInteger()
		if(terms == 'w'){
			return value * 7
		}else if(terms == 'm'){
			return value * 30
		}else if(terms == 'y'){
			return value * 365
		}else
			return value
	}
	
	def done(){
		redirect(action: "main", controller: "main", params:[tab:"customersTabLink"])
	}

	
	
}
