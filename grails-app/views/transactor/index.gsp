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
        
        
        
        <g:form controller="transactor" action="addTransactor">
				<div class="ui error message"></div>		
					<div class="inline fields">
						<div class="two wide field">
							<label>Name</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="name" value="${name}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Address</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="address" value="${address}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Telephone Number</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="telephone_no" value="${telephone_no}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Mobile Number</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="mobile_no" value="${mobile_no}" required="true"/>
						</div>
					</div>

					<div class="inline fields">
						<div class="two wide field">
							<label>Terms</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="terms" value="${terms}" required="true"/>
						</div>
					</div>
					<div class="inline fields">
						<div class="two wide field">
							<label>Type</label>
						</div>
						<div class="seven wide field">
				            <g:textField name="type" value="${type}" required="true"/>
						</div>
					</div>
					
			<div class="actions">
				<g:actionSubmit class="ui approve large teal submit button" value="Save" action="addTransactor"/>
				<div class="ui cancel button">Cancel</div>
			</div>
			</g:form>
	</body>
</html>