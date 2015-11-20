databaseChangeLog = {

	changeSet(author: "DANIEL KENNETH (generated)", id: "1448029437435-1") {
		modifyDataType(columnName: "AMOUNT", newDataType: "float", tableName: "ACCOUNT")
		addColumn(tableName: "TRANSACTOR") {
			column(name: "status", type: "char", defaultValue: "A") {
				constraints(nullable: "false")
			}
		}
	}
}