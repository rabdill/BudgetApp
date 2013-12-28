<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
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
    		 </ul>
 		 </li>
 		
 		<li class="disabled">
    		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
    		  Graphs <span class="caret"></span>
    		</a>
 		 </li>
 		 
 		 
 		 <li class="dropdown">
    		<a class="dropdown-toggle" data-toggle="dropdown" href="#">
    		  Add<span class="caret"></span>
    		</a>
    		<ul class="dropdown-menu">
    			<li class="disabled"><a>Transaction</a></li>
   			 	<li class="disabled"><a>Account</a></li>
    			<li><g:link controller="budget" action="createForm">Budget</g:link></li>
    		 </ul>
    	</li>
    	
	</ul>	
	
	<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
		<h1>Budget App</h1>
		<h2>It's so fun</h2>
		<h3>You should use it</h3>
		<h4>There is not a lot of content</h4>
		<h5>But it's getting there</h5>
		<h6>Enjoy your stay</h6>
	</div>
	     
         
	</body>