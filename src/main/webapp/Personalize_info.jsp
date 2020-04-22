<%-- 
    Document   : Personalize_info
    Created on : 22 avr. 2020, 20:47:41
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver"
                       	url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                       	user="sql2334884"  password="nT9*uE7%"/>
    	<sql:query dataSource="${dataSource}" var="result">
        	SELECT * from Client where id= 125 
    	</sql:query>
                <c:set var="idd" value="${param.id}"/>
        <sql:update dataSource="${dataSource}" var="count">
        	UPDATE Client SET nom=?, prenom=?, email=?, adresse=? 
                WHERE id='${param.id}'
        	<sql:param value="${param.nom}" />
        	<sql:param value="${param.prenom}" />
                <sql:param value="${param.email}" />
                <sql:param value="${param.adresse}" />
        </sql:update>
                
        
        
        
        
        
      <div class="container">
      <div class="row">
      <div class="col-md-5  toppad  pull-right col-md-offset-3 ">

      </div>
          
        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad" >
            
          <div class="panel panel-info">
            <div class="panel-heading">
              <h3 class="panel-title">Compte</h3>
            </div>
            <div class="panel-body">
              <div class="row">
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="test.png" class="img-circle img-responsive"> </div>
                
                <div class=" col-md-9 col-lg-9 "> 
                  <table class="table table-user-information">
                    <tbody>
                      <tr>
                        <td>Nom</td>
                        <c:forEach var="row" items="${result.rows}">
                        <td><c:out value="${row.nom}"/></td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <td>Prenom </td>
                        <c:forEach var="row" items="${result.rows}">
                        <td><c:out value="${row.prenom}"/></td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <td>E-mail</td>
                        <c:forEach var="row" items="${result.rows}">
                        <td><c:out value="${row.email}"/></td>
                        </c:forEach>
                      </tr>
                      <tr>
                        <td>Adresse</td>
                        <c:forEach var="row" items="${result.rows}">
                        <td><c:out value="${row.adresse}"/></td>
                        </c:forEach>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
                 <div class="panel-footer">
                            <button type="button" class="btn btn-warning" onclick="myFunction()">Edit</button>
                        
                            <div id="myDIV">
                                <div class="row centered-form">
                                <div class="col-xs-9 col-md-7 col-sm-offset-2 ">
                                <form role="form" action="Personalize_info.jsp" method="post">
                                    <c:forEach var="row" items="${result.rows}">
                                    <input type="hidden" class="form-control" id="id" name="id" value="${row.id}"  required>
                                   
                                    <input type="text" name="nom"  class="form-control input-sm" placeholder="Votre Nom" value="${row.nom}">
                                   <br>
                                   <input type="text" name="prenom"  class="form-control input-sm" placeholder="Votre Prenom" value="${row.prenom}">
                                   <br>
                                   <input type="email" name="email"  class="form-control input-sm" placeholder="Votre E-mail" value="${row.email}">
                                   <br>
                                   <input type="text" name="adresse"  class="form-control input-sm" placeholder="Votre Adresse" value="${row.adresse}">
                                   <br>
                                   <input type="submit" value="Enregistrer" class="btn btn-info btn-block">
                                   <br>
                                   </c:forEach>
                                 </form>
                                    
                                </div>
                                    </div>
                    </div>
                            <div>
                            <c:if test="${count>=1}">
                                <c:redirect url="Personalize_info.jsp" >
                       <c:param name="susMsg" value="Congratulations ! Data updated successfully" />
                   </c:redirect>
        	    	 
    	</c:if>
                            </div>
                    </div>
            
          </div>
        </div>
      </div>
    </div>
        <style>



            
        #myDIV {
         display: none;
         
        }


.user-row:last-child {
    margin-bottom: 0;
}

.dropdown-user {
    margin: 13px 0;
    padding: 5px;
    height: 100%;
}

.dropdown-user:hover {
    cursor: pointer;
}

.table-user-information > tbody > tr {
    border-top: 1px solid rgb(221, 221, 221);
}

.table-user-information > tbody > tr:first-child {
    border-top: 0;
}


.table-user-information > tbody > tr > td {
    border-top: 0;
}
.toppad
{margin-top:20px;
}

        </style>
        <script>
            $(document).ready(function() {
    var panels = $('.user-infos');
    var panelsButton = $('.dropdown-user');
    panels.hide();

    //Click dropdown
    panelsButton.click(function() {
        //get data-for attribute
        var dataFor = $(this).attr('data-for');
        var idFor = $(dataFor);

        //current button
        var currentButton = $(this);
        idFor.slideToggle(400, function() {
            //Completed slidetoggle
            if(idFor.is(':visible'))
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-up text-muted"></i>');
            }
            else
            {
                currentButton.html('<i class="glyphicon glyphicon-chevron-down text-muted"></i>');
            }
        })
    });


    $('[data-toggle="tooltip"]').tooltip();

    $('button').click(function(e) {
        e.preventDefault();
        alert("This is a demo.\n :-)");
    });
});

function myFunction() {
  var x = document.getElementById("myDIV");
  if (x.style.display === "none") {
    x.style.display = "block";
  } else {
    x.style.display = "none";
  }
}
        </script>
    </body>
</html>
