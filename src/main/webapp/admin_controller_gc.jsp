<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:if test="${not empty param.id}">

		<sql:update
			sql="UPDATE commande SET valider= ${param.valider} where id = ${param.id}"
			var="result" dataSource="${db }">

		</sql:update>
		<c:redirect url="admin_gc.jsp"></c:redirect>


	</c:if>





</body>
</html>