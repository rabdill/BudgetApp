<!DOCTYPE html>
<g:render template="/templates/headerInfo" />

<title>TreasureMeasure – Personal Budgeting</title>
		
</head>

  <body>

    <div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">TreasureMeasure</a>
        </div>
        <div class="navbar-collapse collapse">
        <form class="navbar-form navbar-right" method="POST" action="${resource(file: 'j_spring_security_check')}">
           <div class="form-group">
              <g:textField name="j_username" class="form-control" placeholder="Username" />
            </div>
            <div class="form-group">
           	 <input name="j_password" type="password" class="form-control" placeholder="Password" />
            </div>
	           <g:submitButton name="login" value="Login"/>
          </form>
        </div><!--/.navbar-collapse -->
      </div>
    </div>

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>You know you need a budget.</h1>
        <p>It's time to start keeping track of your money. There are plenty of good options out there — but if
        they were good for <em>you</em>, you'd be using them already.</p>
        
        <p><strong>TreasureMeasure</strong> is a new way to keep track of your money and
        where it will be. You don't need to come up with monthly estimates or long-term
        goals — just enter your bills and let TreasureMeasure do the rest.</p>
        <p><g:link controller="User" class="btn btn-primary btn-lg">Sign up today &raquo;</g:link></p>
      </div>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-4">
          <h2>How does it work?</h2>
          <p>There isn't any mystery here: <strong>It's a big list of transactions.</strong> Say you get paid $1,000 every two weeks. TreasureMeasure
          will go through the entire year and note, once every two weeks, a "+$1,000."</p>
          <p>Now, let's say you have to pay a $65 phone bill on the 15th of every month. TreasureMeasure will go through
          the year and, on the 15th of every month, record a "-$65." Repeat this process for all your bills, plus a buffer
          to account for variable things like food and gas, and you've got <strong>a complete list of how much money you'll have</strong> on
          every day, all year.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
        <div class="col-md-4">
          <h2>Why is it better?</h2>
          <p>Put a thing here about how monthly budgets obscure things like paydays, and the timing of money</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
       </div>
        <div class="col-md-4">
          <h2>Another one</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        </div>
      </div>

      <hr>

      <footer>
        <p>&copy; Company 2013</p>
      </footer>
    </div> <!-- /container -->


  </body>
</html>

