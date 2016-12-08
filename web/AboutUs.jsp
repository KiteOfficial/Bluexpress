<%@page import="javax.swing.*"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
        <link rel="stylesheet" href="CSS/main.css">
        <link rel="stylesheet" href="CSS/Home.css">
        <link rel="shortcut icon" href="Images/home/favicon.ico">


        <title>BluExpressII</title>
    </head>
    <body style="background-image: url('Images/bg.jpg');">


        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <img alt="banner" src="Images/nav/banner.png">
                </div>
                <ul id="navul" class="nav navbar-nav">
                    <li><a class="lili" style="cursor: default;">Home</a></li>
                    <li class="dropdown"><a class="dropdown-toggle lili" data-toggle="dropdown" href="#product">Product<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="Wood">Wood Awards</a></li>
                            <li><a href="Glass">Glass Plaques</a></li>
                            <li><a href="Golf">Golf Trophies</a></li>
                        </ul>
                    </li>
                    <li class="active"><a class="lili" style="cursor: default;">About Us</a></li>
                        <%
                          int count = 0;
                          if (session.getAttribute("listtt") != null) {
                            count = 0;

                            ArrayList mycart = (ArrayList) session.getAttribute("listtt");
                            for (int i = 0; i < mycart.size(); i++) {
                              count = count + 1; %>
                        <% } %>
                        <% }%>

                    <li><a class="lili" href="ShopCart1">Cart<% out.print("(" + count + ")");%></a></li>

                </ul>
                <div id="clock">
                    <jsp:include page="clock.jsp"></jsp:include>
                </div>

            </div>
        </nav>
        <div id="Container">
            
            
            <div id="Footer">
                <div id="footsec">
                    <div id="copyright">
                        © copyright 2016
                    </div>
                    <div id="icon">
                        <a href="#" ><img src="Images/footer/face.png"></a>
                        <a href="#" ><img src="Images/footer/twit.png"></a>
                        <a href="#" ><img src="Images/footer/g.png"></a>
                        <a href="#" ><img src="Images/footer/insta.png"></a>
                    </div>
                </div>
            </div> <!-- End of Footer -->
        </div> <!-- End of Container -->
    </body>
</html>
