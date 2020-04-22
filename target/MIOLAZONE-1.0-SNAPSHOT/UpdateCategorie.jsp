<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
                <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <c:set var="idd" value="${param.id}"/>
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE categorie SET nom=?, description=?
            WHERE id= ${param.id}
            <sql:param value="${param.nom}" />
            <sql:param value="${param.description}" />
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'> Congratulations ! Data updated
            successfully.</font>         
        </c:if>
    </body>
</html>
