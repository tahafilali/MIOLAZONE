<%-- 
    Document   : updateEtatTicket
    Created on : 18 avr. 2020, 13:03:00
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
    </head>
    <body>
        <sql:setDataSource var="dbSource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://sql2.freemysqlhosting.net:3306/sql2334884"
                           user="sql2334884"  password="nT9*uE7%"/>
        <section class="container-fluid" style="background: url('background.jpg') no-repeat;width:100%;height:100vh;background-size: cover">
            <section class="row justify-content-center">
                <section class="col-12 col-sm-6 col-md-3">
                    <form action="reponseTicketdb.jsp" method="post" style="margin-top: 50%;background:#fff;padding:30px;border-radius: 10px;box-shadow: 0px 0px 10px 0px #000;">
                        <div class="form-group">
                            <label for="reponseTicket">
                                Reponse au ticket de <c:out value="${param.name}" />
                            </label>
                            <textarea name="reponse" class="form-control" rows="8" cols="50" id="reponseTicket" aria-describedby="reponseHelp">
                                <c:out value="${param.reponse}"/>
                            </textarea>
                        </div>
                        <input type="hidden" value="${param.id}" name="id"/>
                        <button id="button" type="submit" class="btn btn-primary btn-block">Submit</button>
                    </form>
                </section>
            </section>
        </section>


    </body>
</html>
