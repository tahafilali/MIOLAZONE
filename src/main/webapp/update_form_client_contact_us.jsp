<%-- 
    Document   : update_form
    Created on : 17 avr. 2020, 21:06:40
    Author     : user
--%>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
       
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
       
    </head>
    <body>
      <%@include file="dbConnection.jsp" %>
      <div class="container-fluid">
            
          <div class="jumbotron text-center" style="background-color: white;"> </div>
          
        <div class="row">
         
	    
           <div class="col-sm-4"></div>
           <div class="col-sm-4" style="padding: 5%;  box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0 rgba(0, 0, 0, 0.19);">
               
                      <sql:query  dataSource="${dataSource}" var="result">
                          select * from ticket_support where id_client=? and id=?
                          <sql:param value="10" />
                          <sql:param value="${param.id}" />
                      </sql:query>


                    <form action="update_client_contact_us.jsp" method="get">
                             <c:forEach var="row" items="${result.rows}">

                                
                               

                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        
                                        <input type="hidden" class="form-control" id="id" name="id" value="${row.id}"  required></textarea>
                                    </div>
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-comment text-info"></i></div>
                                        </div>
                                        <textarea class="form-control" id="message" name="message" placeholder="${row.message}"  required></textarea>
                                    </div>
                                </div>

                                <div class="text-center">
                                    <input type="submit" value="Update" class="btn btn-info btn-block rounded-0 py-2">
                                </div>
                                 
                             </c:forEach>
                           
                    </form>
               
	       
           </div>
            
             
        </div> 


                
                
                 
                
            
        </div>
        
         
        

   

        
    </body>
</html>
