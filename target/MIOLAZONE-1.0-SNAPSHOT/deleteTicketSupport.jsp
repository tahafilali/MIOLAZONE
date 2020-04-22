<%-- 
    Document   : deleteTicketSupport
    Created on : 18 avr. 2020, 17:19:16
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Ticket support</title>
    </head>
    <body>
        <sql:update dataSource="${dbSource}" var="count">
            delete from ticket_support where id=${param.id}
        </sql:update>
        <c:if test="${count>=1}">
            <c:set var="result" value="ok"/>    	
        </c:if>
        <c:if test="${count<1}">
            <c:set var="result" value="not ok"/>    	
        </c:if>

            <script>
                window.location.href="displayTickets.jsp?result=<c:out value="${result}"/>";
            </script>
    </body>
</html>
