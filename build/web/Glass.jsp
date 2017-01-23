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
        <title>BluExpress</title>
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
        <script src="JS/bootbox.min.js"></script>
        <script src="JS/bootbox.min.js"></script>
        <link rel="stylesheet" href="CSS/main.css">
        <link rel="stylesheet" href="CSS/Product.css">
        <link rel="shortcut icon" href="Images/home/favicon.ico">
    </head>
    <body>
        <div class="background-image" style="background-image: url('Images/bg.jpg');"></div>
        <script>
            if (<%=session.getAttribute("aa")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: 'true'
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Successful!');
                    }, 1000);
                });
            } else
            if (<%=session.getAttribute("ab")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Already Exist!');
                    }, 1000);
                });
            }
            <% session.removeAttribute("aa"); %>
            <% session.removeAttribute("ab"); %>

        </script>


        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <img alt="banner" src="Images/nav/banner.png">
                </div>
                <ul id="navul" class="nav navbar-nav">
                    <li><a class="lili" href="Welcome">Home</a></li>
                    <li class="dropdown" class="active"><a class="lili dropdown-toggle" data-toggle="dropdown" href="#product">Product<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li ><a href="Wood">Wood Awards</a></li>
                            <li class="active" style="cursor: default;"><a href="Glass">Glass Plaques</a></li>
                            <li><a href="Golf">Golf Trophies</a></li>
                        </ul>
                    </li>
                    <li><a class="lili" href="About">About Us</a></li>
                        <%
                            int count = 0;
                            if (session.getAttribute("listtt") != null) {
                                count = 0;

                                ArrayList mycart = (ArrayList) session.getAttribute("listtt");
                                for (int i = 0; i < mycart.size(); i++) {
                                    count = count + 1; %>
                        <% } %>
                        <% }%>

                    <% if (count == 0) {%>
                    <li><a class="lili" href="ShopCart1">Cart</a></li>
                        <%} else { %>
                    <li><a class="lili" href="ShopCart1">Cart<% out.print("(" + count + ")");%></a></li>
                        <% } %>
                    <li><a class="lili" href="ViewOrder">View Order</a></li>
                </ul>
                <div id="clock">
                    <jsp:include page="clock.jsp"></jsp:include>
                    </div>

                </div>
            </nav>
            <div id="Container">

                <div id="banner">
                    <h1> <center> Glass Plaques Product </center> </h1>
                </div>    
                <div id="search">
                    <input type="text" size="40" placeholder="Search..." id="box"/>
                </div>
                <div id="products">
                <%
                    String url = "jdbc:mysql://localhost:3306/BEII";
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        try {
                            con = DriverManager.getConnection(url, "root", "");
                            ps = (PreparedStatement) con.prepareStatement("Select * from product where type = 'glass' and stack > 29");
                            rs = ps.executeQuery();
                            while (rs.next()) {%>

                <div id="glass<%=rs.getString("ID")%>" class="product">
                    <a href="" data-toggle="modal" data-target="#myModal<%=rs.getString("ID")%>"><img class="targetprod" src="Images/products/<%=rs.getString(2)%>.jpg"/><p class="click"> Click to View Details</p><p class="prodtitle"><%=rs.getString("productname")%></p></a>

                    <div class="modal fade" id="myModal<%=rs.getString("ID")%>" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h3 class="modal-title"><%=rs.getString("productName")%></h3>
                                </div>
                                <div class="modal-body">
                                    <div class="modalimage">
                                        <img class="modalimage1" src="Images/products/<%=rs.getString("productName")%>.jpg"/>
                                    </div>
                                    <div class="ModalDesc">
                                        <h4><strong>Price:</strong> <%=rs.getString("price")%> php
                                            <br/>
                                            <br/>
                                            <strong>Description:</strong> <%=rs.getString("description")%></h4>

                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <form method="POST" action="ShopCart" name="dsad">
                                        <div class="col-xs-2">
                                            <input type="number" class="form-control" size="50" name="Qty" placeholder="Quantity" min="30" max="<%=rs.getString("stack")%>" required/>
                                            <input type="hidden" value="<%=rs.getString("price")%>" name="price" />
                                            <input type="hidden" value="<%=rs.getString("productName")%>" name="prodname" />
                                            <input type="hidden" value="<%=rs.getString("ID")%>" name="ID" />
                                            <input type="hidden" value="<%=rs.getString("type")%>" name="type" />

                                        </div>
                                        <strong style="float: left;"> Between 30 and <%=rs.getString("stack")%> pieces.</strong>
                                        <input type="submit" class="btn btn-default" value="Add to Cart"/>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%  } %> 
                <script type="text/javascript" src="JS/Search.js"/>


            </div>
            <script type="text/javascript">
                $(function () {

                    $('#').slimScroll();

                    $('#fieldsett').slimScroll({
                        allowPageScroll: true
                    });

                });
            </script>



        </div>
    </div>
        <%
            ps = con.prepareStatement("select * from about where id = 1");
            rs = ps.executeQuery();
            while (rs.next()) {

        %>
        <div id="mainfoot">
            <div id="Footer">
                <div id="footsec">
                    <div id="footabout">
                        <h4>About</h4>
                        <p>We are a professional awards manufacturer that supplies and customize any design to fit your event requirement.</p>
                    </div>
                    <div id="footprod">
                        <h4>Products</h4>
                        <ul>
                            <li><a href="Wood">Wood Award</a></li>
                            <li><a href="Glass">Glass Plaque</a></li>
                            <li><a href="Golf">Golf Trophy</a></li>
                        </ul>
                    </div>
                    <div id="footconnect" class="footer two">
                        <h4>Keep Connected</h4>
                        <ul>
                            <li><a class="fb" href="<%=rs.getString("facebook")%>" target="_blank">Like us on Facebook</a></li>
                            <li><a class="fb1" href="<%=rs.getString("instagram")%>" target="_blank">Follow us on Instgram</a></li>
                        </ul>
                    </div>
                    <div id="footinfo" class="footer two">
                        <h4>Contact Information</h4>
                        <ul>
                            <li><%=rs.getString("contact_tel") %></li>
                            <li><%=rs.getString("contact_smart") %></li>
                            <li><%=rs.getString("contact_globe") %></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div id="copyright" class="copy-right-grids">
                <p class="footer-gd">Copyright &copy; 2016&ndash;<script language="javascript" type="text/javascript">
                    var today = new Date();
                    var year = today.getFullYear();
                    document.write(year);
                    </script> BluExpress Industries Incorporation. All Rights Reserved | </p> 
            </div>
        </div>
        <%      }
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
    </body>
</html>