package moneytor

import java.text.DateFormat
import java.text.SimpleDateFormat
import java.util.Formatter.DateTime

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
		def account = new Account(
				or_no: params.por_no,
				transactor_id: params.transactor_id, 
				amount: params.pamount,
				transaction_date: params.pdate,
				type: 'P',
				updated_by: session.user.id
				)
		accountService.addAccount(account)
		redirect(action: "main", controller: "main")
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
	
	def editAccount() {
		def account = new Account(
			id: params.ep_id,
			or_no: params.epor_no,
			transactor_id: params.epsuplier_name,
			amount: params.epamount,
			transaction_date: params.eptransaction_date,
			type: params.type,
			updated_by: session.user.id
			)
		//print 'controller' + params.payable_id
		//accountService.editAccount(params.payable_id.toString(),account)
		redirect(action: "main", controller: "main")
	}
	
	def editReceivable() {
		print 'date params '+params.ertransaction_date
		def splitDate = params.ertransaction_date.split("-")
		int year = splitDate[0] = Integer.parseInt(splitDate[0])
		int month = splitDate[1] = Integer.parseInt(splitDate[1])
		int day = splitDate[2] = Integer.parseInt(splitDate[2])
		/*print '0'+splitDate[0]
		print '1'+splitDate[1]
		print '2'+splitDate[2]
		Date trans_date = new Date(year+1900,month-1,day)*/
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd")
		Date trans_date = formatter.parse(params.ertransaction_date)
		print 'string ' + trans_date.toString()
		def account = new Account(
			or_no: params.eror_no,
			transactor_id: params.int('ercustomer_name'),
			amount: params.eramount,
			transaction_date: trans_date,
			type: params.type,
			updated_by: session.user.id
			)
		print 'date ' + trans_date.toString()
		accountService.editAccount(params.int('receivable_id'),account)
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
