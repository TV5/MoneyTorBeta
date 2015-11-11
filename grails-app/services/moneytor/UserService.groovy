package moneytor

import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }
	def addUser(user){
		def userCheck = checkUsername(user.username)
		if(userCheck){
			return "username already in use"
		}else{
		user.save()
		}
	}
	def checkUsername(username){
		def userCheck = User.findByUsername(username)
		return userCheck
	}
	def editUser(userId, user){

		def userCheck = checkUsername(user.username)
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
			return "username already exists"
		}
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
}
