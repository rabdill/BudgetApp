<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
		Created!<br>
		${repeated }
		<br>
		<g:link controller="budget" action="view" params="[budgetSelect:currentBudget]">Back to budget</g:link>
         
	</body>