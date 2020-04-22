<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<body>
<sql:setDataSource
        var="conn"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
        user="sql2334884" password="nT9*uE7%"
    />
<sql:query var="listProducts"   dataSource="${conn}">
        SELECT * FROM panier;
    </sql:query>
    
    <!-- Import la navbar -->
		<jsp:include page="navbar.jsp" />
	<!-- Fin navbr -->  
	    
<div class='container'>
    <div class='row' style='padding-top:25px; padding-bottom:25px;'>
        <div class='col-md-12'>
            <div id='mainContentWrapper'>
                <div class="col-md-8 col-md-offset-2">
                    <h2 style="text-align: center;">
                        Vérifier votre commande et terminer l'achat
                    </h2>
                    <hr/>
                    <a href="panier.jsp" class="btn btn-info" style="width: 100%;">Ajouter d'autre produits</a>
                    <hr/>
                    <div class="shopping_cart">
                        <form class="form-horizontal" role="form" action="" method="post" id="payment-form">
                            <div class="panel-group" id="accordion">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Vérifier votre commande</a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                            <div class="items">
                                                <div class="col-md-9">
                                                	<table class="table table-striped">
                                                	<tr>
													    <th>Produit</th>
													    <th>Qte</th>
													    <th>PrixU</th>
													    <th></th>
													</tr> 
											            <c:forEach var="row" items="${listProducts.rows}">
											            <sql:query dataSource="${conn}" var="resultProduit">
							                              SELECT nom,prix from produit where id = ${row.id_produit}
							                        </sql:query>
							                          
							                        <c:forEach var="rowProduit" items="${resultProduit.rows}">
							                        <c:set var="prix_unitaire" value="${rowProduit.prix}"/>
							                        <tr>
							                        	<td><c:out value="${rowProduit.nom}"/></td>
							                        	<td><c:out value="${row.quantite}"/></td>
							                        	<td><c:out value="${prix_unitaire}"/></td>
							                        	
							                        	<td><a class="btn btn-warning btn-sm pull-right"
                                                                   href="panier.jsp"
                                                                   title="Supprimer">X</a></td>
							                        </tr>
							                        </c:forEach>
											             </c:forEach>
											        </table>
                                                </div>
                                                <div class="col-md-3">
                                                    <div style="text-align: center;">
                                                        <h3>Total</h3>
                                                        <h3><span style="color:green;">
                                                        <%= request.getParameter("prixTotal") %> dhs
                                                        </span></h3>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            </form>
                            </div>
                            	<hr>
                            	<form action="success.jsp" method="post">
                            		<p style="color:green;">Votre id est: <%= request.getParameter("idClient") %><p>
                            		<input type="hidden" name="iddClient" value="<%= request.getParameter("idClient") %>">
                            		<input type="submit" class="btn btn-success" style="width: 100%;" value="Valider la commande">
                            	</form>
                            	
                            </div>
                            </div>
                            </div>
                            </div>
                            </div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>


