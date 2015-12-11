package moneytor

import grails.converters.JSON
import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Formatter.DateTime

class AccountController {

	def accountService
	def transactorService

	def getPayableList() {
		def payableList = accountService.getPayableList()
		return payableList
	}

	def getReceivableList() {
		def receivableList = accountService.getReceivableList()
		return receivableList
	}

	def show() {
		[accountList: Account.findAllByType(params.id)]
	}

	def payableList() {
		def payables = getPayableList()
		render payables as JSON
	}

	def addPayable() {
		System.out.println("add payable" + params.ptransaction_date.toString())

		def transId = params.transactor_id
		if (transId == "-1") {
			def transactor = new Transactor(
					name: params.pname,
					address: params.paddress,
					telephone_no: params.ptelephone_no,
					mobile_no: params.pmobile_no,
					terms: params.pterms,
					type: 'S',
					status: 'A'
					)
			transactorService.addTransactor(transactor)
			transId = transactorService.getTransactorIDByName(params.pname, 'S')
		} else {
			System.out.println("False" + transId)
		}
		def account = new Account(
				or_no: params.por_no,
				transactor_id: transId,
				amount: params.pamount,
				transaction_date: params.pdate,
				type: 'P',
				updated_by: session.user.id
				)
		accountService.addAccount(account)

		redirect(action: "main", controller: "main")
	}

	def addReceivable() {
		System.out.println("add receivable" + params.ptransaction_date.toString())

		def transId = params.rtransactor_id
		System.out.println("1:" +transId)
		if (transId == "-1") {
			System.out.println("2:" +transId)
			def transactor = new Transactor(
					name: params.rname,
					address: params.raddress,
					telephone_no: params.rtelephone_no,
					mobile_no: params.rmobile_no,
					terms: params.rterms,
					type: 'C',
					status: 'A'
					)
			transactorService.addTransactor(transactor)
			transId = transactorService.getTransactorIDByName(params.pname, 'R')
			System.out.println("3:" +transId)
		} else {
			System.out.println("False" + transId)
		}
		System.out.println("4:" +transId)
		def account = new Account(
				or_no: params.ror_no,
				transactor_id: transId,
				amount: params.ramount,
				transaction_date: params.rdate,
				type: 'R',
				updated_by: session.user.id
				)
		accountService.addAccount(account)
		
		redirect(action: "main", controller: "main")
	}

	def editReceivable() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
		Date trans_date = formatter.parse(params.ertransaction_date)
		def account = new Account(
				or_no: params.eror_no,
				transactor_id: params.int('ercustomer_name'),
				amount: params.eramount,
				transaction_date: trans_date,
				type: params.type,
				updated_by: session.user.id
				)
		accountService.editAccount(params.int('receivable_id'),account)
		redirect(action: "main", controller: "main")
	}

	def editPayable() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
		Date trans_date = formatter.parse(params.eptransaction_date)
		print 'trans date ' + trans_date
		def account = new Account(
				or_no: params.epor_no,
				transactor_id: params.int('epsupplier_name'),
				amount: params.epamount,
				transaction_date: trans_date,
				type: params.type,
				updated_by: session.user.id
				)
		accountService.editAccount(params.int('payable_id'),account)
		redirect(action: "main", controller: "main")
	}

	def index() {
	}
}
