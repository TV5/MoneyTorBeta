import moneytor.*

class BootStrap {

    def init = { servletContext ->
		User user = new User(username:'adminuser', password:'adminuser', f_name:'Admin', l_name:'Admin', status:'1', type:'A')
		if (!user.save()){
			log.error "Could not save user!!"
			log.error "${user.errors}"
		  }	
	}
    def destroy = {
    }
}
