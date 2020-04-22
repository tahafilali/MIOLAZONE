<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <title>Panier - Affichage</title>
        <script>
            function confirmGo(m, u) {
                if (confirm(m)) {
                    window.location = u;
                }
            }
        </script>
        <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from panier
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
                <div class="row" style="margin:5px">
                    <div class="col-md-7"></div>
                    
                    <div class="col-md-5">
                        <a href="ajouterProduitPanier.jsp">
                            <button type="button" class="btn btn-success">Ajouter un produit au panier</button>
                        </a>
                        
                        <a href="javascript:confirmGo('Voulez vous vraiment vider le panier ?','ViderPanier.jsp')">
                            <button type="button" class="btn btn-warning">Vider le panier</button>
                        </a>
                    </div>
                    
                    
                </div>
               
        <form>
            <table class="table" style="text-align: center">
                <caption>Liste des Produits dans le panier</caption>
                <tr>
                    <th>ID</th>
                    <th>Client</th>
                    <th>Produit</th>
                    <th>Quantite</th>
                    <th>Prix total unitaire</th>
                    <th colspan="2">Action</th>
                </tr>
                <c:set var="prix_total" value="${0}"/>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.id}"/></td>
                        <!-- Affichage du nom du client depuis l'ID-->
                        <sql:query dataSource="${dbsource}" var="resultClient">
                              SELECT nom from Client where id = ${row.id_client}
                        </sql:query>
                        <c:forEach var="rowClient" items="${resultClient.rows}">
                        <td><c:out value="${rowClient.nom}"/></td>
                        </c:forEach>
                        
                        <!-- Affichage du nom du produit depuis l'ID-->
                        <sql:query dataSource="${dbsource}" var="resultProduit">
                              SELECT nom,prix from produit where id = ${row.id_produit}
                        </sql:query>
                              
                        <c:forEach var="rowProduit" items="${resultProduit.rows}">
                        <c:set var="prix_unitaire" value="${rowProduit.prix}"/>
                        <td><c:out value="${rowProduit.nom}"/></td>
                        </c:forEach>
                        
                        
                        
                        <td><c:out value="${row.quantite}"/></td>
                        
                        <c:set var="id" value="${row.id_client}"/>
                        <c:set var="quantite" value="${row.quantite}"/>
                        <c:set var="prix_totale_unitaire" value="${prix_unitaire * quantite}"/>
                        <c:set var="prix_total" value="${prix_total + prix_totale_unitaire}"/>
                        <td><c:out value="${prix_totale_unitaire}"/></td>
                               
                        
                        <td><a href="updateProduitPanier.jsp?id=<c:out value="${row.id}"/>"><button type="button" class="btn btn-primary">Modifier</button></a></td>
                        <td><a href="javascript:confirmGo('Voulez vous vraiment supprimer ce produit du panier ?','DeleteProduitPanier.jsp?id=<c:out value="${row.id}"/>')"><button type="button" class="btn btn-danger">Supprimer</button></a></td>
                    </tr>
                        
                </c:forEach>
            </table>
        </form>
                
                
                <div class="row" style="text-align: center; margin: auto">
                    
                    <div class="col-md-12">
                        <h3>Prix Total de tous les produits : <c:out value="${prix_total}"/></h3>
                    </div>
                </div>

                <!-- button checkout -->
                <div>
					<form action="checkout.jsp" method="post">
                		<input type="hidden" value="${id}" name="idClient"> <!-- Récupération de l'id cient -->
                		<input type="hidden" value="${prix_total}" name="prixTotal"> <!-- Récupération du prix total -->
                		<input class="col-md-12 btn btn-success" type="submit" value="Checkout">
                	</form>
                </div>
                
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>