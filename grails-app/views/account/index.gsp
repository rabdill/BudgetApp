<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
		<h1>Transaction info</h1>
		<g:form name="account" action="create" method="POST">
			Name:<g:textField name="name"/><br>
			Starting value:<g:textField name="startValue" /><br>
			Does this account track an asset (like a savings account) or a liability (like a credit card balance)?
			<select name="multiplier">
				<option value="-1">Money I have</option>
				<option value="1">Money I owe</option>
			</select> <br>
	        <g:submitButton name="submitButton" value="Create" />
		</g:form>
         
         
	</body>