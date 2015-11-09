package moneytor

class UserController {
	def userService
    def index() { 
		
	}
	def listEmployees(){
		def list=userService.listEmployees()	
	}	
	def listAmins(){
		def list=userService.listAdmins()
	}
	def addUser() {
		def user = new User(params)
	}
	
	def users(){
		
	}
}
