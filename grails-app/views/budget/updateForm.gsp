<g:render template="/templates/headerInfo" />
	</head>
	
	<body>
	<ul class="nav nav-tabs">
  		<li><g:link controller="home">Home</g:link></li>
  		<li><g:link controller="budget" action="view" params="[budgetSelect:currentBudget]">View budget</g:link></li>
 		<li class="active"><g:link controller="transaction">Add transaction</g:link></li>
		<li><g:link controller="account">Add account</g:link></li>
	</ul>
	
	
		<h1>Transaction info</h1>
		<g:form name="transaction" controller="budget" action="update" method="POST">
			Date:<g:textField name="date" value="01-01-2014"/><br>
			Amount:<g:textField name="amount" value="1000"/>
			   
	        <br><g:submitButton name="submitButton" value="Update" />
		</g:form>
         
         
	</body>