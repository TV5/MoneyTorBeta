package moneytor

import java.util.Date;

class Transactor {

	String name
	String address
	String telephone_no
	String mobile_no
	int terms
	char type
	
	static constraints = {
		name nullable: false
		address nullable: false
		telephone_no nullable: false
		mobile_no nullable: true
		terms nullable: false, default: 0
		type nullable: false
		status nullable: false, default: A
	}
	
	
}
