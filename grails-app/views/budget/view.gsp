<g:render template="/templates/headerInfo" />

<!--  http://grails.org/plugin/google-visualization -->
<gvisualization:apiImport/>
<gvisualization:areaCoreChart elementId="visualization" title="Cash" width="${600}" height="${350}" columns="${ chartData.columns }" data="${ chartData.data }" />

<style>
	th {
	text-align: right;
	}
	
	td	{
	border-right:solid 2px #C4C4C4;
	}
</style>
	</head>

	<body>
	<g:form name="transactionSelector" url="[action:'alter',controller:'transaction']">
			
	<div class="col-lg-3 col-md-3 col-sm-12">
		<h1>${session.currentBudget}</h1>
		<p><g:link controller="transaction">Add transaction</g:link></p>
		
		<p><g:link controller="account">Add account</g:link></p>
		
		<p><g:submitButton name="actionChoice" value="Edit selected transaction" /></p>
		<p><g:submitButton name="actionChoice" value="Delete selected transaction" /></p>
    </div>
	<div class="col-lg-9 col-md-9 col-sm-12">
		<br />
		<table class="table table-striped">
			<thead>
				<tr>
					<th></th>
					<th>Date</th>
					<th>Description</th>
					<th>Amount</th>
					<th><a href="#" data-toggle="modal" data-target="#myModal">Cash</a></th>
				
					<g:each in="${allAccounts}">
						<th>${it.name }</th>
					</g:each>
					
				</tr>
			</thead>
			
			
				<tbody align="right">
				<% iterate = 0 %>
				<g:while test="${iterate < transactionCount}">
				    <tr>
				    <td><g:radio name="transactionChoice" value="${idNum[iterate] }"/></td>
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
					    <td><strong>${runningTotal[iterate] }</strong></td>
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
		</g:form>
		
		<br />
	</div>	
	
	
	
	
	
	<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-12">
	

        		
  
	</div>
	
	
	
	
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          
            <div id="visualization" style="width: 500px; height: 300px;"></div>
		 
     

        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
	
	
	
	
	</body>
</html>