<%@page import="javax.swing.ImageIcon"%>
<%@page import="java.awt.Image"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page import="JavaClass.Cart1" %>

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
        <link rel="stylesheet" href="CSS/main.css">
        <link rel="stylesheet" href="CSS/ShopCart.css">
        <link rel="shortcut icon" href="Images/home/favicon.ico">
        <script src="JS/bootbox.min.js"></script>
    </head>
    <body id="body">
        <div class="background-image" style="background-image: url('Images/bg.jpg');"></div>
        <script>

            if (<%=session.getAttribute("empty")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Cart is Empty!');
                    }, 500);
                });
            } else
            if (<%=session.getAttribute("success")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Successful');
                    }, 1000);
                });
            } else
            if (<%=session.getAttribute("clearr")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Cleared!');
                    }, 1000);
                });
            }
            if (<%=session.getAttribute("max")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Insuficient Stack up to <%=session.getAttribute("maximum")%>!');
                    }, 1000);
                });
            }
            <% session.removeAttribute("maximum"); %>
            <% session.removeAttribute("max"); %>
            <% session.removeAttribute("clearr"); %>
            <% session.removeAttribute("empty"); %>
            <% session.removeAttribute("success"); %>

        </script>


        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <img alt="banner" src="Images/nav/banner.png">
                </div>
                <ul id="navul" class="nav navbar-nav">
                    <li ><a class="lili" href="Welcome">Home</a></li>
                    <li class="dropdown" class="active"><a class="dropdown-toggle lili" data-toggle="dropdown" href="#product">Product<span class="caret"></span></a>
                        <ul id="dropul" class="dropdown-menu">
                            <li><a href="Wood">Wood Awards</a></li>
                            <li><a href="Glass">Glass Plaques</a></li>
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
                        <% }
                            }%>

                    <% if (count == 0) {%>
                    <li><a class="lili">Cart</a></li>
                        <%} else { %>
                    <li><a class="lili">Cart<% out.print("(" + count + ")");%></a></li>
                        <% } %>
                    <li><a class="lili" href="ViewOrder">View Order</a></li>
                </ul>
                <div id="clock">
                    <jsp:include page="clock.jsp"></jsp:include>
                    </div>

                </div>
            </nav>
            <div id="Container">

                <div id="cartContainer">
                    <div class="container">

                        <!-- Mainbar-Starts-Here -->
                        <div class="main-bar">
                            <div class="product">
                                <h3>Product</h3>
                            </div>
                            <div class="quantity">
                                <h3>Quantity</h3>
                            </div>
                            <div class="price">
                                <h3>Price</h3>
                            </div>
                            <div class="price">
                                <h3>Total Price</h3>
                            </div>
                            <div class="action">
                                <h3>Action</h3>
                            </div>
                            <div class="clear"></div>
                        </div>

                        <!-- //Mainbar-Ends-Here -->

                        <!-- Items-Starts-Here -->



                        <div class="items">
                        <%
                            Double tprice1 = 0.00;
                            if (session.getAttribute("listtt") != null) {
                                ArrayList mycart = (ArrayList) session.getAttribute("listtt");
                                for (int i = 0; i < mycart.size(); i++) {
                                    Cart1 it = (Cart1) mycart.get(i);
                                    tprice1 = tprice1 + it.getTprice();
                        %>
                        <div class="item1">
                            <div class="close1">

                                <form action="ManageCart" method="POST">
                                    <div class="title1">
                                        <p><%out.print(it.getProdname()); %></p>
                                    </div>
                                    <div class="quantity1">

                                        <input type="number" name="quantity" min="30" value="<%out.print(it.getQty()); %>"/>
                                        <input type="hidden" name="IDID" value="<%out.print(it.getID()); %>">

                                    </div>
                                    <div class="price1">
                                        <p><%out.print(String.format("%.2f", it.getPrice())); %></p>
                                    </div>
                                    <div class="price1">
                                        <p><%out.print(String.format("%.2f", it.getTprice())); %></p>
                                    </div>
                                    <div class="action1">

                                        <input class="btn btn-primary btn-md" name="del" type="submit" value="Delete" onclick="this.value =<%out.print(i);%>"/>
                                        <input class="btn btn-primary btn-md" name="update" type="submit" value="Update" onclick="this.value =<%out.print(i);%>"/>

                                    </div>
                                    <div class="clear"></div>
                                </form>
                            </div>
                        </div>
                        <%
                                }
                            }
                        %>
                        <!-- //Item1-Ends-Here -->

                    </div>

                    <!-- //Items-Ends-Here -->
                    <!-- Total-Price-Starts-Here -->
                    <div class="total">
                        <div class="total1">Total Price</div>
                        <div class="total2"><%=String.format("%.2f", tprice1)%></div>
                        <div class="clear"></div>
                        
                    </div>
                                            <!-- Checkout-Starts-Here -->
                    <div class="checkout">


                        <div class="checkout-btn">
                            <button type="button" id="btncheckout" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#CheckOut">Check Out</button>
                            <button type="button" id="btnclearout" class="btn btn-lg btn-primary" data-toggle="modal" data-target="#ClearOut">Clear</button>
                        </div>
                        <div class="clear"></div>
                        <div class="modal fade" id="CheckOut" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header aw">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h3 class="modal-title">Customer Information</h3>
                                    </div>
                                    <form action="ManageCart" method="POST">
                                        <div class="modal-body aw login-agileits-top">

                                            <input type="text" placeholder="Full Name" class="name" name="cname" size="20" style="margin: 5px;" autocomplete="off" required/>
                                            <input type="text" placeholder="Company Name" class="name" name="comname" size="20" style="margin: 5px;" autocomplete="off" required/>
                                            <input type="number" placeholder="Contact No." class="name" name="cno" size="20" style="margin: 5px;" autocomplete="off" required/>
                                            <input type="email" placeholder="Email Address" class="name" name="email" size="20" style="margin: 5px;" autocomplete="off" required/>
                                            <input type="text" placeholder="Company Address" class="name" name="comadd" size="20" style="margin: 5px;" autocomplete="off" required/>
                                            <input type="hidden" name="totalprice" value="<%=tprice1%>" />

                                        </div>
                                        <div class="modal-footer aw">
                                            <input type="submit" class="btn btn-default" value="Check Out" name="submit"/>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div> <!-- end of CheckOut modal -->

                        <div class="modal fade" id="ClearOut" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h3 class="modal-title">Clear All?</h3>
                                    </div>
                                    <form action="ManageCart" method="POST">
                                        <div class="modal-body">

                                            <input type="submit" name="clear" value="Clear" class="form-control" size="50" style="margin: 5px;"/>

                                        </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //Checkout-Ends-Here -->
                    <!-- //Total-Price-Ends-Here -->

                    
                </div>

            </div> <!-- end of cartContainer -->
        </div> <!-- end of Container -->
        <%
            String url = "jdbc:mysql://localhost:3306/BEII";
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    con = DriverManager.getConnection(url, "root", "");
                    ps = con.prepareStatement("select * from about where id = 1");
                    rs = ps.executeQuery();
                    while (rs.next()) {%>
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
                            <li><%=rs.getString("contact_tel")%></li>
                            <li><%=rs.getString("contact_smart")%></li>
                            <li><%=rs.getString("contact_globe")%></li>
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

    <script type="text/javascript">
                                            $(function () {
                                                $('#mytabcontent').slimScroll();

                                                $('.items').slimScroll({
                                                    wheelStep: '3',
                                                    allowPageScroll: true,
                                                    opacity: 1,
                                                    color: '#c1c1c1'

                                                });

                                            });
    </script>

</html>
