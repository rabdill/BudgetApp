<g:render template="/templates/headerInfo" />

	</head>
	
	<body>
	
		
	<sec:ifAllGranted roles="ROLE_USER">	
	<g:render template="/templates/navbar" />	
	
	<div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">
		<h1>Rich's Budget Thing</h1>
		<h2>It's so fun</h2>
		<h3>You should use it</h3>
		<h4>There is not a lot of content</h4>
		<h5>But it's getting there</h5>
		<h6>Enjoy</h6>
	</div>
	     
     </sec:ifAllGranted>  
	</body>