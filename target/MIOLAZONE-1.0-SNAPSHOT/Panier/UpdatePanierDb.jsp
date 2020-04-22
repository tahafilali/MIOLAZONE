<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier le produit dans le panier</title>
    </head>
    <body>
                <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
                
        <c:set var="id" value="${param.id}"/>
        
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE panier SET quantite=?
            WHERE id= ${id}
            <sql:param value="${param.quantite}" />
        </sql:update>
        <c:if test="${count>=1}">
            <font size="5" color='green'> Bravo! Produit Modifie</font>        
                <c:redirect url="panier.jsp" >
                    <c:param name="susMsg" value="Bravo! le produit est modifie." />
                </c:redirect>
        </c:if>

    </body>
</html>
