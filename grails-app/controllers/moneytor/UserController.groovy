package moneytor

class UserController {
	def beforeInterceptor = [action:this.&auth]
	def scaffold=true
	def userService
    def index() { 
		
	}
	def auth(){
		if(!session.user){
			redirect(uri: "/")
			return false
		}
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
			def user =new User(
					f_name: params.ef_name,
					l_name: params.el_name,
					username: params.eusername,
					password: params.epassword,
					type: params.etype,
					status: 1,
					updated_on: new Date(),
					updated_by: params.int('userId')
				)
			userService.addUser(user)
			
			redirect(action: "users")
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
			user.updated_on=new Date() 
			user.updated_by=params.int('userId')
			userService.addUser(user)
			
			redirect(action: "users")
		}
	}
	
	def editEmployee(){
		if(params.empCpassword==params.empPassword){
			def user =new User()
			user.id = params.int('empId');
			user.f_name=params.empF_name
			user.l_name=params.empL_name
			user.username=params.empUsername
			user.password=params.empPassword
			user.updated_on=new Date()
			user.updated_by=params.int('userId')
			userService.editUser(user.id, user)
			
			redirect(action: "users")
		}

	}
	
	def editUserAccount(){
			def user =new User()
			user.id = params.int('uId')
			user.f_name=params.uF_name
			user.l_name=params.uL_name
			user.password=params.uNewPass
			userService.editUserAccount(user.id, user)
			
			redirect(action: "main")
	}
	
	def editAdmin(){
		if(params.adminCpassword==params.adminPassword){
			def user =new User()
			user.id = params.int('adminId');
			user.f_name=params.adminF_name
			user.l_name=params.adminL_name
			user.username=params.adminUsername
			user.password=params.adminPassword
			user.updated_on=new Date()
			user.updated_by=params.int('userId')
			userService.editUser(user.id, user)
			
			redirect(action: "users")
		}

	}

	def changeStatus(){
		def user =new User()
		if(params.int('empId')){
			user.id = params.int('empId');
		}else{
			user.id = params.int('adminId');
		}
		user.updated_on=new Date()
		user.updated_by=session.user.id
		userService.changeUserStatus(user.id, user)
			
		redirect(action: "users")
		

	}

	def users(){
		def empList=listEmployees()
		def adminList=listAdmins()

		[user:session.user, empList:empList, adminList:adminList]
		
	}
}
