package moneytor

import java.util.Date;

import grails.transaction.Transactional

@Transactional
class AccountService {
	def paymentService
	def getPayableList() {
		return Account.findAllByTypeAndStatusNotEqual('P', 'P')
	}
	
	def getReceivableList() {
		return Account.findAllByTypeAndStatusNotEqual('R', 'P')
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
	
	def makePaid(id, updatedBy, tot) {
		Account newAccount = Account.get(id)
		if(tot == newAccount.amount){
			newAccount.status = 'P'
			newAccount.updated_by = updatedBy
			newAccount.updated_on = new Date()
			newAccount.save()
		} else {
			newAccount.status = 'H'
			newAccount.save()
		}
	}
	
	def getAcct(id){
		return Account.get(id)
	}
}
