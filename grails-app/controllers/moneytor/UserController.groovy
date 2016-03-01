package moneytor

class UserController {
	def beforeInterceptor = [action:this.&auth, except: 'index']
	def scaffold=true
	def userService
	def index() {
		render(template: '../index')
	}
	private auth(){
		if(!session.user){
		    redirect(uri: request.getHeader('referer') )
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
		def usrn
		def usrnid
		if(params.uF_name!=null){
			if(params.uF_name ==""){
				validationList.add("First Name must not be blank.")
			}else if(!params.uF_name.matches("[A-Za-z ]+")){
				validationList.add("First Name must only contain letters.")
			}
			if(params.uL_name ==""){
				validationList.add("Last Name must not be blank.")
			}else if(!params.uL_name.matches("[A-Za-z ]+")){
				validationList.add("Last Name must only contain letters.")
			}
			
			if(session.user.password==params.uCurrPass.encodeAsPassword()){
				if(params.uCurrPass==params.uNewPass){
					validationList.add("New password matches your old password. Please input a new one.")
				}
			}else{
				validationList.add("Please input your current password correctly.")
			}
			if(params.uNewPass == ""){
				validationList.add("Please input your new password.")
			}else if(params.uNewPass.length()<8){
				validationList.add("New password must be at least 8 characters.")
			}
			if(params.uNewPass!=params.uCNewPass){
				validationList.add("Please confirm your new password.")
			}
		}else{
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
				usrnid = params.int('adminId')
			}else if(params.empUsername!=null){
				username=params.empUsername
				usrnid = params.int('empId')
			}
			if(username==""){
				validationList.add("Username is required.")
			}else{		
				if(username.length()>7){
					if(!username.matches("[A-Za-z0-9_]+")){
						validationList.add("Username can only contain alphanumeric characters and underscore(_).")
					}
					usrn=checkUsername();
					if(usrn!="available"){
						if(userService.getUsername(usrnid)!=username){
							validationList.add("Username unavailable.")
						}
					}
	
				}else{
					validationList.add("Username must be at least 8 characters.")
				}
			}
			def pass=true, lpass=true, empty=false
			if(params.epassword!=null){
				if(params.epassword == ""){
					empty=true
				}else if(params.epassword.length()<8){
					lpass=false
	
				}
				if(params.epassword!=params.ecpassword){
					pass=false
				}
			}else if(params.apassword!=null){
				pass=true
				if(params.apassword == ""){
					empty=true
				}else if(params.apassword.length()<8){
					lpass=false
				}
				if(params.apassword!=params.acpassword){
					pass=false
				}
			}else if(params.adminPassword!=null){
				pass=true
				if(params.epassword == ""){
					empty=true
				}else if(params.adminPassword.length()<8){
					lpass=false
				}
				if(params.adminPassword!=params.adminCpassword){
					pass=false
				}
			}else if(params.empPassword!=null){
				pass=true
				if(params.epassword == ""){
					empty=true
	
				}else if(params.empPassword.length()<8){
					lpass=false
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
							password: params.epassword.encodeAsPassword(),
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
							password:params.apassword.encodeAsPassword(),
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
						password:params.empPassword.encodeAsPassword(),
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
		def validationList = validations()
		if(validationList.isEmpty()){

			def user = new User()
			user.id = params.int('uId')
			user.f_name = params.uF_name
			user.l_name = params.uL_name

			user.password = params.uNewPass == "" ? params.uCurrentPass.encodeAsPassword() : params.uNewPass.encodeAsPassword();

			userService.editUserAccount(user.id, user)
			session.user=userService.getUser(user.id)
			render "success"
		}else{
			System.out.println("here")
			validationList.each{ render '<li>'+it+'</li>' }

		}
	}

	def editAdmin(){
		def validationList = validations()
		if(validationList.isEmpty()){
			if(params.adminCpassword==params.adminPassword){
				def user =new User(
						f_name:params.adminF_name,
						l_name:params.adminL_name,
						username:params.adminUsername,
						password:params.adminPassword.encodeAsPassword(),
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
		def u
		if(params.int('empId')){
			user.id = params.int('empId')
			u="emp"
		}
		if(params.int('adminId')){
			user.id = params.int('adminId')
			u="admin"
			System.out.println(user.id)
		}
		user.updated_on=new Date()
		user.updated_by=session.user.id
		userService.changeUserStatus(user.id, user)

		render u
		
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
