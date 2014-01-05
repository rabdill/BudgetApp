<!-- Transaction edit/delete form.  -->
<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
	<g:form name="transaction" action="edit" method="POST">
	<g:hiddenField name="idNum" value="${transaction.id }"/>
		<!-- 	If "Delete" is selected -->
		<g:if test="${displayEditForm == 0 }">
			<g:radio name="deleteAll" value="0" checked="true"/>Delete just this transaction
			<g:radio name="deleteAll" value="1"/>Delete all transactions with this name
			<g:submitButton name="submitButton" value="Delete" />




		</g:if>
		<g:else>
			<h1>Edit transaction</h1>
				Date:<g:textField name="date" value="${transaction.date.format("MM-dd-yyyy")}"/><br>
				Description:<g:textField name="description" value="${transaction.description }" /><br>
				Amount:<g:textField name="amount" value="${transaction.amount }"/>
				<br>
				<br>
				<g:radio name="editAll" value="0" checked="true"/>Edit just this transaction
				<g:radio name="editAll" value="1"/>Edit all transactions with this name
			<hr>
			<strong>Don't forget to set this section again:</strong><br />
			This transaction affects another account:<g:checkBox name="accountFlag" /><br>
			(Which one?)<g:select name="accountLink"
	          from="${allAccounts}"
	          value="name"
	          optionKey="id" /><br>
	        
	        <br><g:submitButton name="submitButton" value="Edit" />
		</g:else>
		
		</g:form>
	</body>
</html>