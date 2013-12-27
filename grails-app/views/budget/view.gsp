<g:render template="/templates/headerInfo" />

	</head>

	<body>
		<h1>${session.currentBudget}</h1>
		Add: <g:link controller="transaction">transaction</g:link> / <g:link controller="account">account</g:link><br>
		
		
	<div class="col-lg-6 col-md-6 col-sm-12">
		<table border="1" cellpadding="5">
			<thead>
				<tr>
					<th>Date</th>
					<th>Description</th>
					<th>Amount</th>
					<th>Cash</th>
					<g:each in="${allAccounts}">
						<th>${it.name }</th>
					</g:each>
				</tr>
			</thead>
			<tbody>
				<% iterate = 0 %>
				<g:while test="${iterate < transactionCount}">
				    <tr>
				    <td><g:formatDate format="MM-dd-yyyy" date="${date[iterate]}"/></td>
				    <td>${description[iterate] }</td>
				    
				    <g:if test="${amount[iterate] < 0}">
					    <td><font color="red">(${-amount[iterate] })</font></td>
					</g:if>
					<g:else>
					    <td>${amount[iterate] }</td>
					</g:else>
				    
				    <g:if test="${runningTotal[iterate] < 0}">
					    <td><b><font color="red">(${-runningTotal[iterate] })</font></b></td>
					</g:if>
					<g:else>
					    <td>${runningTotal[iterate] }</td>
					</g:else>
						
				    
				    <% accountNum = 0 %>
				    <g:while test="${accountNum < accountCount }">
				    
				    <g:if test="${runningAccount[accountNum][iterate] < 0}">
					    <td><b><font color="red">(${-runningAccount[accountNum][iterate] })</font></b></td>
					</g:if>
					<g:else>
					    <td>${runningAccount[accountNum][iterate] }</td>
					</g:else>
				    	<%accountNum++%>
				    </g:while>
				    </tr>
				    <%iterate++%>
				</g:while>
			</tbody>
		</table>
		
	</div>	<!-- 	Closes table half of the page -->
	
	
	
	
	<div class="col-lg-6 col-md-6 col-sm-12">
		
		
	</div>	<!-- 	Closes graph half of the page -->
	
	
	
	
	
	
	
	</body>
</html>