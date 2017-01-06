<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%

            String user = (String) session.getAttribute("us");
            if (user == null) {
                String cpage = "OrderedList";
                session.setAttribute("cpage", cpage);
                response.sendRedirect("Admin");

            }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/Admin/main.css">
        <link rel="stylesheet" href="CSS/Admin/Manage.css">
        <link rel="stylesheet" href="CSS/Admin/ViewOrder.css">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
    <body>

        <div id="Container">
            <div id="navigator">
                <ul>
                    <li class="active"><a>Ordered List</a></li>
                    <li><a href="ViewAll">Manage Product</a></li>
                    <li><a href="ManagePage.jsp">Manage Page</a></li>
                    <li style="float: right;"><a href="LogOut">Logout</a></li>
                    <li style="float: right;"><a href="Welcome">Page</a></li>
                </ul>
            </div>

            <div id="navigator2">
                <ul>
                    <li style="cursor: default;" class="active1"><a>Waiting</a></li>
                    <li><a href="#">Accepted</a></li>
                </ul>
            </div>
            <div id="orderContainer">
                <h1>Waiting List</h1>
                <div id="wrapper">
                    <table id="keywords" class="table table-hover" cellspacing="0" cellpadding="0">
                        <thead>
                            <tr>
                                <th class="thf" colspan="2"><span>Customer Name</span></th>
                                <th class="mid"><span>Company Name</span></th>
                                <th class="mid"><span>Total Price</span></th>
                                <th class="mid"><span>Status</span></th>
                            </tr>
                        </thead>
                        <%
                            String url = "jdbc:mysql://localhost:3306/BEII";
                            Connection con = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            PreparedStatement ps1 = null;
                            ResultSet rs1 = null;
                            Blob image = null;

                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                try {

                                    con = DriverManager.getConnection(url, "root", "");
                                    ps = (PreparedStatement) con.prepareStatement("Select * from customer");
                                    rs = ps.executeQuery();
                                    while (rs.next()) {


                        %>
                        <tr class="header expand">
                            <td class="clickable" data-toggle="collapse" id="row" data-target=".row<%=rs.getString("ID")%>"><span class="sign"></span></td>
                            <td class="laman"><%=rs.getString("Name")%></td>
                            <td class="laman"><%=rs.getString("CompanyName")%></td>  
                            <td class="laman"><%=rs.getString("Total_Price")%></td>
                            <td class="laman"><%=rs.getString("Status")%></td>
                        </tr>
                        <%
                            ps1 = (PreparedStatement) con.prepareStatement("Select * from customerorder where id = ?");
                            ps1.setString(1, rs.getString("ID"));
                            rs1 = ps1.executeQuery();
                            while (rs1.next()) {
                        %>
                        <tr class="row<%=rs1.getString("ID")%> collapse" id="row1">
                            <td></td>
                            <td colspan="2"><%=rs1.getString("Product")%></td>
                            <td><%=rs1.getString("Quantity")%></td>
                            <td><%=rs1.getString("Price")%></td> 
                        </tr>
                        <% }
                                } %>

                        <script>
                            $('.header').click(function () {
                                $(this).toggleClass('expand').nextUntil('tr.header').slideToggle(100);
                            });
                        </script>
                    </table>
                </div>
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
                    }%>
            </div>

        </div>
    </body>
</html>
