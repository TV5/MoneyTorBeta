package moneytor

class Payment {
	
	int account
	Date received_date
	BigDecimal amount
	
    static constraints = {
		account nullable :false
		received_date nullable :false
		amount scale: 2, nullable :false
    }
}
