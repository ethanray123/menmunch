<%-- 
    Document   : next
    Created on : Sep 21, 2016, 8:57:20 PM
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
        <title>Update and Delete Test</title>
        <link rel="stylesheet" type="text/css" href="main.css">
    </head>
    <body>
        <div id=""></div>
        <div id="">
        <h3>Delete User</h3><br>
        <form action="manageUsers.jsp" method="post">
            <input type="text" name="username"> username <br><br>
            <button type="submit" name="delete" onclick="alert('User Deleted')">Delete</button>
            <%
            String user=request.getParameter("username");
            session.putValue("username", user);
            try{
                Connection con = connect.getConnection();
                CRUD.deleteUser(con,user);
                con.close();
            }catch(Exception e){
                e.printStackTrace();
            }
            %>
        </form>
        </div>
        <div id=""></div>
        <div id="">
        <h3>Update User</h3><br>
        <form action="manageUsers.jsp" method="post">
            <input type="text" name="username2"> username <br><br>
            <input type="password" name="oldpassword"> old password <br><br>
            <input type="password" name="newpassword"> new password <br><br>
            <button type="submit" name="login" onclick="alert('User Updated')">Update</button>
            <%
                String user1=request.getParameter("username2");
                session.putValue("username2", user);
                String pwd1=request.getParameter("oldpassword");
                String npwd=request.getParameter("newpassword");
                try{
                Connection con = connect.getConnection();
                pwd1=hashPass.hashPassword(pwd1);
                npwd=hashPass.hashPassword(npwd);
                CRUD.updatePassword(con,user1,pwd1,npwd);
                con.close();
                }catch(Exception e){
                    e.printStackTrace();
                }
            %>
        </form><br><br>
        <form action="admin.jsp">
            <button type="submit" name="Prev Page">Go Back</button>
        </form>
        </div>
    </body>
</html>
