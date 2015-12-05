package moneytor

class MainController {
	//def beforeInterceptor = [action:this.&auth]
	def userService
	def accountService
	def transactorService
	
	def index(){}
	def auth(){
		if(!session.user){
			redirect(uri: "/")
			return false
		}
	}
	def login() {
		def user = userService.login(params.username, params.password)
		if(user){
			session.user=user
			redirect(action:"main")
		}else{
			flash.error ="invalid username/password"
			redirect (uri: "/")
		}
	}
	def logout() {
		if(session.user){
			session.user = null
			redirect(uri:"/")
		}
	}
	def checkUsername(){
		def available
		if(userService.checkUsername(params.eusername)) {
		   available = false
		} else {
		   available = true
		}
		response.contentType = "application/json"
		render """{"available":${available}}"""
	}
	def main(){
		if(session.user){
			def payableList = accountService.getPayableList()
			def receivableList = accountService.getReceivableList()
			def transactorList = transactorService.getTransactorList()
			def supplierList = transactorService.getSupplierList()
			def customerList = transactorService.getCustomerList()
			def saveName = transactorService.saveName("Save")
			[user: session.user, payableList: payableList, receivableList: receivableList, 
				transactorList: transactorList, supplierList: supplierList, customerList: customerList,saveName: saveName]
			
		}else{
			redirect(uri: "/")
			return false
		}
	}
	
	def receivables(){
		if(session.user){
			def receivableList = accountService.getReceivableList()
			def customerList = transactorService.getCustomerList()
			def saveName = transactorService.saveName("Save")
			[user: session.user, receivableList: receivableList,
				customerList: customerList,saveName: saveName]
			
		}else{
			redirect(uri: "/")
			return false
		}
	}
	
	def customers() {
		if(session.user){
			def payableList = accountService.getPayableList()
			def receivableList = accountService.getReceivableList()
			def transactorList = transactorService.getTransactorList()
			def supplierList = transactorService.getSupplierList()
			def customerList = transactorService.getCustomerList()
			def saveName = transactorService.saveName("Save")
			[user: session.user, payableList: payableList, receivableList: receivableList, 
				transactorList: transactorList, supplierList: supplierList, customerList: customerList,saveName: saveName]
			
		}else{
			redirect(uri: "/")
			return false
		}
	}
	
	def suppliers() {
		if(session.user){
			def supplierList = transactorService.getSupplierList()
			def saveName = transactorService.saveName("Save")
			[user: session.user, supplierList: supplierList, saveName: saveName]
			
		}else{
			redirect(uri: "/")
			return false
		}
	}
	
	def addTransactor(){
		def transactor = new Transactor(
			name: params.name,
			address: params.address,
			telephone_no: params.telephone_no,
			mobile_no: params.mobile_no,
			terms: params.terms,
			type: params.type
			)
		transactorService.addTransactor(transactor)
		System.out.println("added2!")
		def saveName = transactorService.saveName("Saved")
		[saveName: saveName]
	}

	
}
