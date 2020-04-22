
<!DOCTYPE html>

<html>
    <head>
        <title> Inscription DB  </title>
        <%@ page import="java.io.*,java.util.*,java.sql.*"%>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
    </head>
    <body>

        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>

        <c:if test="${empty param.nom or empty param.prenom or empty param.email or param.adresse or empty param.password}">
            <c:redirect url="inscriptionClient.jsp">
                <c:param name="errMsg" value=" Veuillez saisir toutes les informations !" />
            </c:redirect>
        </c:if>

        <c:if test="${not empty param.nom or not empty param.prenom or not empty param.email or not param.adresse or not empty param.password}">

            <c:if test="${param.password != param.confirmPass}">
                <c:redirect url="inscriptionClient.jsp">
                    <c:param name="errMsg" value=" Mot de passe et confirmation non identiques !" />
                </c:redirect>
            </c:if> 
            <c:if test="${param.password == param.confirmPass}">
                <sql:update dataSource="${dbsource}" var="result">
                    INSERT INTO Client (nom, prenom, email, adresse, password) VALUES (?,?,?,?,?)
                    <sql:param value="${param.nom}" />
                    <sql:param value="${param.prenom}" />
                    <sql:param value="${param.email}" />
                    <sql:param value="${param.adresse}" />
                    <sql:param value="${param.password}" />
                </sql:update>
            </c:if> 
        </c:if>
                    <c:if test="${result>=1}">
                        <c:redirect url="inscriptionClient.jsp" >
                            <c:param name="susMsg" value="Votre compte a ete cree avec succes !" />
                        </c:redirect>
                    </c:if>
    </body>