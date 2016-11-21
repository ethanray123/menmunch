<%-- 
    Document   : index
    Created on : Sep 21, 2016, 8:28:08 PM
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
        <title>Menchie's Munchies</title>
        <link rel="stylesheet" type="text/css" href="main.css">
    </head>
    <body>
        <%
            String user=request.getParameter("username");
            String pwd=request.getParameter("password");
            try{
                    Connection con = connect.getConnection();
                    ResultSet rs = CRUD.selectUserPR(con,user);
                    rs.next();
                    String retrievePassword = rs.getString("password");
                    if((hashPass.hashPassword(pwd)).equals(retrievePassword)){
                        if(rs.getString("role").equals("Admin")){
                            session.setAttribute("username", user);
                            %><jsp:forward page="admin.jsp"/><%
                        }else{
                            CRUD.deleteContents(con,"cart");
                            response.sendRedirect("cashier.jsp");
                        }
                    }else{
                        %>
                        <div class="error">
                            Username and Password Do not Match
                            <form action="index.html">
                                <input type="submit" value="Go Back" name="Prev Page"/>
                            </form>
                        </div>
                        <%
                    }
                    con.close();
            }catch(Exception e){
                    %>
                    <div class="error">
                    Error 404.. Could Not Find User
                    <form action="index.html">
                        <input type="submit" value="Go Back" name="Prev Page"/>
                    </form>
                    </div>
                    <% 
                    e.printStackTrace();
            }
        %>
    </body>
</html>
