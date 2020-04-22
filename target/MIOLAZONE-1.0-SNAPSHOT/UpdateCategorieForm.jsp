<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    </head>
    <body>
            <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from categorie where id=?
            <sql:param value="${param.id}" />
        </sql:query>
            <div class="container">
                <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">E-commerce</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="Ajout.jsp">Ajouter Produit</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="AjoutCategorie.jsp">Ajouter Catégories</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Affichage.jsp">Afficher les produits</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Categories.jsp">Afficher les categories</a>
      </li>
   
      
    </ul>
    
  </div>
</nav>
        <form action="UpdateCategorie.jsp" method="post">
           
                <h1>Update Catégorie</h1>
               
                <c:forEach var="row" items="${result.rows}">
                   
                    <input type="hidden" value="${param.id}" name="id"/>
                    <div class="form-group">
                            <input class="form-control" type="text" value="${row.nom}" name="nom"/>
                     </div>
                     <div class="form-group">
                         <input class="form-control" type="text" value="${row.description}" name="description"/>
                        </div>
   
                </c:forEach>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
        </form>
                </div>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>
</html> 