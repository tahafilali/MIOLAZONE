<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link type="text/css" rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



	<!-- 


	<c:if test="${empty db }">
		<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://sql2.freemysqlhosting.net/sql2333478?serverTimezone=UTC"
			user="sql2333478" password="xC1*lT2%" scope="application" />
	</c:if>


 -->

	<sql:setDataSource var="db" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://sql2.freemysqlhosting.net/sql2334884" user="sql2334884" password="nT9*uE7%"
		scope="application" />

<div class="container">



		<nav class="navbar navbar-expand-sm bg-dark navbar-dark"> <a
			class="navbar-brand" href="#">E-commerce</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="Ajout.jsp">Ajouter
						Produit</a></li>
				<li class="nav-item"><a class="nav-link"
					href="AjoutCategorie.jsp">Ajouter Catégories</a></li>
				<li class="nav-item"><a class="nav-link" href="Affichage.jsp">Afficher
						les produits</a></li>
				<li class="nav-item"><a class="nav-link" href="Categories.jsp">Afficher
						les categories</a></li>


			</ul>

		</div>
		</nav>




		<center><h1 class="display-4">Listes des commandes</h1></center>

	<sql:query dataSource="${db}" var="res"
		sql="select * from commande where valider = 0" />

	<div id="accordion">


		<c:forEach var="row" items="${res.rows}">
			<div class="card">
				<div class="card-header" id="headingOne${row.id}">
					<h6 class="mb-0">
						<div class="row">
							<div class="col-sm-6">
								<button class="btn btn-link" data-toggle="collapse"
									data-target="#collapseOne${row.id}" aria-expanded="true"
									aria-controls="collapseOne${row.id}">
									<h2>
										commande
										<c:out value="${row.id}"></c:out>
									</h2>
								</button>
							</div>

							<div class="col-sm">
								<form action="admin_controller_gc.jsp" method="POST">
									<input type="hidden" value="${row.id}" name="id"> <input
										type="hidden" value="1" name="valider"> <input
										type="submit" value="Valider" class="btn btn-success btn-lg" />
								</form>
							</div>

							<div class="col-sm">
								<form action="admin_controller_gc.jsp" method="POST">
									<input type="hidden" value="${row.id}" name="id"> <input
										type="hidden" value="-1" name="valider"> <input
										type="submit" value="Rejeter" class="btn btn-danger btn-lg" />
								</form>
							</div>
							<div class="col-sm-3"></div>
						</div>
					</h6>
				</div>

				<sql:query dataSource="${db}" var="ress"
					sql="select ligne_commande.id_lc,ligne_commande.id_produit,produit.nom,ligne_commande.quantite from ligne_commande, produit where ligne_commande.id_produit=produit.id and id_commande=${row.id}"></sql:query>


				<div id="collapseOne${row.id}" class="collapse"
					aria-labelledby="headingOne${row.id}" data-parent="#accordion">

					<div class="card-body">

						<table border="1" class="table table-striped">
							<thead class="thead-dark">
								<tr>
									<th>Id Ligne de commande</th>
									<th>Id produit</th>
									<th>Nom</th>
									<th>Quantite</th>
								</tr>
							</thead>
							<c:forEach var="roww" items="${ress.rows }">
								<tr>
									<td><c:out value="${roww.id_lc}"></c:out></td>
									<td><c:out value="${roww.id_produit}"></c:out></td>
									<td><c:out value="${roww.nom}"></c:out></td>
									<td><c:out value="${roww.quantite}"></c:out></td>
								</tr>
							</c:forEach>

						</table>

					</div>
				</div>
			</div>
		</c:forEach>

	</div>




</div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>





</body>
</html>