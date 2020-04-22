<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
	<head>
    	<title>Résultat catégorie</title>
	</head>
	<body>
    	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                       	url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                       	user="sql2334884"  password="nT9*uE7%"/>
           <sql:query dataSource="${dbsource}" var="result">
                  SELECT nom,prix from produit where id_categorie=${param.select}
           </sql:query>
	<center>
    	<form>
        	<table border="1" width="40%">
            	<caption>Liste des Produits</caption>
            	<tr>
                	<th>Nom du produit</th>
                	<th>prix</th>
                        <c:forEach var="row" items="${result.rows}">
                	<tr>
                    	<td><c:out value="${row.nom}"/></td>
                    	<td><c:out value="${row.prix}"/></td> 	
                        <td><a href=""/> Ajouter au panier </a></td>
                	</tr>
            	</c:forEach>

            	</tr>
        	</table>
    	</form>
    	<a href="produit.jsp">Go Home</a>
	</center>
</body>
</html>