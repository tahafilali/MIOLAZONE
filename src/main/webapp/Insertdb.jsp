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
        <c:if test="${empty param.nom or empty param.quantite or empty param.prix}">
                <c:redirect url="Ajout.jsp" >
                    <c:param name="errMsg" value="Veuillez saisir le Code, le Nom et la Quantité du Produit" />
                </c:redirect>
        </c:if>
                   <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO produit(nom, quantité,prix,id_categorie) VALUES (?,?,?,?)
                <sql:param value="${param.nom}" />
                <sql:param value="${param.quantite}" />
                <sql:param value="${param.prix}" />
                <sql:param value="${param.id_categorie}" />
        </sql:update>
        <c:if test="${result>=1}">
                <font size="5" color='green'> Congratulation ! Data inserted successfully.</font>
                <c:redirect url="Ajout.jsp" >
                    <c:param name="susMsg" value="Congratulation ! Data inserted successfully." />
                </c:redirect>
        </c:if>
    </body>
</html>
