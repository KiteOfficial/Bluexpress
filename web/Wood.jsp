<%@page import="javax.swing.*"%>
<%@page import="java.awt.Image"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wood</title>
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/bootbox.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
        <link rel="stylesheet" href="CSS/main.css">
        <link rel="stylesheet" href="CSS/Product.css">
        <link rel="shortcut icon" href="Images/home/favicon.ico">
    </head>
    <body style="background-image: url('Images/bg.jpg');">
        <script>
            if (<%=session.getAttribute("aa")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Successful!');
                    }, 2000);
                });
            }else
            if(<%=session.getAttribute("ab")%>){
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Already Exist!');
                    }, 2000);
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
                    <li class="dropdown active"><a class="dropdown-toggle lili" data-toggle="dropdown" href="#product">Product<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li class="active" style="cursor: default;"><a>Wood Awards</a></li>
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
            <div id="Container">

                <div id="banner">
                    <h1> <center> Wood Award Product </center> </h1>
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
                      ps = (PreparedStatement) con.prepareStatement("Select * from product where type = 'wood'");
                      rs = ps.executeQuery();
                      while (rs.next()) {%>

                <div id="wood<%=rs.getString("ID")%>" class="product">
                    <a href="" data-toggle="modal" data-target="#myModal<%=rs.getString("ID")%>"><img class="targetprod" src="Images/products/<%=rs.getString(2)%>.jpg"/></a>
                    <p> Click to View Details</p>
                    
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
                                            <input type="number" class="form-control" size="50" name="Qty" placeholder="Quantity" min="30" max="1000" required/>
                                            <input type="hidden" value="<%=rs.getString("price")%>" name="price" />
                                            <input type="hidden" value="<%=rs.getString("productName")%>" name="prodname" />
                                            <input type="hidden" value="<%=rs.getString("ID")%>" name="ID" />
                                            <input type="hidden" value="<%=rs.getString("type")%>" name="type" />

                                        </div>
                                        <strong style="float: left;"> Between 30 and 1,000 pieces.</strong>
                                        <input type="submit" class="btn btn-default" value="Add to Cart"/>



                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
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




            </div>
                <script type="text/javascript">
                        $(function () {

                            $('#').slimScroll();

                            $('#products').slimScroll({
                                allowPageScroll: true
                            });

                        });
                    </script>

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
        </div>
    </body>
</html>

<!--

<script type="text/javascript">
$(document).ready(function(){
$('.class').on('click', function(){
// bootbox code here
function(){ console.log('This was logged in the callback!');
});
});

</script>
-->
