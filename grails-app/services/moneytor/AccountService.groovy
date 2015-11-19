package moneytor

import java.util.Date;

import grails.transaction.Transactional

@Transactional
class AccountService {

	def getPayableList() {
		return Account.findAllByType('P')
	}
	
	def getReceivableList() {
		return Account.findAllByType('R')
	}
	
	def addAccount(account) {
		account.save()
	}
	
	def editAccount(Account account) {
		Account newAccount = Account.get(account.id)
		newAccount.or_no = account.or_no
		newAccount.transactor_id = account.transactor_id
		newAccount.amount = account.amount
		newAccount.transaction_date = account.transaction_date
		newAccount.updated_by = account.updated_by
		newAccount.updated_on = new Date()
		newAccount.save()
	}
	
    def serviceMethod() {

    }
	
	
}
