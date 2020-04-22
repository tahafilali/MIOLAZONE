<%-- 
    Document   : insert.jsp
    Created on : 2020-04-22, 00:57:27
    Author     : Nabiha
--%>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>

 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>inserting data</title>
    </head>
    <body>
          <%@taglib  uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
          <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884" user="sql2334884" password="nT9*uE7%"/>
        
   
         <sql:update dataSource="${dataSource}" var="result">
        	INSERT INTO feedback( Nom,Prenom,email,Message) VALUES (?,?,?,?)
        		
        		<sql:param value="${param.Nom}" />
                        <sql:param value="${param.Prenom}" />
                        <sql:param value="${param.email}" />
                        <sql:param value="${param.Message}" />
                        
        		
         </sql:update>
                <c:if test="${result>=1}">
                    
        <c:redirect url="feedback.jsp">
            
        <c:param name="id"
            value="${param.id}"> <div class="alert alert-success" role="alert">
  Your feedback has been registered successfully!
</div></c:param>
         
        </c:redirect>
                </c:if>
            
        <%
            
            String Nom = request.getParameter("Nom");
            String Prenom = request.getParameter("Prenom");
            String email = request.getParameter("email");
            String Message = request.getParameter("Message");
            %>
            
            

    </body>
</html>
