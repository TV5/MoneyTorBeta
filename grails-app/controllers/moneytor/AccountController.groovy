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
	
	def getErrorList(id, or_no, transactor_id, amount, trans_type) {
		if(session.user){
			def validationList = []
			try {
				if(or_no==null || or_no=="") {
					validationList.add("Official receipt number is required.")
				} else if(!or_no.matches("[A-Za-z0-9]+")) {
					validationList.add("Official receipt number must be alphanumeric.")
				} 
				if(or_no.length()>10){
					validationList.add("Official receipt number must at most 10 characters.")
				} 
				if(or_no.matches("[0]+")){
					validationList.add("Official receipt number must not be 0.")
				}		
			} catch (e){
				print "Error"
			}
			if(transactor_id!="edit"){
				if(transactor_id==null) {
					validationList.add("Customer/supplier is required.")
				} else if (Integer.parseInt(transactor_id) < 1 && Integer.parseInt(transactor_id) != -1) {
					validationList.add("Customer/supplier is required.")
				}
			}
			
			print "AMOUNT CLASS " + amount.getClass();
			if(amount != null && !amount.isEmpty()) {
				if(!amount.matches("^\\s*(?=.*[1-9])\\d*(?:\\.\\d{1,2})?\\s*\$")) {
					validationList.add("Amount must be a positive number with a maximum of two decimal places.")
				} else if (Float.parseFloat(amount) >=  10000000) {
					validationList.add("Amount must be less than 10,000,000.00")
				}
			} else {
				validationList.add("Please enter a number.")
			}
			
			if (trans_type == 'R') {
				if (accountService.getReceivableByOR(or_no) != null) {
					if (id != null) {
						if (accountService.getAcct(id).or_no != or_no) {
							validationList.add("OR number is already in use.")
						}
					} else {
						validationList.add("OR number is already in use.")
					}
				}
			}
			
			return validationList
		}
	}
	
	def payableList() {
		def payables = getPayableList()
		render payables as JSON
	}

	def addPayable() {

		if(session.user){
			def errorList = getErrorList(null, params.por_no,params.transactor_id,params.pamount, 'P')
			def transErrorsList = transactorService.validate(null, params.pname, params.paddress, params.ptelephone_no,params.pmobile_no, params.pterms, 'S')
			def transId = params.transactor_id
			if (transId == "-1") {
				if(transErrorsList.isEmpty()){
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
					print params.pname
					
				} else {
					transErrorsList.each{ render '<li class="list">'+it+'</li>' }
				}
			}else {
				System.out.println("False" + transId)
			}
				
				if(errorList.isEmpty()){
				def account = new Account(
						or_no: params.por_no,
						transactor_id: transId,
						amount: params.pamount,
						transaction_date: params.pdate,
						type: 'P',
						status: 'U',
						updated_by: session.user.id
						)
				accountService.addAccount(account)
				render ""
			} else {
				errorList.each{ render '<li class="list">'+it+'</li>' }
			}
		}
	}

	def addReceivable() {
		if(session.user){
			def errorList = getErrorList(null, params.ror_no,params.rtransactor_id,params.ramount, 'R')
				def transErrorsList = transactorService.validate(null, params.rname, params.raddress, params.rtelephone_no,params.rmobile_no, params.rterms, 'C')
				def transId = params.rtransactor_id
				if (transId == "-1") {
					if(transErrorsList.isEmpty()){
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
					transErrorsList.each{ render '<li class="list">'+it+'</li>' }
				}
			}else {
				System.out.println("False" + transId)
			}
				
				if(errorList.isEmpty()){
				def account = new Account(
						or_no: params.ror_no,
						transactor_id: transId,
						amount: params.ramount,
						transaction_date: params.rdate,
						type: 'R',
						status: 'U',
						updated_by: session.user.id
						)
				accountService.addAccount(account)
				render ""
			} else {
				errorList.each{ render '<li class="list">'+it+'</li>' }
			}
		}
	}
	
	def editReceivable() {
		if(session.user){
			def errorList = getErrorList(params.receivable_id, params.eror_no, "edit", params.eramount, 'R')
			if(errorList.isEmpty()){
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
			Date trans_date = formatter.parse(params.ertransaction_date)
			def account = new Account(
					or_no: params.eror_no,
					amount: params.eramount,
					transaction_date: trans_date,
					type: params.type,
					updated_by: session.user.id
					)
			accountService.editAccount(params.int('receivable_id'),account)
			render ""
			} else {
				errorList.each{ render '<li class="list">'+it+'</li>' }
			}
		}
	}

	def editPayable() {
		if(session.user){
			def errorList = getErrorList(null, params.epor_no, "edit", params.epamount, 'P')
			if(errorList.isEmpty()){
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
			render ""
			} else {
				errorList.each{ render '<li class="list">'+it+'</li>' }
			}
		}
	}

	def index() {
	}
}
