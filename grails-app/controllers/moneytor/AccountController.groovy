package moneytor

class AccountController {

	AccountService accountService
	
	def getPayableList() {
		return accountService.getPayableList()
	}
	
    def index() { 
		
	}
	
	
}
