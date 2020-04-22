<%-- 
    Document   : Clients
    Created on : 18 avr. 2020, 21:27:42
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">  
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.css">  
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
        
          <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884" user="sql2334884" password="nT9*uE7%" />  

    </head>    
    <body>  
        <c:if test="${not empty param.deleted}">
                 <div class="alert alert-success alert-dismissible">
                  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                  <strong>Success!</strong> Client has been Deleted.
                </div>
        </c:if>
        <c:if test="${!empty param.id}">
              <c:set var="idd" value="${param.id}"/>
              <sql:update dataSource="${dbSource}" var="count">
        	UPDATE Client SET nom=?, prenom=?,email=?,adresse=?,password=?
        	WHERE id= ${param.id}
        	<sql:param value="${param.nom}" />
        	<sql:param value="${param.prenom}" />
                <sql:param value="${param.email}" />
                <sql:param value="${param.adress}" />
                <sql:param value="${param.password}" />
              </sql:update>
              <c:if test="${count>=1}">
                <div class="alert alert-success alert-dismissible">
                  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                  <strong>Success!</strong> Client ${param.id} has been updated.
                </div>

             </c:if> 
    	</c:if>

           <sql:query var="users" dataSource="${dbSource}"> 
                  select* from Client;
                  </sql:query> 
  
        <div class="container mb-3 mt-3">  
            
            <h2 style="text-align : center ; color: #ffffff;background-color:#009999 ; padding:12px; ">Users account management page</h2>
            <table class="table table-striped table-bordered table-sm mydatatable" style="width: 100%"> 
                <thead>  
                     <tr> 
                        <th>ID</th> 
                        <th>Nom</th> 
                        <th>Prenom</th> 
                        <th>Email</th> 
                        <th>Adress</th> 
                        <th>Password</th>  
                      
                        <th>Action</th>
                   </tr>
                </thead> 
                <tbody> 
              <c:forEach var="row" items="${users.rows}"> 
                  <tr><td><c:out value="${row.id}" /></td> <td><c:out value="${row.nom}" /></td> 
                      <td><c:out value="${row.prenom}" /></td><td><c:out value="${row.email}" /></td>
                      <td><c:out value="${row.adresse}" /></td><td><c:out value="${row.password}" /></td>
             <!--         <td><a  type="button" class="btn btn-danger"  href="javascript:confirmGo('Do you want to block this user ?','block.jsp?id=<c:out value="${row.id}"/>')">Block</a></td></tr> -->  
                      <td><a  type="button" class="btn btn-danger" href="javascript:toAlertModal('block.jsp?id=<c:out value="${row.id}"/>')"  data-toggle="modal" data-target="#myModal<c:out value="${row.id}"/>">DELETE</a> 
                          <a type="button"   data-toggle="modal" data-target="#myModal1<c:out value="${row.id}"/>"   class="btn btn-info" >UPDATE</a>
                      </td>   
                   
                      <!-- Alert of Blocking confirmation for each user -->
                             
         <div id="myModal<c:out value="${row.id}"/>" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#xE5CD;</i>
				</div>				
				<h4 class="modal-title">Are you sure?</h4>	
                          
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
				<p>Do you really want to block this account.</p>
			</div>
			<div class="modal-footer">
			                    <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
		
                                            <a  id="block"href="block.jsp?id=<c:out value="${row.id}"/>" type="button" class="btn btn-danger">Block</a>
			</div>
		               </div>
	                               </div>
     
         </div>       
              
              <!-- update --> 
               <div id="myModal1<c:out value="${row.id}"/>" class="modal fade">
	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">
				<div class="icon-box">
					<i class="material-icons">&#xE5CD;</i>
				</div>				
				<h4 class="modal-title">Update Account</h4>	
                          
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
			
                            <form action="Clients.jsp" method="post" >
                                                                            
                                                                                <div class="form-group">
                                                                                    <label for="nom" style="width : 90px">Nom :</label>
                                                                                    <input type="text" name="nom" id="nom" value="${row.nom}" class="text-center"/> 
                                                        
                                                                                </div> 
                                                                                       <div class="form-group">
                                                                                    <label for="prenom" style="width : 90px">Prenom :</label>
                                                                                    <input type="text" name="prenom" id="prenom"  value="${row.prenom}" class="text-center"/> 
                                                        
                                                                                </div> 
                                                                                        <div class="form-group">
                                                                                            <label for="email" style="width : 90px">Email :</label>
                                                                                    <input type="text" name="email" id="email" value="${row.email}" class="text-center"/> 
                                                         
                                                                                </div> 
                                                                                        <div class="form-group">
                                                                                            <label for="adress" style="width : 90px">Adress :</label>
                                                                                    <input type="text" name="adress" id="adress" value="${row.adresse}" class="text-center"  /> 
                                                         
                                                                                </div> 
                                                                                        <div class="form-group">
                                                                                            <label for="password" style="width : 90px">Password :</label>
                                                                                    <input type="text" name="password" id="password" value="${row.password}" class="text-center" /> 
                                                        
                                                                                </div>
                                                                                 <input type="submit" id="submit-form${row.id}" style="visibility: hidden"/>
                                                                                 <input type="hidden" value="<c:out value="${row.id}"/>" name="id"/>
                                                                                 
                                                                            </form>
                                                                                     
                            
                            
                            
                            
                            
                            
                            
                            
			</div>
			<div class="modal-footer">
			            <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
                                    <label class="btn btn-info" for="submit-form${row.id}" style="margin-top : 8px;">Update</label>                                                                               
			</div>
		               </div>
	                               </div>
     
         </div>     
                                    <!------------------------------------------------------------ -->
              
              
          
                  </tr>                                                                                                                                                                                       
                  
                     </c:forEach> 
    
                </tbody> 
                       <tfoot> 
                              </tfoot>
                                    </table> 
           
                                             </div>
                                                  <h1 id="test"></h1>
        
        

        
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" ></script>  
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"> </script> 
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script> 

         <script>  

             $('.mydatatable').DataTable();  
               
                	function confirmGo(m, u) {
            	if (confirm(m)) {
                	window.location = u;
            	}
        	}  
                
                function toAlertModal(a){ 
                     
                     Document.getElementById("block").href= s ;    
                            
                      
          
                }  
               

         </script>
   
         <!-- Alert Modal -->  
  
         
         
        <div  class="container mb-4 mt-3">
        <form>
            <input class="btn btn-info" style="   
             width: 300px;
                padding: 10px;;" type="button" value="Go back!" onclick="history.back()">
            <a type="button"   data-toggle="modal" data-target="#myModal3"   class="btn btn-info" >About this page</a>

        </form>
             
        </div>
                  <div id="myModal3" class="modal fade">

         	<div class="modal-dialog modal-confirm">
		<div class="modal-content">
			<div class="modal-header">				
				<h4 class="modal-title">This web page created by :</h4>	
                          
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
			</div>
			<div class="modal-body">
                            <p>Talhi Mohammed , Yassine Boujnah , Omar Quaos</p>
			</div>
			<div class="modal-footer">
			                    <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
			</div>
		               </div>
	                               </div>
                  </div>
    </body>
</html>
