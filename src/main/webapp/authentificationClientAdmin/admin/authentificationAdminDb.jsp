<%-- 
    Document   : authentificationAdminDb
    Created on : 22 avr. 2020, 11:04:05
    Author     : saraz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>

        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from admin where email=? and password=?
            <sql:param value="${param.email}"/>
            <sql:param value="${param.password}"/>
        </sql:query>

        <c:if test="${empty param.email or empty param.password}">
            <c:redirect url="authentificationAdmin.jsp">
                <c:param name="errMsg" value="Veuillez saisir toutes les informations !" />
            </c:redirect>
        </c:if>

        <c:if test="${result.rowsByIndex[0][0]== 1}">
            <c:redirect url="menuAdmin.jsp"/>
        </c:if>

        <c:if test="${result.rowsByIndex[0][0]==0}">
            <c:redirect url="authentificationAdmin.jsp">
                <c:param name="errMsg" value="Utilisateur introuvable !" />
            </c:redirect>
        </c:if>

    </body>
</html>
