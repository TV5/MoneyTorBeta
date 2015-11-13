package moneytor

import grails.transaction.Transactional

@Transactional
class AccountService {

	def getPayableList() {
		return Account.findAllByType('P')
	}
	
    def serviceMethod() {

    }
}
