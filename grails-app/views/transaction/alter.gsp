<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
		<g:if test="${displayEditForm == 0 }">
			Deleted!<br />
			<g:link controller="budget" action="view" params="[budgetSelect:currentBudget]">Back to budget</g:link>         
		</g:if>
		<g:else>
			<h1>Edit transaction</h1>
			<g:form name="transaction" action="edit" method="POST">
				Date:<g:textField name="date" value="${transaction.date.format("MM/dd/yyy")}"/><br>
				Description:<g:textField name="description" value="${transaction.description }" /><br>
				Amount:<g:textField name="amount" value="${transaction.amount }"/>
				<g:hiddenField name="idNum" value="${transaction.id }"/>
			<hr>
			<strong>Don't forget to set these sections again:</strong><br />
			This transaction affects another account:<g:checkBox name="accountFlag" /><br>
			(Which one?)<g:select name="accountLink"
	          from="${allAccounts}"
	          value="name"
	          optionKey="id" /><br>
	        
	        <br><g:submitButton name="submitButton" value="Edit" />
		</g:form>
		</g:else>
	</body>
</html>