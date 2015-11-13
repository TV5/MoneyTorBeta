package moneytor

class AccountController {

	def accountService
	
	def getPayableList() {
		def payableList = accountService.getPayableList() 
		return payableList
	}
	
	def getReceivableList() {
		def receivableList = accountService.getReceivableList()
		return receivableList
	}
	
	def addPayable() {
		System.out.println("add payable" + params.ptransaction_date.toString())
		long transactor_id = 1
		def account = new Account(
				or_no: params.por_no,
				transactor_id: transactor_id, 
				amount: params.pamount,
				transaction_date: params.pdate,
				type: 'P',
				updated_by: session.user.id
				)
		accountService.addAccount(account)
		redirect(action: "main", controller: "main")
	}
	
	def editAccount() {
		System.out.println("edit account " + params.type)
		def account = new Account(
			or_no: params.por_no,
			transactor_id: 1,
			amount: params.pamount,
			transaction_date: params.pdate,
			type: params.type,
			updated_by: session.user.id
			)
		accountService.editAccount(account)
		redirect(action: "main", controller: "main")
	}
	
    def index() { 
		
	}
	
	
}
