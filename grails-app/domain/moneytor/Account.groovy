package moneytor

class Account {

	long id
	String or_no
	long transactor_id
	float amount
	Date transaction_date
	char type
	char status
	String updated_by
	Date updated_on = new Date()
	
    static constraints = {
		or_no nullable: true
		transactor_id  nullable: true
		amount nullable: true, scale: 2
		transaction_date nullable: true
		type default: 'P'
		status default: 'U'
		updated_by nullable: true
    }
}
