<g:render template="/templates/headerInfo" />
	</head>
	
	<body>
		<h1>New user</h1>
		<g:form name="userCreation" action="create" method="POST">
			Username:<g:textField name="username" />  
			Password:<g:passwordField name="password" />   
	        <br><g:submitButton name="submitButton" value="Create" />
		</g:form>
         
         
	</body>