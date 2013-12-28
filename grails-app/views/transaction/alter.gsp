<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
		<g:if test="${displayEditForm == 0 }">
			Deleted!<br />
			<g:link controller="budget" action="view" params="[budgetSelect:currentBudget]">Back to budget</g:link>         
		</g:if>
		<g:else>
			
			<g:form name="transaction" action="edit" method="POST">
				Date:<g:textField name="date" value="${transaction.date }"/><br>
				Description:<g:textField name="description" value="${transaction.description }" /><br>
				Amount:<g:textField name="amount" value="${transaction.amount }"/>
				<g:hiddenField name="idNum" value="${transaction.id }"/>
			<hr>
			This transaction affects another account:<g:checkBox name="accountFlag" /><br>
			(Which one?)<g:select name="accountLink"
	          from="${allAccounts}"
	          value="name"
	          optionKey="id" /><br>
			
			<hr>
			<strong>Don't forget to set these sections again:</strong><br />
			This transaction repeats:<g:checkBox name="repeatFlag" /><br>
			<select name="repeatType">
				<option value=""></option>
				<option value="days">Every x days</option>
				<option value="date">On this date of every month</option>
			</select><br>
			(x:<g:textField name="repeatVariable"/>)<br>
			Until:<g:textField name="repeatDate" value=""/><br>
	        
	        <br><g:submitButton name="submitButton" value="Edit" />
		</g:form>
		</g:else>
	</body>
</html>