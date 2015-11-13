package moneytor

class MainController {
	def userService
	def accountService
	AccountController accountController = new AccountController()
	
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
			def payableList = accountController.getPayableList()
			def receivableList = accountController.getReceivableList()
			[user:session.user,payableList:payableList,receivableList:receivableList]
			
		}else{
			redirect(uri: "/")
			return false
		}
		

	}

	
}
