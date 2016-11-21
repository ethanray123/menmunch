<%-- 
    Document   : inventory
    Created on : Sep 28, 2016, 7:33:42 PM
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
        <link rel="stylesheet" type="text/css" href="main.css">
        <title>Inventory</title>
    </head>
    <body>
        <H1 id="header"> Inventory </H1>

        <% 
            Connection con= connect.getConnection();
            ResultSet resultset = CRUD.selectInventory(con);
        %>
        <div class="table">
            <TABLE BORDER="1" class="" width="400px">
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
        </div>
        <div>
            <form action="updateinv.jsp" method="post"><br><br>
                Product:    <input type="text" name="product"> <br><br>
                Price:      <input type="text" name="price"> <br><br>
                Quantity:   <input type="text" name="quantity"> <br><br>
                
                <button name="option1" type="submit" value="Add Inventory" onclick="alert('Product Successfully Added')">Add Inventory</button>
                <button name="option1" type="submit" value="Remove Inventory" onclick="alert('Product Successfully Removed')">Remove Inventory</button>
            </form>
            
            <form action="updateinv.jsp"><br><br>
                Product:    <input type="text" name="products"> <br><br>
                Quantity:   <input type="number" name="quantitys"> <br><br>
                
                <button type="submit" name="option2" value="Add Stock" onclick="alert('Stock Successfully Added')">Add Stock</button>
                <button type="submit"  name="option2" value="Remove Stock" onclick="alert('Stock Successfully Removed')">Remove Stock</button>
            </form>
            <br>
            <form action="admin.jsp">
                <button type="submit" name="Prev Page">Go Back</button>
            </form>
        </div>
    </body>
</html>
