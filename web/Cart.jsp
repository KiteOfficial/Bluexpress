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
        <title>Wood</title>
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
        <link rel="stylesheet" href="CSS/main.css">
        <link rel="stylesheet" href="CSS/ShopCart.css">
        <link rel="shortcut icon" href="Images/home/favicon.ico">
    </head>
    <body style="background-image: url('Images/bg.jpg');">



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

                    <li><a class="lili" href="ShopCart1">Cart<% out.print("(" + count + ")");  %></a></li>
                </ul>
                <div id="clock">
                    <jsp:include page="clock.jsp"></jsp:include>
                    </div>

                </div>
            </nav>
            <div id="Container">

                <div id="cartContainer">

                    <div id="banner">
                        <h1> <center> Product Selected </center> </h1>
                    </div>
                    <div id="cart">
                        <form action="ManageCart" method="POST">

                            <table align="center" border="1px" class="table table-hover" id="theadss">
                                <thead>
                                    <tr >
                                        <th>NO.</th>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Price</th>
                                        <th>Total Price</th>
                                        <th colspan="2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>


                                <%
                                  Double tprice = 0.00;
                                  if (session.getAttribute("listtt") != null) {
                                    ArrayList mycart = (ArrayList) session.getAttribute("listtt");
                                    for (int i = 0; i < mycart.size(); i++) {
                                      Cart1 it = (Cart1) mycart.get(i);
                                      tprice = tprice + it.getTprice();
                                %>

                                <tr>
                                    <td align="center"><%out.print(i + 1 + "."); %></td>
                                    <td align="center"><%out.print(it.getProdname()); %></td>
                                    <td align="center"><%out.print(it.getQty()); %></td>
                                    <td align="center"><%out.print(it.getPrice()); %></td>
                                    <td align="center"><%out.print(it.getTprice()); %></td>


                                    <td align="center"><input class="btn btn-primary btn-block" name="del" type="submit" value="Delete" onclick="this.value =<%out.print(i);%>"></input></td>
                                </tr>
                                <%
                                    }
                                  }
                                %>


                            </tbody>
                        </table>
                        <table id="header-fixed"></table>
                        <script>
                                        var tableOffset = $("#theadss").offset().top;
                                        var $header = $("#theadss > thead").clone();
                                        var $fixedHeader = $("#header-fixed").append($header);

                                        $(window).bind("scroll", function () {
                                            var offset = $(this).scrollTop();

                                            if (offset >= tableOffset && $fixedHeader.is(":hidden")) {
                                                $fixedHeader.show();
                                            } else if (offset < tableOffset) {
                                                $fixedHeader.hide();
                                            }
                                        });
                        </script>
                    </form>
                </div>

            </div> <!-- end of cartContainer -->

            <div id="Footer">
                <div id="footsec">
                    <div id="copyright">
                        &COPY; copyright 2016
                    </div>
                    <div id="icon">
                        <a href="#" ><img src="Images/footer/face.png"></a>
                        <a href="#" ><img src="Images/footer/twit.png"></a>
                        <a href="#" ><img src="Images/footer/g.png"></a>
                        <a href="#" ><img src="Images/footer/insta.png"></a>
                    </div>
                </div>
            </div>
        </div> <!-- end of Container -->
    </body>
</html>
