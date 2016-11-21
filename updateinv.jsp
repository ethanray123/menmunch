<%-- 
    Document   : updateinv
    Created on : Nov 18, 2016, 11:11:08 AM
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
            Connection con= connect.getConnection();
            ResultSet resultset = CRUD.selectInventory(con);
            
            String option = request.getParameter("option1");
            String product=request.getParameter("product");
            String price=request.getParameter("price");
            String quantity=request.getParameter("quantity");
            session.putValue("product", product);
                    
            try{
                if(option.equals("Add Inventory")){
                    try{
                        CRUD.insertInventory(con,product,price,quantity);
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }else if(option.equals("Remove Inventory")){
                    try{
                        CRUD.deleteInventory(con,product,price,quantity);
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }else{
                    out.print("Error");
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        %>
        <%
            String optionq=request.getParameter("option2");
            String products=request.getParameter("products");
            String quantitys=request.getParameter("quantitys");
            session.putValue("products", products);
            try{        
                if(optionq.equals("Add Stock")){
                    try{
                        ResultSet rs = CRUD.selectInventoryQ(con,products);
                        rs.next();
                        int st = Integer.parseInt(quantitys) + rs.getInt("Quantity");
                        CRUD.updateInventoryQ(con,st,products);
                        con.close();
                    }catch(Exception e){
                            e.printStackTrace();
                    }
                }else if(optionq.equals("Remove Stock")){
                    try{
                        ResultSet rs = CRUD.selectInventoryQ(con,products);
                        rs.next();
                        int st =  Integer.parseInt(quantitys);
                        st = rs.getInt("Quantity") - st;
                        CRUD.updateInventoryQ(con,st,products);
                        con.close();
                    }catch(Exception e){
                        e.printStackTrace();
                    }
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            %><jsp:forward page="inventory.jsp"/><%
        %>
    </body>
</html>
