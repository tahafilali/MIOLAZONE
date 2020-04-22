<%-- 
    Document   : reponseTicketdb
    Created on : 18 avr. 2020, 14:58:00
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update DB</title>
    </head>
    <body>
        <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:update dataSource="${dbSource}" var="count">
            UPDATE ticket_support SET reponse = ?
            WHERE id = ${param.id}
            <sql:param value="${param.reponse}" />
        </sql:update>
        <c:if test="${count>=1}">
            <script>
                window.location.href = "displayTickets.jsp?ack=1";
            </script>
        </c:if>
        <c:if test="${count<1}">
            <script>
                window.location.href = "displayTickets.jsp?ack=0";
            </script>
        </c:if>
    </body>
</html>
