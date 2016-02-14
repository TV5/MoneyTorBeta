import moneytor.*

class BootStrap {

    def init = { servletContext ->
		if (!User.count()) {
			new User(f_name: "adminuser", l_name: "adminuser", username: "adminuser", password: "adminuser".encodeAsPassword(), type: "A", status: 1, updated_on: new Date(), updated_by: 1).save(failOnError: true)
		}
	}
    def destroy = {
		getUserByUsername("adminuser").delete()
    }
}
