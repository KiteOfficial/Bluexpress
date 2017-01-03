<%@page import="javax.swing.*"%>
<%@page import="java.awt.*"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/Home.css">

    </head>
    <body>

        <table id="hometab">
            <%
                String url = "jdbc:mysql://localhost:3306/BEII";
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                Blob image = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    try {

                        con = DriverManager.getConnection(url, "root", "");
                        ps = (PreparedStatement) con.prepareStatement("Select productName,description,DATE_FORMAT(dateassign, '%d %b %Y') from product order by dateassign DESC LIMIT 10");
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            

                            

            %>
            <tr class="tr1">
                <td class="tabpic" rowspan="2"> <img class="productimage" src="Images/products/<%=rs.getString(1) %>.jpg"/> </td>
                <td class="tabtitle"><strong><%=rs.getString(1) %></strong> </td>
            </tr>
            <tr class="tr2">
                <td class="tabdesc"> <%=rs.getString(2) %>
                    <br><br> Released date: <%=rs.getString(3) %></td>
            </tr>

            <%                        }
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



        </table>

    </body>

</html>


