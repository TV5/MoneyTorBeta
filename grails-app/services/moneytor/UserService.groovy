package moneytor

import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }
	def checkUser(username){
		def userCheck = User.findByUsername(username)
		def ret="available"
		if(userCheck){
			ret= "unavailable"
		}
		return ret
	}
	def getUsername(userid){
		def user =User.findById(userid)
		return user.username
	}
	def getPassword(userid){
		def user =User.findById(userid)
		return user.password
	}
	def addUser(user){
		def userCheck = User.findByUsername(user.username)
		if(userCheck){
			return "username already in use"
		}else{
		user.save()
		}
	}
	def addMoreUser(user){
		def ret
		def userCheck = User.findByUsernameAndPassword(user.username, user.password)
		System.out.println (userCheck)
		if(userCheck){
			ret = "true"
			System.out.println("true");
		}else{
			ret = "false"
			System.out.println("false");
		}
		return ret
	}
	def editUser(userId, user){
		def ret = "User information has been saved."
		def userCheck = User.findByUsername(user.username)
		if(userCheck==null || userCheck.id==user.id){
			def updateUser = User.get(userId)
			updateUser.username=user.username
			updateUser.f_name=user.f_name
			updateUser.l_name=user.l_name
			updateUser.password=user.password
			updateUser.updated_by=user.updated_by
			updateUser.updated_on=user.updated_on
			updateUser.save()

		}else{
			ret = "Username is already in use."
		}
		return ret
	}
	
	def editUserAccount(userId, user){
		def updateUser = User.get(userId)
		updateUser.f_name=user.f_name
		updateUser.l_name=user.l_name
		updateUser.password=user.password

		updateUser.save()
	}
	
	def changeUserStatus(userId, user){
		def updateUser = User.get(userId)
		if(updateUser.status==1){
			updateUser.status=0	
		}else{
			updateUser.status=1
		}
		updateUser.updated_by=user.updated_by
		updateUser.updated_on=user.updated_on
		updateUser.save()	

	}

	def login(username, password) {
		def user = User.findByUsernameAndPasswordAndStatus(username, password, 1)
		return user
		
	}
	def listEmployees(){
		def empList =User.findAllByStatusAndType(1, "E")
		return empList
	}
	
	def listAdmins(){
		def adminList = User.findAllByStatusAndType(1, "A")
		return adminList
	}
	
	def listAllAdmin(){
		def allAdminList = User.findAllByType("A")
		return allAdminList
	}
	def getUser(userId){
		def user = User.get(userId)
		return user
	}
}
