<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.io.*,java.text.*,java.util.Date,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Validation d'achat</title>
        <link type="text/css" rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    </head>
    <body>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
	        url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
	        user="sql2334884"  password="nT9*uE7%"/>
	        
	    <!-- Récuperer la date d'achat et l'id de client -->
	    <%
		    DateFormat dateFormat = new SimpleDateFormat("dd/MM/yy HH:mm:ss"); //mise en forme de la date
			Date dateObj = new Date(); //objet date
			//Integer iddClient = Integer.parseInt(request.getParameter("iddClient"));
			//System.out.println("id client en cous: "+request.getParameter("iddClient"));
	    %>
        
        <sql:update dataSource="${dbsource}" var="count">
            INSERT INTO commande (id_client, id_admin, date, valider) VALUES (?, ?, ?, ?);
			<sql:param value='<%= request.getParameter("iddClient") %>'/>
			<sql:param value="1" />
			<sql:dateParam value = "<%=dateObj%>" type = "DATE" />
			<sql:param value="0" />
        </sql:update>
        <c:if test="${count>=1}">
		<jsp:include page="popupSuccess.jsp" />
		</c:if>
		
		<c:if test="${exception!=null}">
		<div class="alert alert-danger" role="alert">
		  <c:out value="Une erreur est survenue. Veuillez réessayer plus tard." />
		</div>
		</c:if>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    </body>
</html>
