import moneytor.*

class BootStrap {

    def init2 = { servletContext ->
		User user = new User(username:'adminuser', password:'adminuser', f_name:'Admin', l_name:'Admin', status:'1', type:'A')
		if (!user.save()){
			log.error "Could not save user!!"
			log.error "${user.errors}"
		  }	
	}
    def destroy = {
    }
	
	def init = { servletContext -> Transactor transactor = new Transactor(name:'dk', address:'nasipit', telephone_no:'123', mobile_no:'123', terms:'1', type: 'C')
		if (!transactor.save()){
			log.error "Could not save transactor!!"
			log.error "${trans.errors}"	
		}
		
	}
}
