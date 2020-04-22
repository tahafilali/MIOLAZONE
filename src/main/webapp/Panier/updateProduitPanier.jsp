<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier un produit du panier </title>
        <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    </head>
    <body>
            <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from panier where id=?
            <sql:param value="${param.id}" />
        </sql:query>
            <div class="container"><nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="#">E-commerce</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="../Ajout.jsp">Ajouter Produit</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../AjoutCategorie">Ajouter Catégories</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../Affichage.jsp">Afficher les produits</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../Categories.jsp">Afficher les categories</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./panier.jsp">Gérer mon panier</a>
      </li>
      
    </ul>
    
  </div>
</nav>
        <form action="UpdatePanierDb.jsp" method="post">
           
                <h1>Modifier un produit du panier</h1>
               
                <c:forEach var="row" items="${result.rows}">
                    
                   <input type="hidden" value="${param.id}" name="id"/>
                   
                        <div class="from-group">
                            <label>Nom du produit</label>
                            <sql:query dataSource="${dbsource}" var="resultProduit">
                              SELECT nom from produit where id = ${row.id_produit}
                            </sql:query>
                            <c:forEach var="rowProduit" items="${resultProduit.rows}">
                            <td></td>
                            <input class="form-control" type="text" value="${rowProduit.nom}" name="client" disabled="disabled"/>

                            </c:forEach>
                        </div>
                        
                        <div class="from-group">
                            <label>Nom de client</label>
                            <sql:query dataSource="${dbsource}" var="resultClient">
                              SELECT nom from Client where id = ${row.id_client}
                            </sql:query>
                            <c:forEach var="rowClient" items="${resultClient.rows}">
                            <td></td>
                            <input class="form-control" type="text" value="${rowClient.nom}" name="client" disabled="disabled"/>

                            </c:forEach>
                        </div>
                        
                        <div class="form-group">
                                 <label>Quantité</label>
                                 <input class="form-control" type="text" value="${row.quantite}" name="quantite"/>
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