<%-- 
    Document   : Insert
    Created on : 16 avr. 2020, 00:18:00
    Author     : user
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
         <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
         <%@include file="dbConnection.jsp" %>   
         <sql:update dataSource="${dataSource}" var="result" >
               insert into ticket_support(id_client,message,etat_ouverture,reponse) VALUES(?,?,?,?)
               <sql:param value="10" />
               <sql:param value="${param.message}" /> 
               <sql:param value="1" />
               <sql:param value="null" /> 
         </sql:update>
               <c:if test="${result>=1}">
                   <c:redirect url="index_client_contact_us.jsp" >
                       <c:param name="susMsg" value="Congratulations ! Data inserted successfully" />
                   </c:redirect>
               </c:if>
           
    
    
    </body>
</html>
