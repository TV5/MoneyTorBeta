import moneytor.*

class BootStrap {

    def init = { servletContext ->
		
	}
    def destroy = {
		getUserByUsername("adminuser").delete()
    }
}
