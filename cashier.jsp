<%-- 
    Document   : cashier
    Created on : Sep 21, 2016, 10:02:29 PM
    Author     : user
--%>

<%@page import="java.sql.*"%>
<%@page import="MySQL.CRUD"%>
<%@page import="MySQL.connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cashier</title>
        <link rel="stylesheet" type="text/css" href="main.css">
        <script src="jquery-3.1.1.min.js"></script>
    </head>
    <body>
        <H1> Cashier </H1>

        <% 
            Connection con= connect.getConnection();
            ResultSet resultset = CRUD.selectInventory(con);
            ResultSet rs = CRUD.selectCart(con);
        %>

        <TABLE BORDER="1" class="table">
            <TR>
                <TH>Product</TH>
                <TH>Price</TH>
                <TH>Quantity</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
            </TR>
            <% } %>
        </TABLE>
        
        <TABLE class="table cart" BORDER="1">
            <TR>
                <TH>Product</TH>
                <TH>Price</TH>
                <TH>Quantity</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
            </TR>
            <% } %>
        </TABLE>
        
        <div class="IB">
            <form action="cart.jsp" method="post"><br><br>
                Product:    <input type="text" name="product"> <br><br>
                Price:      <input type="text" name="price"> <br><br>
                Quantity:   <input type="text" name="quantity"> <br><br>
                
                <input name="option1" type="submit" value="Add to Cart" onclick="alert('Added to Cart')">
                <input name="option1" type="submit" value="Remove from Cart" onclick="alert('Removed From Cart')">
                
            </form>
            <br>
            <form action="calculate.jsp">
                <input type="submit" value="Cash Out" name="Cashout"/>
            </form>
                
            <br>
            <br>
            <form action="index.html">
                <input type="submit" value="Go Back" name="Prev Page"/>
            </form>
        </div>
    </body>
</html>
