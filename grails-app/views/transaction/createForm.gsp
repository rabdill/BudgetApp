<!DOCTYPE html>
<html>
	<head>
	</head>
	
	<body>
		<h1>Transaction info</h1>
		<g:form name="transaction" action="create" method="POST">
			Date:<g:textField name="date"/><br>
			Description:<g:textField name="description" /><br>
			Amount:<g:textField name="amount" /><hr>
			This transaction affects another account:<g:checkBox name="accountFlag" /><br>
			(Which one?)<g:select name="accountLink"
	          from="${allAccounts}"
	          value="name"
	          optionKey="id" /><br>
	        <g:hiddenField name="budget" value="${params.budgetSelect }" />
	        <g:submitButton name="submitButton" value="Create" />
		</g:form>
         
         
	</body>