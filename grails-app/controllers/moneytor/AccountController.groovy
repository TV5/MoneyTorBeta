package moneytor

import grails.converters.JSON

import java.io.ObjectInputStream.ValidationList;
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
	
	def getErrorList(or_no, transactor_id, amount) {
		def validationList = []
		try {
			if(or_no==null || or_no=="") {
				validationList.add("Please enter official receipt number.")
			} else if(!or_no.matches("[A-Za-z0-9]+")) {
				validationList.add("Official receipt number must be alphanumeric.")
			}			
		} catch (e){
			print "Error"
		}
		
		if(transactor_id==null) {
			validationList.add("Please enter customer/supplier.")
		} else if (Integer.parseInt(transactor_id) < 1) {
			validationList.add("Please enter customer/supplier.")
		}
		
		if(amount==null ||  amount=="") {
			validationList.add("Please enter amount.")
		} else if (amount==0 || amount=="0") {
			validationList.add("Amount must be greater than zero.")
		}
		return validationList
	}

	def payableList() {
		def payables = getPayableList()
		render payables as JSON
	}

	def addPayable() {
		def errorList = getErrorList(params.por_no,params.transactor_id,params.pamount)
		if(errorList.isEmpty()){
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
		} else {
			errorList.each{ render '<li class="list">'+it+'</li>' }
		}
	}

	def addReceivable() {
		def errorList = getErrorList(params.ror_no, params.rtransactor_id, params.ramount)
		if(errorList.isEmpty()){
			def transId = params.int('rtransactor_id')
			if (transId == "-1") {
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
				transId = transactorService.getTransactorIDByName(params.rname, 'C')
			} else {
				System.out.println("False" + transId)
			}
			def account = new Account(
					or_no: params.ror_no,
					transactor_id: transId,
					amount: params.ramount,
					transaction_date: params.rdate,
					type: 'R',
					updated_by: session.user.id
					)
			accountService.addAccount(account)
		} else {
			errorList.each{ render '<li class="list">'+it+'</li>' }
		}
		
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
