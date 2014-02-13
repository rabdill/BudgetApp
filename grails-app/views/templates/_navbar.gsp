<div class="row">
	<div class="col-xs-6">
		<ul class="nav nav-tabs">
			  	<li><g:link controller="home">Home</g:link></li>
		  		
		  		
		  		<li class="dropdown">
		    		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		    		  Budgets <span class="caret"></span>
		    		</a>
		    		<ul class="dropdown-menu">
		    			<g:each in="${allBudgets}">
		    				<li><g:link action="view" controller="budget" params="[budgetSelect: it.name ]">${it.name }</g:link></li>
						</g:each>
						<li class="divider"></li>
						<li><g:link controller="budget" action="createForm">Add budget</g:link></li>
		    		 </ul>
		 		 </li>
		 		
		 		<li class="dropdown">
		    		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		    		  Graphs <span class="caret"></span>
		    		</a>
		    		<ul class="dropdown-menu">
		    		  	<li><a href="#" data-toggle="modal" data-target="#cashChartModal">Cash</a></li>
		   			 </ul>
		 		 </li>	 
		 		 
		 		 <li class="dropdown">
		    		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
		    		  Add<span class="caret"></span>
		    		</a>
		    		<ul class="dropdown-menu">
		    			<li><a data-toggle="modal" data-target="#addTransactionModal">Transaction</a></li>
		   			 	<li><a data-toggle="modal" data-target="#addAccountModal">Account</a></li>
		    			<li><g:link controller="budget" action="createForm">Budget</g:link></li>
		    		 </ul>
		    	</li>
		
		    	
				</ul>
	</div>		
	<div class="col-xs-6" style="text-align: right;">
			<g:form name="signOut pull-right" url="[controller:'logout']">
				<g:submitButton class="btn btn-primary" name="Sign out" value="signout" style="margin: 5px 5px 0 0;"/>
	    	</g:form>	<!-- This thing is a form instead of a link because the logout controller
									  will only accept postdata. All else returns a 405 error. -->
	</div>
</div>