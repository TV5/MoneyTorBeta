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

	def listAllAdmin(){
		def alladminList=userService.listAllAdmin()
		return alladminList
	}

	def validations(){
		def validationList =[]
		def username
		def fname
		def lname
		if(params.ef_name!=null){
			fname=params.ef_name
			lname=params.el_name
		}else if(params.af_name!=null){
			fname=params.af_name
			lname=params.al_name
		}else if(params.adminF_name!=null){
			fname=params.adminF_name
			lname=params.adminL_name
		}else if(params.empF_name!=null){
			fname=params.empF_name
			lname=params.empL_name
		}
		if(fname ==""){
			validationList.add("First name is required.")
		}else if(!fname.matches("[A-Za-z ]+")){
			validationList.add("Only letters are allowed for first name.")
		}
		if(lname ==""){
			validationList.add("Last name is required.")
		}else if(!lname.matches("[A-Za-z ]+")){
			validationList.add("Only letters are allowed for last name.")
		}
		
		if(params.eusername!=null){
			username=params.eusername
		}else if(params.ausername!=null){
			username=params.ausername
		}else if(params.adminUsername!=null){
			username=params.adminUsername
		}else if(params.empUsername!=null){
			username=params.empUsername
		}
		if(username==""){
			validationList.add("Username is required.")
		}else{		
			if(username.length()>7){
				if(!username.matches("[A-Za-z0-9_]+")){
					validationList.add("Username can only contain alphanumeric characters and underscore(_).")
				}
			}else{
				validationList.add("Username must be at least 8 characters.")
			}
		}
		def pass=true, lpass=true, empty=false
		if(params.epassword!=null){
			if(params.epassword.length()<8){
				lpass=false

			}else if(params.epassword == ""){
				empty=true
			}
			if(params.epassword!=params.ecpassword){
				pass=false
			}
		}else if(params.apassword!=null){
			pass=true
			if(params.apassword.length()<8){
				lpass=false
			}else if(params.apassword == ""){
				empty=true
			}
			if(params.apassword!=params.acpassword){
				pass=false
			}
		}else if(params.adminPassword!=null){
			pass=true
			if(params.adminPassword.length()<8){
				lpass=false
			}else if(params.epassword == ""){
				empty=true
			}
			if(params.adminPassword!=params.adminCpassword){
				pass=false
			}
		}else if(params.empPassword!=null){
			pass=true
			if(params.empPassword.length()<8){
				lpass=false
			}else if(params.epassword == ""){
				empty=true
			}
			if(params.empPassword!=params.empCpassword){
				pass=false
			}

		}
		if(empty == true){
			System.out.println("empty")
			validationList.add("Password is required.")
		}else{
			if(lpass==false){
				validationList.add("Password must be at least 8 characters.")
			}
			if(pass==false){
				validationList.add("Password and Confirm Password must match.")
			}
		}
		return validationList
	}
	def addEmployee() {
		def validationList = validations()
		if(validationList.isEmpty()){
			def username = checkUsername()
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
				render "Username unavailable."
			}
		}else{
			validationList.each{ render '<li>'+it+'</li>' }
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
		def validationList = validations()
		if(validationList.isEmpty()){
			def username = checkUsername();
			if(username == "available"){
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
						render "User has been saved."
					}
				}
			}else{
				render "Username unavailable."
			}
		}else{
			validationList.each{ render '<li>'+it+'</li>' }
		}
	}

	def editEmployee(){
		def validationList = validations()
		if(validationList.isEmpty()){
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
		}else{
			validationList.each{ render '<li>'+it+'</li>' }
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
		def validationList = validations()
		if(validationList.isEmpty()){
			if(params.adminCpassword==params.adminPassword){
				def user =new User(
						f_name:params.adminF_name,
						l_name:params.adminL_name,
						username:params.adminUsername,
						password:params.adminPassword,
						updated_on:new Date(),
						updated_by:session.user.id
						)
				user.id=params.int('adminId')
				if(user!=null){
					def ret = userService.editUser(user.id, user)
					render ret
				}
			}
		}else{
			validationList.each{ render '<li>'+it+'</li>' }
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

		render "deactivated"
	}

	def users(){
		if(session.user){
			def empList=listEmployees()
			def adminList=listAdmins()
			def allAdminList = listAllAdmin()
			[user:session.user, empList:empList, adminList:adminList, allAdminList:allAdminList]
		}
	}
}
