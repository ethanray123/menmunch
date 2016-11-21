<%-- 
    Document   : cart
    Created on : Oct 6, 2016, 1:50:40 PM
    Author     : hp
--%>
<%@page import="MySQL.CRUD"%>
<%@page import="MySQL.connect"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="main.css">
        <title>JSP Page</title>
    </head>
    <body>
        <%          
            Connection con = connect.getConnection();
            String option1 = request.getParameter("option1");
            String product=request.getParameter("product");
            String price=request.getParameter("price");
            int quantity=Integer.parseInt(request.getParameter("quantity"));
            String c = "cart";
            String i = "inventory";

            try{
                if(option1.equals("Add to Cart")){
                    CRUD.deductQ(con, i, quantity, product);
                    CRUD.insert(con, c, product, price, quantity);
                }else if(option1.equals("Remove from Cart")){
                    CRUD.addQ(con, i, quantity, product);
                    CRUD.deductQ(con, c, quantity, product);
                }
                %><jsp:forward page="cashier.jsp"/><%
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
    </body>
</html>
