<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <title>Insérer produit dans le panier</title>
    </head>
    <body>
        <c:if test="${empty param.produit or empty param.quantite or empty param.client}">
                <c:redirect url="ajouterProduitPanier.jsp" >
                    <c:param name="errMsg" value="Veuillez choisir le produit, le client et la quantité" />
                </c:redirect>
        </c:if>
                   <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
                   
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO panier(id_produit, id_client, quantite) VALUES (?,?,?)
                <sql:param value="${param.produit}" />
                <sql:param value="${param.client}" />
                <sql:param value="${param.quantite}" />
        </sql:update>
        <c:if test="${result>=1}">
                <font size="5" color='green'> Bravo! le produit est ajouté au panier.</font>
                <c:redirect url="panier.jsp" >
                    <c:param name="susMsg" value="Bravo! le produit est ajoute au panier." />
                </c:redirect>
        </c:if>
    </body>
</html>
