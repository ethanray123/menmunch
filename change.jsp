<%-- 
    Document   : change
    Created on : Oct 9, 2016, 10:12:43 AM
    Author     : hp
--%>

<%@page import="Calculate.calc"%>
<%@page import="java.sql.Connection"%>
<%@page import="MySQL.CRUD"%>
<%@page import="MySQL.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="main.css">
        <title>Change</title>
    </head>
    <body>
        <div class="IB">
            <h1>Your Change</h1>
            <%//cash out
            Connection con= connect.getConnection();
            String name = "cart";
            double total=CRUD.getTotal(con, name);
            double cash = Double.parseDouble(request.getParameter("cash"));
            double change = calc.getChange(total, cash);
            CRUD.deleteContents(con,name);
            %>
            <h3>I received <% out.print(cash); %></h3>
            <h3>Your Change is <% out.print(change); %></h3>
        </div><br>
        <form action="cashier.jsp">
                <input type="submit" value="Add Another Transaction" name="Prev Page"/>
        </form><br><br>
        <form action="index.html">
                <input type="submit" value="Exit" name="Prev Page"/>
        </form>
    </body>
</html>
