<%-- 
    Document   : reg
    Created on : Sep 21, 2016, 9:30:42 PM
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
        <title>Register</title>
    </head>
    <body>
        <%
            String user=request.getParameter("username");
            session.putValue("username", user);
            String pwd=request.getParameter("password");
            String role=request.getParameter("role");
            try{
            Connection con = connect.getConnection();
            pwd=hashPass.hashPassword(pwd);
            CRUD.insertUser(con,user,pwd,role);
            con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
            response.sendRedirect("index.html");
        %>
    </body>
</html>
