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
		}
		user.save()
		
	}
	def login(username, password) {
		def user = User.findByUsernameAndPassword(username, password)
		return user
		
	}
	def listEmployees(){
		def empList =User.findAllWhere(status:1, type:"e")
		return empList
	}
	
	def listAdmins(){
		def adminList = User.findAllWhere(status:1, type: "a")
		return adminList
	}
}
