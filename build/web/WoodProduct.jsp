<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Iterator" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        
            

            <%
                String url = "jdbc:mysql://localhost:3306/BEII";
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    try {
                        con = DriverManager.getConnection(url, "root", "");
                        ps = (PreparedStatement) con.prepareStatement("Select ID, productName from product where type = 'wood'");
                        rs = ps.executeQuery();
                        while (rs.next()) {%>
                        <div>
                            <img src="Images/products/<%=rs.getString(2) %>.jpg"/>
                        </div>




            <%  } %> 
            
        
        <%
                } catch (SQLException e) {

                } finally {
                    try {
                        con.close();
                        ps = null;
                        rs = null;
                    } catch (SQLException e) {

                    }

                }
            } catch (ClassNotFoundException e) {
                System.out.println(e);
            }
        %>
    </body>
</html>
