package moneytor

import java.util.Date;

import grails.transaction.Transactional

@Transactional
class AccountService {

	def getPayableList() {
		return Account.findAllByTypeAndStatus('P', 'U')
	}
	
	def getReceivableList() {
		return Account.findAllByTypeAndStatus('R', 'U')
	}
	
	def addAccount(account) {
		account.save()
	}
	
	def editAccount(id, Account account) {
		Account newAccount = Account.get(id)
		newAccount.or_no = account.or_no
		newAccount.amount = account.amount
		newAccount.transaction_date = account.transaction_date
		newAccount.updated_by = account.updated_by
		newAccount.updated_on = new Date()
		newAccount.save()
	}
	
    def serviceMethod() {

    }
	
	def makePaid(id, updatedBy) {
		Account newAccount = Account.get(id)
		newAccount.status = 'P'
		newAccount.updated_by = updatedBy
		newAccount.updated_on = new Date()
		newAccount.save()
	}
}
