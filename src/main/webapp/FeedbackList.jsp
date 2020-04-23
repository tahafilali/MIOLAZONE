<%-- 
    Document   : FeedbackList
    Created on : 2020-04-22, 02:33:28
    Author     : Nabiha
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884" user="sql2334884" password="nT9*uE7%"/>

<!DOCTYPE html>
<html>
<head>
	<title> Feedback List</title>

<!boooot4>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!/boot4>




  

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="decStyle.css" >

<meta charset="utf-8" >           
</head>
  
    
    
    
    
    
 
    
    
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
    <pre>  </pre>


          <h2>Our client's opinion is a value to count </h2>
          <br>
          <h5>Here are the most comments received from our customers </h5>
         
       
<main class="text-center py-5">

  
            
            
            
            
            
            
            
            
           
  
<div style="width: 80rem; top: 20%;  ">
    <table class="table table-striped table-dark"> <tr>
	 <thead  class="thead-dark">
             
             <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
  <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884" user="sql2334884" password="nT9*uE7%"/>
  <sql:query dataSource="${dataSource}" var="result">
                SELECT Nom , Prenom , Message FROM feedback
             
  </sql:query>            
   
	 
    <tr> <th scope="col" class="text-white"><i class="fa fa-user" aria-hidden="true"></i>  First Name </th> 
    	 <th scope="col" class="text-white"><i class="fa fa-user" aria-hidden="true"></i>  Last Name </th>
    	 
    	 <th scope="col" class="text-white"><i class="fa fa-comments" aria-hidden="true"></i>  Message </th>

    

    </tr> </thead> 
<c:forEach var="row" items="${result.rows}">
<tr>
     
                          <tr>  
                               
                               <td   class="text-white"><c:out value="${row.Nom}"/></td>  
                               <td   class="text-white"><c:out value="${row.Prenom}"/></td>  
                               
                               <td   class="text-white"><c:out value="${row.Message}"/></td>  
                           
                          </tr>  
                          
  <div class="container">
    <div class="row">
      <div class="col-md-12">

       

      </div>
    </div>
  </div>

</main>
</c:forEach>
   <style type="text/css">
  @import "https://use.fontawesome.com/releases/v5.5.0/css/all.css";
    

      body {
    margin: 5px;
    padding: 5px;
    font-family: sans-serif;
    
    background-size: cover ;
      
   

}


    
    
    
 
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
</table>                          
<tbody> 
        
            
          </div>
        </div>
      </div>
    </div>
  </div>

</header>

</html>

