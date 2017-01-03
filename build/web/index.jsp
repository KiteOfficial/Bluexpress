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


        <title>BluExpress</title>
    </head>
    <body >
    <div class="background-image" style="background-image: url('Images/bg.jpg');"></div>

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
                    <li><a class="lili" href="AboutUs">About Us</a></li>
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

                </ul>
                <div id="clock">
                    <jsp:include page="clock.jsp"></jsp:include>
                    </div>

                </div>
            </nav>

            <!-- Slider -->
            <div id="Container">
                <!-- Carousel -->
                <div id="slidess">
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
                      ps = (PreparedStatement) con.prepareStatement("Select * from imageproperty");
                      rs = ps.executeQuery();
                      while (rs.next()) {


                %>

                <img class="mySlides" src="Images/slider/<%=rs.getString("image_name")%>.jpg">
                
                <%      } %>

                <a class="floating1" onclick="plusDivs(-1)" style="left:0%;">&#10096</a>
                <a class="floating1" onclick="plusDivs(+1)" style="right:0%;">&#10097</a>
                
                


            </div>
            <script src="JS/slide.js" type="text/javascript"></script>
            <script src="JS/autoslide.js" type="text/javascript"></script>

            <div id="bodyy">
                <!-- tab -->
                <div id="tabs">
                    <ul class="nav nav-tabs pang">
                        <li><a href="javascript:void(0)" class="tablinks active" data-toggle="tab" onclick="openCity(event, 'home1')">Latest Product</a></li>
                        <li><a href="javascript:void(0)" class="tablinks" data-toggle="tab" onclick="openCity(event, 'menu1')">Best Seller</a></li>
                        <li><a href="javascript:void(0)" class="tablinks" data-toggle="tab" onclick="openCity(event, 'menu2')">Featured Costumer</a></li>


                    </ul>

                    <div class="tab-content" id="mytabcontent">


                        <div id="home1" class="tab-pane fade in active" >
                            <jsp:include page="latestProduct.jsp" />


                        </div> 
                        <div id="menu1" class="tab-pane fade in active">
                            <jsp:include page="BestSell.jsp" />

                        </div>
                        <div id="menu2" class="tab-pane fade in active">

                        </div>
                        <script>
                            function openCity(evt, cityName) {
                                var i, tabcontent, tablinks, fade;
                                tabcontent = document.getElementsByClassName("tab-pane");
                                for (i = 0; i < tabcontent.length; i++) {
                                    tabcontent[i].style.display = "none";
                                }
                                tablinks = document.getElementsByClassName("tablinks");
                                for (i = 0; i < tablinks.length; i++) {
                                    tablinks[i].className = tablinks[i].className.replace(" active", "");
                                }
                                
                                document.getElementById(cityName).style.display = "block";
                                evt.currentTarget.className += " active";
                            }
                        </script>
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
                <p class="footer-gd">&copy; 2017 BluExpress Industries Incorporation. All Rights Reserved | </p> 
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
