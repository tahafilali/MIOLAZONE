<%-- 
    Document   : updateEtatTicket
    Created on : 18 avr. 2020, 15:19:50
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
        <title>Update Etat</title>
    </head>
    <body>
        <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:query dataSource="${dbSource}" var="etat">
            SELECT etat_ouverture FROM ticket_support WHERE id=${param.id}
        </sql:query>
        <c:forEach var="rows" items="${etat.rows}">
            <c:if test="${rows.etat_ouverture=='false'}">
                <sql:update dataSource="${dbSource}" var="count">
                    UPDATE ticket_support SET etat_ouverture=1
                    WHERE id = ${param.id}
                </sql:update>
            </c:if>
            <c:if test="${rows.etat_ouverture=='true'}">
                <sql:update dataSource="${dbSource}" var="count">
                    UPDATE ticket_support SET etat_ouverture=0
                    WHERE id = ${param.id}
                </sql:update>
            </c:if>
        </c:forEach>
        <script>
            window.location.href = "displayTickets.jsp";
        </script>
    </body>
</html>
