<%-- 
    Document   : admin
    Created on : Sep 21, 2016, 10:02:12 PM
    Author     : user
--%>
<%@page import="Hash.hashPass"%>
<%@page import="MySQL.CRUD"%>
<%@page import="MySQL.connect"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="stylesheet" type="text/css" href="main.css">
    </head>
    <body>
        <h1 id="header"> Welcome 
             <% out.print(session.getAttribute("username"));
             %> 
        </h1>
        <br><br>
        <form action="manageUsers.jsp">
            <button type="submit" name="users">Test Update and Delete</button>
        </form><br>
        <form action="inventory.jsp">
            <button type="submit" name="inv">Edit Inventory</button>
        </form><br><br>
        <form action="index.html">
            <button type="submit" name="Prev Page">Go Back</button>
        </form>
    </body>
</html>
