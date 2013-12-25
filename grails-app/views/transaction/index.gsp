<!DOCTYPE html>
<html>
	<head>
	</head>
	
	<body>
		<h1>Transaction info</h1>
		<g:form name="transaction" action="create" method="POST">
			Date:<g:textField name="date" value="01/01/2014"/><br>
			Description:<g:textField name="description" value="rent" /><br>
			Amount:<g:textField name="amount" value="-54"/>
			
			<hr>
			This transaction affects another account:<g:checkBox name="accountFlag" /><br>
			(Which one?)<g:select name="accountLink"
	          from="${allAccounts}"
	          value="name"
	          optionKey="id" /><br>
			
			<hr>
			This transaction repeats:<g:checkBox name="repeatFlag" /><br>
			<select name="repeatType">
				<option value=""></option>
				<option value="days">Every x days</option>
				<option value="date">On this date of every month</option>
			</select><br>
			(x:<g:textField name="repeatVariable"/>)<br>
			Until:<g:textField name="repeatDate" value="01/15/2015"/><br>
	        
	        <br><g:submitButton name="submitButton" value="Create" />
		</g:form>
         
         
	</body>