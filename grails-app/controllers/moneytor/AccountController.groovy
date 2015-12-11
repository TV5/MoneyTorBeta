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
		System.out.println("1:" +transId)
		if (transId == "-1") {
			System.out.println("2:" +transId)
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
			System.out.println("3:" +transId)
		} else {
			System.out.println("False" + transId)
		}
		System.out.println("4:" +transId)
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

	def addPayableSupplier() {
		System.out.println("add payable" + params.ptransaction_date.toString())

		def transId = params.transactor_id
		if (transId == 0) {
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
	}

	def addPayableOnly() {
		System.out.println("add payable" + params.ptransaction_date.toString())

		def account = new Account(
				or_no: params.por_no,
				transactor_id: params.transactor_id,
				amount: params.pamount,
				transaction_date: params.pdate,
				type: 'P',
				updated_by: session.user.id
				)
		accountService.addAccount(account)
	}

	def addReceivable() {
		def account = new Account(
				or_no: params.ror_no,
				transactor_id: params.rtransactor_id,
				amount: params.ramount,
				transaction_date: params.rdate,
				type: 'R',
				updated_by: session.user.id
				)
		accountService.addAccount(account)
		redirect(action: "main", controller: "main")
	}

	def addReceivableCustomer() {
		def transactor = new Transactor(
				name: params.rname,
				address: params.raddress,
				telephone_no: params.rtelephone_no,
				mobile_no: params.rmobile_no,
				terms: params.rterms,
				type: params.rtype
				)
		transactorService.addTransactor(transactor)
		def transactorHolder = transactorService.getTransactorIDByName(params.name, 'C')
		def account = new Account(
				or_no: params.ror_no,
				transactor_id: transactorHolder.id,
				amount: params.ramount,
				transaction_date: params.rdate,
				type: 'R',
				updated_by: session.user.id
				)
		accountService.addAccount(account)
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

	def downloadSampleExcel() {
		response.setContentType('application/vnd.ms-excel')
		response.setHeader('Content-Disposition', 'Attachment;Filename="example.xls"')
		//		WritableWorkbook workbook = Workbook.createWorkbook(response.outputStream)
		//		WritableSheet sheet1 = workbook.createSheet("Students", 0)
		//		sheet1.addCell(new Label(0,0, "First Name"))
		//		sheet1.addCell(new Label(1,0, "Last Name"))
		//		sheet1.addCell(new Label(2,0, "Age"))
		//		sheet1.addCell(new Label(0,1, "John"))
		//		sheet1.addCell(new Label(1,1, "Doe"))
		//		sheet1.addCell(new Label(2,1, "20"))
		//		sheet1.addCell(new Label(0,2, "Jane"))
		//		sheet1.addCell(new Label(1,2, "Smith"))
		//		sheet1.addCell(new Label(2,2, "18"))
		//		WritableSheet sheet2 = workbook.createSheet("Courses", 1)
		//		sheet2.addCell(new Label(0,0, "Course Name"))
		//		sheet2.addCell(new Label(1,0, "Number of units"))
		//		sheet2.addCell(new Label(0,1, "Algebra"))
		//		sheet2.addCell(new Label(1,1, "3"))
		//		sheet2.addCell(new Label(0,2, "English Grammar"))
		//		sheet2.addCell(new Label(1,2, "5"))
		workbook.write();
		workbook.close();
	}
}
