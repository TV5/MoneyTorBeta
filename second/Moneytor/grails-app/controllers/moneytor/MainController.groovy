package moneytor

class MainController {
	def userService
    def index() { }
	
	def login() {
		def user = userService.login(params.username, params.password)
		if(user){
			
			redirect (uri: "/main/main")
		}else{
			redirect (uri: "/")
		}
	}
	
	def main() {

	}
}
