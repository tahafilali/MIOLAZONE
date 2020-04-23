<%-- 
    Document   : feedback.jsp
    Created on : 2020-04-22, 00:38:09
    Author     : Nabiha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
       <title>Feedback</title>
    
    
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!/boot4>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    

    
    
 <html lang="en" class="full-height">

<!--Main Navigation-->
<header>

  <nav class="navbar fixed-top navbar-expand-lg navbar-dark scrolling-navbar">
    <a class="navbar-brand" href="#"><strong>MIOLAZONE</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Products</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="FeedbackList.jsp">Feedback </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact Us !</a>
        </li>
      </ul>
    </div>
  </nav>

  <div class="view intro-2" style="">
    <div class="full-bg-img">
      <div class="mask rgba-purple-light flex-center">
        <div class="container text-center white-text wow fadeInUp">
                        <pre>  </pre>

          <h2>Give Us your Feedback </h2>
          <br>
          <h5>Your opinion is really matter to us .. You are gonna help us to fix and develop our application more .. All that just for you .. because the finality is to give you a good User Experience !</h5>
         
       
<main class="text-center py-5">

    <body>
     
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        <div class="container py-3">
    <div class="row">
        <div class="mx-auto col-sm-6">
                    <!-- form user info -->
                    <div class="card">
                        <div class="card-header">
                            <h4 class="mb-0">Your Feedback</h4>
                        </div>
                        <div class="card-body">
                            
                                 <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884" user="sql2334884" password="nT9*uE7%"/>
        
        
        <form name="MyForm" action="insert.jsp" method="POST" class="form" role="form">
                         <p>
                <a href="http://localhost:8080/Reviews/FeedbackList.jsp" target="_blank">Click here to see the opinion of other customers ..</a>
            </p>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">First name</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" name="Nom" value="" placeholder="Your First Name" >
                                         
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Last name</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" name="Prenom" value="" placeholder="Your Last Name" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label">Email</label>
                                    <div class="col-lg-9">
                                        <input class="form-control" type="text" name="email" value="" placeholder="email@gmail.com" >
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="exampleFormControlTextarea1" class="col-lg-3 col-form-label form-control-label">Your Feedback </label>
                             
                                    <div class="col-lg-9">
                                        
    <textarea class="form-control" id="exampleFormControlTextarea1" 
        id="text" 
      	cols="40" 
      	rows="4" 
      	name="Message" 
      	placeholder="Your Text"
        rows="3">
           
                               
  
      	</textarea>   </div>
                                </div>
                                
                                
                                
                                <div class="form-group row">
                                    <label class="col-lg-3 col-form-label form-control-label"></label>
                                    <div class="col-lg-9">
                                        
                                        <input type="submit" class="btn btn-primary" value="Done" name="Done" />
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form user info -->
        </div>
    </div>
</div>
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
      </div>
    </div>
  </div>

      
      
      
       </div>
      </div>
    </div>
  </div>

</header>
<!--Main Navigation-->

<!--Main Layout-->



      
      
</main>
  <div class="container">
    <div class="row">
      <div class="col-md-12">

  
     

        

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
 <style type="text/css">
.view {
    background: url("https://mdbootstrap.com/img/Photos/Others/img (50).jpg")no-repeat center center;
    background-size: cover;
}

.navbar {
    background-color: transparent;
}

.top-nav-collapse {
    background-color: #4285F4;
}

@media only screen and (max-width: 768px) {
    .navbar {
        background-color: #4285F4;
    }
}

html,
body,
header,
.view {
  height: 100%;
}
</style>

        
        
        
        
        
        
        
    </body>
</html>
