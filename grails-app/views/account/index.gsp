<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Persons</title>
	</head>
	<body>
        <g:each in="${payableList}" var="payable">
        
            <h3>${payable.amount}, ${payable.updated_on}</h3>
            
            <br/>
        </g:each>
	</body>
</html>