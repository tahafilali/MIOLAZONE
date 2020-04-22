<%-- 
    Document   : displayTickets
    Created on : 16 avr. 2020, 21:16:57
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Support</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script>
            function confirmGo(m, u) {
                if (confirm(m)) {
                    window.location = u;
                }
            }
        </script>

    </head>
    <body>
        <c:if test="${param.ack==1}">
            <div class="mx-auto alert alert-success alert-dismissible fade show" role="alert">
                <strong>Félicitations</strong> reponse ajoutée avec success
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <c:if test="${param.ack==0}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <span class="mx-auto"><strong>Erreur !</strong> L'ajout de la réponse a echoué</span>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>

        <c:if test="${param.result=='not ok'}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <span class="mx-auto"><strong>Erreur !</strong> La supression a echoué !</span>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </c:if>
        <sql:query dataSource="${dbSource}" var="result">
            SELECT * from ticket_support
        </sql:query>
        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Support tickets</h5>
                    <table class="table table-dark table-hover">
                        <tr>
                            <th>ID</th>
                            <th>Nom client</th>
                            <th>Message</th>
                            <th>Reponse</th>
                            <th>Etat</th>
                            <th>Actions</th>
                        </tr>
                        <c:forEach var="row" items="${result.rows}">
                            <tr>
                                <td><c:out value="${row.id}"/></td>
                                <td><sql:query dataSource="${dbSource}" var="nomClient">
                                        SELECT nom FROM Client WHERE id=${row.id_client}
                                    </sql:query>
                                    <c:forEach var="ligne" items="${nomClient.rows}">
                                        <c:out value="${ligne.nom}"/>
                                        <c:set var = "name" scope = "session" value = "${ligne.nom}"/>
                                    </c:forEach>
                                </td>
                                <td style="word-wrap: break-word;min-width: 340px;max-width: 340px;"><c:out value="${row.message}"/></td>
                                <td style="word-wrap: break-word;min-width: 340px;max-width: 340px;"><c:out value="${row.reponse}"/></td>
                                <c:set var = "reponse" scope = "session" value = "${row.reponse}"/>
                                <td>
                                    <c:if test="${row.etat_ouverture =='false'}">
                                        <c:out value="Fermé"/>
                                    </c:if>
                                    <c:if test="${row.etat_ouverture =='true'}">
                                        <c:out value="Ouvert"/>
                                    </c:if>
                                </td>
                                <td>
                                    <a  class="btn btn-primary btn-block" href="updateEtatTicket.jsp?id=<c:out value="${row.id}"/>" >Fermer/Ouvrir</a>
                                    <c:if test="${not empty reponse}">
                                        <a class="btn btn-success btn-block" href="repondreTicket.jsp?id=<c:out value="${row.id}"/>&name=<c:out value="${name}"/>&reponse=<c:out value="${reponse}"/>">Modifier</a>
                                    </c:if>
                                    <c:if test="${empty reponse}">
                                        <a class="btn btn-success btn-block" href="repondreTicket.jsp?id=<c:out value="${row.id}"/>&name=<c:out value="${name}"/>&reponse=<c:out value="${reponse}"/>">Répondre</a>
                                    </c:if>
                                    <a class="btn btn-danger btn-block" href="javascript:confirmGo('Voulez vous vraiment supprimer ce produit ?','deleteTicketSupport.jsp?id=<c:out value="${row.id}"/>')">Supprimer</a>
                                </td>

                            </tr>
                        </c:forEach>
                    </table>
                    <div class="card-footer text-muted">
                        <a class="btn btn-light" href="index.html"><i class="fa fa-home"></i> Home</a>
                    </div>

                </div>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
