<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
    <head>
        <title>Panier - Ajouter un produit</title>
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
            SELECT * from produit
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
        <a class="nav-link" href="panier.jsp">Gérer mon panier</a>
      </li>
    </ul>
    
  </div>
</nav>
               
                <div class="row" style="text-align: center; margin: auto">
                    
                    <div class="col-md-12">
                        <h3>Ajouter un produit dans le panier</h3>
                    </div>
                </div>
               
        <form action="insertProduitPanier.jsp" method="post">
          <div class="form-group">
                        <h2>Ajout d'un produit dans le panier</h2>
                      <label>Nom Produit</label>
                      <sql:query dataSource="${dbsource}" var="resultProduit">
                        SELECT * from produit
                        </sql:query>
                      <select class="form-control" name="produit">
                                        <c:forEach var="row" items="${resultProduit.rows}">
                                            <option value="<c:out value="${row.id}"/>"><c:out value="${row.nom}"/></option>
                                        </c:forEach>
                            </select>
          </div>
            
          <div class="form-group">
                        <label>nom Client</label>
                        <sql:query dataSource="${dbsource}" var="resultClient">
                        SELECT * from Client
                        </sql:query>
                              <select class="form-control" name="client">
                                        <c:forEach var="row" items="${resultClient.rows}">
                                            <option value="<c:out value="${row.id}"/>"><c:out value="${row.nom}"/></option>
                                        </c:forEach>
                            </select>
                    </div>
            
        <div class="form-group">


         <label>Quantité</label>
         <input class="form-control" type="text" name="quantite"/>
        </div>
            
                    
              <div class="form-group">
                  <button type="submit" class="btn btn-success">Ajouter</button>
                  <button type="reset" class="btn btn-secondary">Réinitialiser</button>
                        
              </div>
        </form>
        <font color="red">
            <c:if test="${not empty param.errMsg}">
                    <c:out value="${param.errMsg}" />
            </c:if>
        </font>      
        
        <font color="green">
            <c:if test="${not empty param.susMsg}">
                    <c:out value="${param.susMsg}" />
            </c:if>
        </font>
                
              
                
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
</html>
