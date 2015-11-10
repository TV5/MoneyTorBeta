package moneytor

class MainController {
	def userService
    def index() { }
	
	def login() {
		def user = userService.login(params.username, params.password)
		if(user){
			redirect(action:"main", params:[userId:user.id, username: user.username])
		}else{
			redirect (uri: "/")
		}
	}
	
	def main(){
		def username=params.username
		def userId=params.userId
		[user:[username:username, id:userId]]
	}
	
}
