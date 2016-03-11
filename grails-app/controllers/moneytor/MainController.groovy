package moneytor

class MainController {
	def userService
	def accountService
	def transactorService
	def paymentService
	
	def index(){
		render(template: '../index')
	}
	def auth(){
		if(!session.user){
		    redirect(uri: request.getHeader('referer') )
			return false
		}
	}
	def login() {
		def user = userService.login(params.username, params.password.encodeAsPassword())
		if(user || session.user){
			if(session.user==null){
				session.user=user
			}
			redirect(action:"main")
		}else{
			flash.error ="The username and password you entered did not match our records. Please double-check and try again."
			redirect (uri: "/")
		}
	}
	def logout() {
		if(session.user){
			session.user=null
			session.invalidate()
		    redirect(uri: "/")
		}
	}
	def checkUsername(){
		if(session.user){
		def available
		if(userService.checkUsername(params.eusername)) {
		   available = false
		} else {
		   available = true
		}
		response.contentType = "application/json"
		render """{"available":${available}}"""
		}
	}
	def main(){
		if(session.user){
			def payableList = accountService.getPayableList()
			def receivableList = accountService.getReceivableList()
			def transactorList = transactorService.getTransactorList()
			def supplierList = transactorService.getSupplierList()
			def customerList = transactorService.getCustomerList()
			def paymentList = paymentService.getPaymentList()
			
			
			[user: session.user, payableList: payableList, receivableList: receivableList,transactorList: transactorList, supplierList: supplierList, customerList: customerList,paymentList:paymentList]

			
		}else{
		    redirect(uri: "/")
			return false
		}
	}
	
	def addTransactor(){
		if(session.user){
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
		}else{
			redirect(uri: "/")
			return false
		}	
	}

	
}
