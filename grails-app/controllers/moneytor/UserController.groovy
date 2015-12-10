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
	
	def checkUsername(){
		def username
		def user
		if(params.eusername!=null){
			username=params.eusername
		}else if(params.ausername!=null){
			username=params.ausername
		}else if(params.adminUsername!=null){
			username=params.adminUsername
		}else if(params.empUsername){
			username=params.empUsername
		}
		user = userService.checkUser(username)
		return user
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
		def username = checkUsername();
		if(username == "available"){
		if(params.ecpassword==params.epassword){
			def user =new User(
					f_name: params.ef_name,
					l_name: params.el_name,
					username: params.eusername,
					password: params.epassword,
					type: params.etype,
					status: 1,
					updated_on: new Date(),
					updated_by: session.user.id
				)
			if(user!=null){
				userService.addUser(user)
				render "User has been saved."
			}
		}
		}else{
			render "username unavailable"
		}
	}
	def addMoreEmployee() {
		def ret
		if(params.ecpassword==params.epassword){
			def user =new User(
					f_name: params.ef_name,
					l_name: params.el_name,
					username: params.eusername,
					password: params.epassword,
					type: params.etype,
					status: 1,
					updated_on: new Date(),
					updated_by: session.user.id
				)
			if(user!=null){
				ret = userService.addMoreUser(user)
				render ret
			}
		}
	}
	def addAdmin() {
		if(params.acpassword==params.apassword){
			def user =new User(
			f_name:params.af_name,
			l_name:params.al_name,
			username:params.ausername,
			password:params.apassword,
			type:params.atype,
			status:1,
			updated_on:new Date(),
			updated_by:session.user.id
		)
		if(user!=null){
				userService.addUser(user)
			}
		}
	}
	
	def editEmployee(){
			if(params.empCpassword==params.empPassword){
				def user =new User(
				f_name:params.empF_name,
				l_name:params.empL_name,
				username:params.empUsername,
				password:params.empPassword,
				updated_on:new Date(),
				updated_by:session.user.id
			)
			user.id=params.int('empId')
			if(user!=null){
				def ret = userService.editUser(user.id, user)
				render ret
			}
		}

	}
	
	def editUserAccount(){
			def user = new User()
			user.id = params.int('uId')
			user.f_name = params.uF_name
			user.l_name = params.uL_name
			
			user.password = params.uNewPass == "" ? params.uCurrentPass : params.uNewPass;
			
			userService.editUserAccount(user.id, user)
			session.user=userService.getUser(user.id)
			
			redirect(uri: request.getHeader('referer'))
	}
	
	def editAdmin(){
		if(params.adminCpassword==params.adminPassword){
			def user =new User(
			f_name:params.adminF_name,
			l_name:params.adminL_name,
			username:params.adminUsername,
			password:params.adminPassword,
			updated_on:new Date(),
			updated_by:session.user.id
			)
			user.id = params.int('adminId')
			userService.editUser(user.id, user)
		}

	}

	def changeStatus(){
		def user =new User()
		if(params.int('empId')){
			user.id = params.int('empId')
		}else{
			user.id = params.int('adminId')
		}
		user.updated_on=new Date()
		user.updated_by=session.user.id
		userService.changeUserStatus(user.id, user)
			
		redirect(action: "users")
		

	}

	def users(){
		if(session.user){
		def empList=listEmployees()
		def adminList=listAdmins()

		[user:session.user, empList:empList, adminList:adminList]
		}
	}
}
