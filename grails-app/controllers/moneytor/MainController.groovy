package moneytor

class MainController {
	def userService
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
	def main(){
		if(session.user){
			[user:session.user]
		}else{
			redirect(uri: "/")
			return false
		}

	}

	
}
