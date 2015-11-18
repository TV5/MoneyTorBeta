package moneytor

class MainController {
	def userService
	def accountService
	def transactorService
	
	def index(){}
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
			[user: session.user, payableList: payableList, receivableList: receivableList, 
				transactorList: transactorList, supplierList: supplierList]
			
		}else{
			redirect(uri: "/")
			return false
		}
	}

	
}
