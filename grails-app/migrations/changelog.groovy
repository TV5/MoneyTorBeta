databaseChangeLog = {

	/*changeSet(author: "DANIEL KENNETH (generated)", id: "1448029145350-1") {
		createTable(tableName: "ACCOUNT") {
			column(autoIncrement: "true", name: "ID", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "CONSTRAINT_E")
			}

			column(name: "VERSION", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "AMOUNT", type: "float") {
				constraints(nullable: "false")
			}

			column(name: "OR_NO", type: "VARCHAR(255)")

			column(name: "TRANSACTION_DATE", type: "TIMESTAMP")

			column(name: "TRANSACTOR_ID", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "TYPE", type: "CHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "UPDATED_BY", type: "VARCHAR(255)")

			column(name: "UPDATED_ON", type: "TIMESTAMP") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "DANIEL KENNETH (generated)", id: "1448029145350-2") {
		createTable(tableName: "TRANSACTOR") {
			column(autoIncrement: "true", name: "ID", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "CONSTRAINT_B")
			}

			column(name: "VERSION", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "ADDRESS", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "MOBILE_NO", type: "VARCHAR(255)")

			column(name: "NAME", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "TELEPHONE_NO", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "TERMS", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "TYPE", type: "CHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}

	changeSet(author: "DANIEL KENNETH (generated)", id: "1448029145350-3") {
		createTable(tableName: "USER") {
			column(autoIncrement: "true", name: "ID", type: "BIGINT") {
				constraints(nullable: "false", primaryKey: "true", primaryKeyName: "CONSTRAINT_2")
			}

			column(name: "VERSION", type: "BIGINT") {
				constraints(nullable: "false")
			}

			column(name: "F_NAME", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "L_NAME", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "PASSWORD", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "STATUS", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "TYPE", type: "CHAR(255)") {
				constraints(nullable: "false")
			}

			column(name: "UPDATED_BY", type: "INT") {
				constraints(nullable: "false")
			}

			column(name: "UPDATED_ON", type: "TIMESTAMP")

			column(name: "USERNAME", type: "VARCHAR(255)") {
				constraints(nullable: "false")
			}
		}
	}
	*/

	include file: 'addStatusFieldTransactors.groovy'
}
