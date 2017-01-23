<%@page import="javax.swing.*"%>
<%@page import="java.awt.*"%>
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
        <link rel="stylesheet" href="CSS/About.css">
        <link rel="shortcut icon" href="Images/home/favicon.ico">


        <title>BluExpress</title>
    </head>
    <body>
        <div class="background-image" style="background-image: url('Images/bg.jpg');"></div>

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <img alt="banner" src="Images/nav/banner.png">
                </div>
                <ul id="navul" class="nav navbar-nav">
                    <li><a class="lili" href="Welcome">Home</a></li>
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
                  ps = (PreparedStatement) con.prepareStatement("Select * from about");
                  rs = ps.executeQuery();
                  while (rs.next()) {


            %>
            <div id="AboutContainer" class="form-style-5">
                <fieldset>
                    <legend><span class="number">*</span>Company Details</legend>
                    <div id="cdetails">
                        <p><strong>Company Name: </strong><%=rs.getString("CName")%></p>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><span class="number">*</span>Company Address</legend>
                    <div id="caddress">
                        <div id="addressdetails">
                            <p><strong>Company Address: </strong><%=rs.getString("Address")%></p>
                        </div>
                        <div id="map">
                            <%=rs.getString("Map")%>
                        </div>
                    </div>
                </fieldset>
                <fieldset>
                    <legend><span class="number">*</span>Contact Details</legend>
                    <div id="condetails">
                        <p><strong>Email Address: </strong><%=rs.getString("EmailAdd")%></p>
                        <p><strong>Smart #: </strong><%=rs.getString("Contact_Smart")%></p>
                        <p><strong>Globe #: </strong><%=rs.getString("Contact_Globe")%></p>
                        <p><strong>Telephone #: </strong><%=rs.getString("Contact_Tel")%> </p>
                        <p><strong>Name: </strong><%=rs.getString("Fname")%>
                            <%=rs.getString("Lname")%></p>

                    </div>
                </fieldset>
                <fieldset>
                    <legend><span class="number">*</span>Social Contact</legend>
                    <div id="caddress">
                        <p><strong>Facebook: </strong><a href="<%=rs.getString("Facebook")%>" target="_blank"><%=rs.getString("Facebook")%></a></p>
                    </div>
                </fieldset>



            </div> <!-- End of #AboutContainer -->
            <% } %>

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
