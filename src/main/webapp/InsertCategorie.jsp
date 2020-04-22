<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <title>INSERT Operation</title>
    </head>
    <body>
        <c:if test="${empty param.nom or empty param.description}">
                <c:redirect url="AjoutCategorie.jsp" >
                    <c:param name="errMsg" value="Veuillez saisir le Nom et la Description de la categorie" />
                </c:redirect>
        </c:if>
                   <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO categorie(nom, description) VALUES (?,?)
                <sql:param value="${param.nom}" />
                <sql:param value="${param.description}" />
        </sql:update>
        <c:if test="${result>=1}">
                <font size="5" color='green'> Congratulation ! Data inserted successfully.</font>
                <c:redirect url="AjoutCategorie.jsp" >
                    <c:param name="susMsg" value="Congratulation ! Data inserted successfully." />
                </c:redirect>
        </c:if>
    </body>
</html>
