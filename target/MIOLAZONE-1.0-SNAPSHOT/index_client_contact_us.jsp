<%-- 
    Document   : index
    Created on : 17 avr. 2020, 16:10:11
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
       
        <script>
            function confirmGo(m,u){
                if(confirm(m)){
                    window.location=u;
                }
            }
            
       
	    $(document).ready(function(){
		$("#alertformvalidator").hide(10000);
	    })
        </script>
    </head>
    <body>
 
        <div class="container-fluid">
            <%@include file="dbConnection.jsp" %>
            
               <!-- test -->
               
               
               <!-- Fin test -->
            
            <div class="jumbotron text-center" > 
                <h1>Contact Us</h1>
                
            </div>
            
            
            <br><br>
            <div class="row">
                <!-- Ajouter Ticket -->
	        <div  class="col-sm-4 ">
                    <button href="#demo" data-toggle="collapse" class="btn btn-info" style="width: 15em;"><i class="fa fa-plus" aria-hidden="true"  ></i>  Add a Ticket </button>  
                  <br><br>
                  <div  id="demo" class="collapse ">
                    <form action="Insert_client_contact_us.jsp" method="post">

                                <div class="form-group">
                                    <div class="input-group mb-2">
                                        <div class="input-group-prepend">
                                            <div class="input-group-text"><i class="fa fa-comment text-info"></i></div>
                                        </div>
                                        <textarea class="form-control" id="message" name="message" placeholder="Message" required></textarea>
                                    </div>
                                </div>

                                <div class="text-center">
                                    <input type="submit" value="Add" id="add" class="btn btn-info btn-block rounded-0 py-2">
                                </div>
                           
                    </form> 
                  </div> 
                  <br>
                  <c:if test="${not empty param.susMsg}">
                    <div class="alert alert-success" id="alertformvalidator">
                       <strong>Success!</strong> <c:out value="${param.susMsg}"/>
        
                    </div>
                  </c:if>
                  
                </div>
                
                <!-- Fin D'ajout -->
                
                <!-- Tableau D'affichage -->
                <div class=" col-sm-8 ">
                    <sql:query dataSource="${dataSource}" var="result" >
                         select * from ticket_support where id_client=? and reponse=?
                         <sql:param value="10" />
                         <sql:param value="null" />
                    </sql:query>
                    <div id="accordion">

                       <div class="card">
                           <div class="card-header" style="background-color: black;">
                             <a class="card-link" data-toggle="collapse" href="#collapseOne" style="color: white; ">
                                 Check Messages
                             </a>
                          </div>
                          <div id="collapseOne" class="collapse show" data-parent="#accordion">
                             <div class="card-body">
                                  <table class="table table-striped custab">
                                     <thead>   
                                        <tr>
                                          <th>Message</th>
                                          
                                          <th class="text-center">Action</th>
                                        </tr>
                                     </thead>
                                       <c:forEach var="row" items="${result.rows}">
                                        <tr>
                                          <td><c:out value="${row.message}"/></td>
                                         
                                          <td class="text-center"><a href="update_form_client_contact_us.jsp?id=<c:out value="${row.id}"/>" ><button class='btn btn-info btn-xs' data-id="<c:out value="${row.id}"/>" data-toggle="modal" data-target="#myModal" ><i class="fa fa-wrench" aria-hidden="true"></i> Edit</button></a>  <a href="javascript:confirmGo('Sure to delete this record?','delete_client_contact_us.jsp?id=<c:out value="${row.id}"/>')" ><button  class="btn btn-danger btn-xs" id="delete_button" data="<c:out value="${row.id}"/>"  ><i class="fa fa-trash" aria-hidden="true"></i> Del</button></a></td>
                                        </tr>
                                       </c:forEach>
                                  </table>
                             </div>
                          </div>
                       </div>
                        
                        <sql:query dataSource="${dataSource}" var="result" >
                            select * from ticket_support where id_client=? and reponse!=?
                            <sql:param value="10" />
                            <sql:param value ="null" />
                        </sql:query>
                       <div class="card">
                           
                          <div class="card-header" style="background-color: black;">
                             <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo" style="color: white;">
                                Check Answers
                             </a>
                          </div>
                          <div id="collapseTwo" class="collapse" data-parent="#accordion">
                             <div class="card-body">
                                  <table class="table table-striped custab">
                                     <thead>     
                                        <tr>
                                          <th>Message</th>
                                          <th>Response</th>
                                          
                                        </tr>
                                     </thead> 
                                       <c:forEach var="row" items="${result.rows}">
                                        <tr>
                                          <td><c:out value="${row.message}"/></td>
                                          <td><c:out value="${row.reponse}"/></td>
                                         
                                        </tr>
                                       </c:forEach>
                                  </table>
                             </div>
                          </div>
                       </div>
                    </div>

                       
       
                   
                </div>
                <!-- Fin Tableau D'affichage -->
                
                <!-- Fomulaire de modification -->
                
                
                <!--Fin de formulaire -->
            </div>
        </div>
    </body>
</html>
