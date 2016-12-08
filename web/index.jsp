<%@page import="javax.swing.*"%>
<%@page import="java.awt.Image"%>
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
                        <li  class="active"><a class="lili" style="cursor: default;">Home</a></li>
                        <li class="dropdown"><a class="dropdown-toggle lili" data-toggle="dropdown" href="#product">Product<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="Wood">Wood Awards</a></li>
                                <li><a href="Glass">Glass Plaques</a></li>
                                <li><a href="Golf">Golf Trophies</a></li>
                            </ul>
                        </li>
                        <li><a class="lili" href="About">About Us</a></li>
                        <%
                      int count = 0;
                      if (session.getAttribute("listtt") != null) {
                        count = 0 ;
                      
                                    ArrayList mycart = (ArrayList) session.getAttribute("listtt");
                                    for (int i = 0; i < mycart.size(); i++) { 
                    count = count+1; %>
                    <% } %>
                    <% }%>
                      
                    <li><a class="lili" href="ShopCart1">Cart<% out.print("("+count+")");  %></a></li>
                      
                    </ul>
                    <div id="clock">
                        <jsp:include page="clock.jsp"></jsp:include>
                    </div>

                </div>
            </nav>

            <!-- Slider -->
            <div id="Container">
                <!-- Slider -->
                <div id="slidess">
                    <img class="mySlides" src="Images/slider/image-slider-1.jpg">
                    <img class="mySlides" src="Images/slider/image-slider-2.jpg">
                    <img class="mySlides" src="Images/slider/image-slider-3.jpg">
                    <img class="mySlides" src="Images/slider/image-slider-4.jpg">
                    <img class="mySlides" src="Images/slider/image-slider-5.jpg">
                    <a class="floating1" onclick="plusDivs(-1)" style="left:0%;">&#10096</a>
                    <a class="floating1" onclick="plusDivs(+1)" style="right:0%;">&#10097</a>
                </div>
                <script src="JS/slide.js" type="text/javascript"></script>
                <script src="JS/autoslide.js" type="text/javascript"></script>

                <div id="bodyy">
                    <!-- tab -->
                    <div id="tabs">
                        <ul class="nav nav-pills">
                            <li class="active"><a data-toggle="pill" href="#home1">Latest Product</a></li>
                            <li><a data-toggle="pill" href="#menu1">Best Seller</a></li>
                            <li><a data-toggle="pill" href="#menu2">Featured Costumer</a></li>
                        </ul>

                        <div class="tab-content" id="mytabcontent">
                            <!--    <script src="JS/scrollbar.js"></script> -->


                            <div id="home1" class="tab-pane fade in active" >
                            <jsp:include page="latestProduct.jsp" />


                        </div> 
                        <div id="menu1" class="tab-pane fade">

                            <table>

                            </table>
                        </div>
                        <div id="menu2" class="tab-pane fade">
                            <table>
                            </table>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(function () {

                            $('#mytabcontent').slimScroll();

                            $('#testDiv2').slimScroll({
                                allowPageScroll: true
                            });

                        });
                    </script>

                </div>

                <fieldset class = "ff" id="fieldset"> 
                    <legend> <strong> Production of BEII </strong> </legend>
                    <div id="fieldsett">
                        <div class="pic1">
                            <img id ="try" src = "Images/home/real.jpg">
                            <div class="gsis"> <strong><font color="black">Swak na Swak Interview</font></strong></div>
                        </div>

                        <div class="pic1">
                            <img id ="tryy" src = "Images/home/real4.jpg">
                            <div class="gsis"> <strong><font color="black">Rotary Club Mass Production Awards</font></strong></div>
                        </div>

                        <div class="pic1">
                            <img id ="tryyy" src = "Images/home/real1.jpg">
                            <div class="gsis"> <strong><font color="black">Rotary Club Plaques</font></strong></div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(function () {

                            $('#').slimScroll();

                            $('#fieldsett').slimScroll({
                                allowPageScroll: true
                            });

                        });
                    </script>
                </fieldset>
            </div>

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
            </div>
        </div>
    </body>

</html>
