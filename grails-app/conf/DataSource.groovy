dataSource {
    pooled = true
    jmxExport = true
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
//    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
    singleSession = true // configure OSIV singleSession mode
    flush.mode = 'manual' // OSIV session flush mode outside of transactional context
}

// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "update" // one of 'create', 'create-drop', 'update', 'validate', ''
			
			username = "sa"
			password = ""
			driverClassName = "org.h2.Driver"
			url = "jdbc:h2:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			//url = "jdbc:mysql://localhost:3306/MoneyTor_DB?useUnicode=yes&characterEncoding=UTF-8"
			//driverClassName = "com.mysql.jdbc.Driver"
        }
		hibernate {
			show_sql = true
		}
    }
    test {
        dataSource {
            dbCreate = "update"
            
			username = "sa"
			password = ""
			driverClassName = "org.h2.Driver"
			url = "jdbc:h2:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
			//url = "jdbc:mysql://localhost:3306/MoneyTor_DB?useUnicode=yes&characterEncoding=UTF-8"
			//driverClassName = "com.mysql.jdbc.Driver"
        }
    }
    production {
        dataSource {
			username = "root"
			password = "password"
			pooled = true
			dbCreate = "update"
			driverClassName = "com.mysql.jdbc.Driver"
			url = "jdbc:mysql://localhost:3306/MoneyTor_DB?useUnicode=yes&characterEncoding=UTF-8"
			//url = "jdbc:mysql://aad7huuvkywecw.cuyy0lhjbzer.us-west-2.rds.amazonaws.com:3306/ebdb?user=admin&password=password"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}

