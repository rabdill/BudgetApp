<g:render template="/templates/headerInfo" />
	</head>
	
	<body>
	<g:render template="/templates/navbar" />
		<h1>New budget</h1>
		<g:form name="transaction" action="create" method="POST">
			Name:<g:textField name="name" />   
	        <br><g:submitButton name="submitButton" value="Create" />
		</g:form>
         
         
	</body>