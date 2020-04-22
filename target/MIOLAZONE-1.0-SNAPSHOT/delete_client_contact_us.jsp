<%-- 
    Document   : delete
    Created on : 17 avr. 2020, 19:25:34
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
            
        <sql:update dataSource="${dataSource}" var="result" >
               
              delete from ticket_support where id_client=? and id=?
              <sql:param value="10"/>
              <sql:param value="${param.id}"/>
         </sql:update>
               <c:if test="${result>=1}">
                   <c:redirect url="index_client_contact_us.jsp" >
                       <c:param name="susMsg" value="Congratulations ! Data deleted successfully" />
                   </c:redirect>
               </c:if>
    </body>
</html>
