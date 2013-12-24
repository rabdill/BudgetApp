<!DOCTYPE html>
<html>
	<head>
	</head>
	
	<body>
		<h1>Which budget do you want to add a transaction to?</h1>
		<g:form name="selector" action="createForm" method="GET">
			<g:select name="budgetSelect"
	          from="${allBudgets}"
	          value="name"
	          optionKey="name" />
	        <g:submitButton name="selectorButton" value="This one" />
		</g:form>
         
         
	</body>