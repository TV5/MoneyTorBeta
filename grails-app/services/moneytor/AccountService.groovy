package moneytor

import grails.transaction.Transactional

@Transactional
class AccountService {

	def getPayableList() {
		return Account.findAllByType('P')
	}
	
	def addAccount(account) {
		account.save()
	}
	
    def serviceMethod() {

    }
}
