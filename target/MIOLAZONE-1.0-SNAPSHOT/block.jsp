<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
    <head> 
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Client</title>
    </head>    
    <style>   
    </style>               
    <body>  
<sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884" user="sql2334884" password="nT9*uE7%" />  

          <sql:update dataSource="${dbSource}" var="client">
            DELETE FROM Client WHERE id='<%= request.getParameter("id") %>'
            
        </sql:update>
          <c:if test="${client>=1}">
            <font size="5" color='green'> Congratulations ! Client deleted
            successfully. <%= request.getParameter("id") %></font>
            <c:redirect url="Clients.jsp" ><c:param name="deleted">true</c:param></c:redirect>    
        </c:if>
    </body>
</html>