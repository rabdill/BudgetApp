<!DOCTYPE html>
<html>
	<head>
	
	</head>
	<body>
		 <form method="POST" action="${resource(file: 'j_spring_security_check')}">
		  <table>
		    <tr>
		      <td>Username:</td><td><g:textField name="j_username"/></td>
		    </tr>
		    <tr>
		      <td>Password:</td><td><input name="j_password" type="password"/></td>
		    </tr>
		    <tr>
		      <td colspan="2"><g:submitButton name="login" value="Login"/></td>
		    </tr>
		    <tr>
		      <td colspan="2">try "glen" or "peter" with "password"</td>
		    </tr>
		  </table>              
		</form>
		 
	</body>
</html>
