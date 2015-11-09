package moneytor

import grails.transaction.Transactional

@Transactional
class UserService {

    def serviceMethod() {

    }
	def addUser(user){
		def userCheck = User.findByUsername(user.username)
		if(userCheck){
			return "username already in use"
		}else{
		user.save()
		}
	}
	def login(username, password) {
		def user = User.findByUsernameAndPassword(username, password)
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
