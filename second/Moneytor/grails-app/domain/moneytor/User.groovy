package moneytor

class User {

	String username
	String password
	String f_name
	String l_name
	int status
	char type
	int updated_by
	Date updated_on
	
	static constraints = {
		updated_on nullable: true, default:null
		updated_by nullable: true, default: null
		status default: 1

	}

}
