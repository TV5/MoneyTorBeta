package moneytor

class UserController {
	def userService
    def index() { 
		
	}
	def listEmployees(){
		def empList=userService.listEmployees()	
		return empList
	}	
	def listAdmins(){
		def adminList=userService.listAdmins()
		return adminList
	}
	def addEmployee() {
		if(params.ecpassword==params.epassword){
			def user =new User()
			user.f_name=params.ef_name
			user.l_name=params.el_name
			user.username=params.eusername
			user.password=params.epassword
			user.type=params.etype
			user.status=1
			userService.addUser(user)
			
			redirect(action: "users", params: [username:params.userUsername, userId:params.userId])
		}
	}
	def addAdmin() {
		if(params.acpassword==params.apassword){
			def user =new User()
			user.f_name=params.af_name
			user.l_name=params.al_name
			user.username=params.ausername
			user.password=params.apassword
			user.type=params.atype
			user.status=1
			userService.addUser(user)
			
			redirect(action: "users", params: [username:params.userUsername, userId:params.userId])
		}
	}
	def users(){
		def username=params.username
		def userId=params.userId
		def empList=listEmployees()
		def adminList=listAdmins()
		[user:[username:username, id:userId], empList:empList, adminList:adminList]
		
	}
}
