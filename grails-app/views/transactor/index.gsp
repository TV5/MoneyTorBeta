<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Persons</title>
	</head>
	<body>
	<h1>hello</h1>
        <g:each in="${transactorList}" var="transactor">
        	<h1>hello</h1>
            <h3>${transactor.name}, ${transactor.telephone_no}</h3>
            
            <br/>
        </g:each>
	</body>
</html>