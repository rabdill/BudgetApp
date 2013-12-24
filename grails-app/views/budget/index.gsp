<!DOCTYPE html>
<html>
	<head>
	</head>
	
	<body>
		<h1>Which budget do you want to view?</h1>
		<g:form name="selector" action="viewBudget" method="GET">
			<g:select name="budgetSelect"
	          from="${allBudgets}"
	          value="name"
	          optionKey="name" />
	        <g:submitButton name="selectorButton" value="Look up" />
		</g:form>
         
         
	</body>