<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
	<!-- 	Nav menu -->
	<ul class="nav nav-tabs">
	  	<li><g:link controller="home">Home</g:link></li>
  		<li><g:link controller="budget" action="view" params="[budgetSelect:currentBudget]">View budget</g:link></li>
 		<li><g:link controller="transaction">Add transaction</g:link></li>
		<li class="active"><g:link controller="account">Add account</g:link></li>
	</ul>	
		
		<h1>Add account</h1>
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