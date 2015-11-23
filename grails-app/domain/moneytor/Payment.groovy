package moneytor

class Payment {
	
	int account
	Date received_date
	float amount
	
    static constraints = {
		account nullable :false
		received_date nullable :false
		amount nullable :false
    }
}
