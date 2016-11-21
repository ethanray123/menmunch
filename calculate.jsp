<%-- 
    Document   : calculate
    Created on : Oct 5, 2016, 4:44:17 PM
    Author     : hp
--%>

<%@page import="java.sql.*"%>
<%@page import="MySQL.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cash Out</title>
    </head>
    <body>
        <h1></h1>
        <%//cash out
            Connection con= connect.getConnection();
            String name = "cart";
            double total=CRUD.getTotal(con, name);
            session.setAttribute("Total",total);
        %>
        The Total is = <% out.print(total); %>
        <div>
            <form action="change.jsp" method="post"><br><br>
                Cash:   <input type="number" name="cash" method="post"> <br><br>
                
                <input name="option" type="submit" value="End Transaction">
            </form>
            
            <form action="cashier.jsp">
                <input type="submit" value="Go Back" name="Prev Page"/>
            </form>
        </div>
    </body>
</html>
