<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <title>SELECT Operation</title>
        <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
        <script>
            function confirmGo(m, u) {
                if (confirm(m)) {
                    window.location = u;
                }
            }
        </script>
    </head>
    <body>
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
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from categorie
        </sql:query>
    <center>
        <form>
            <table class="table">
                <caption>Liste des Categories</caption>
                <tr>
                    <th>Code catégorie</th>
                    <th>Nom de la catégorie</th>
                    <th>Description</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.id}"/></td>
                        <td><c:out value="${row.nom}"/></td>
                        <td><c:out value="${row.description}"/></td>
                        <td><a href="UpdateCategorieForm.jsp?id=<c:out value="${row.id}"/>">Update</a></td>
                        <td><a href="javascript:confirmGo('Voulez vous vraiment supprimer ce produit ?','DeleteCategorie.jsp?id=<c:out value="${row.id}"/>')">Delete</a></td>

                    </tr>
                </c:forEach>
            </table>
        </form>
    </center>
            </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
