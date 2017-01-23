<%@page import="java.sql.*"%>
<%@page import="JavaClass.Cart1"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
    <head>
        <%
          String user = (String) session.getAttribute("us");
          if (user == null) {
            response.sendRedirect("Admin");
          }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage</title>
        <link rel="stylesheet" href="CSS/Admin/main.css">
        <link rel="stylesheet" href="CSS/Admin/Manage.css">
        <link rel="stylesheet" href="CSS/Admin/View.css">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
        <script src="JS/bootbox.min.js"></script>
    </head>
    <body>
        <script>

            if (<%=session.getAttribute("emptysiya")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Please Enter Quantity!');
                    }, 500);
                });
            } else
            if (<%=session.getAttribute("yeah")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Successful!');
                    }, 500);
                });
            }
            <% session.removeAttribute("emptysiya"); %>
            <% session.removeAttribute("yeah"); %>
        </script>

        <div id="Container">
            <div id="navigator">
                <ul>
                    <li><a href="OrderedList">Ordered List</a></li>
                    <li class="active"><a>Manage Product</a></li>
                    <li><a href="ManagePage.jsp">Manage Page</a></li>
                    <li><a href="#">Manage Report</a></li>
                    <li style="float: right;"><a href="LogOut">Logout</a></li>
                    <li style="float: right;"><a href="Welcome">Page</a></li>
                </ul>
            </div>
            <div id="Container2">
                <div id="navigator2">
                    <ul>
                        <li><a href="ViewAll">View All</a></li>
                        <li><a href="ViewWood">Wood</a></li>
                        <li><a href="ViewGlass">Glass</a></li>
                        <li><a href="ViewGolf">Golf</a></li>
                        <li><a href="AddProduct" target="_self">Add Product</a></li>
                        <li class="active1"><a style="cursor: default;">Add Stock</a></li>
                    </ul>
                </div>
                <div class="ViewAll">
                    <div id="wrapper">
                        <h1>Inventory</h1>

                        <table id="keywords" class="table table-hover" cellspacing="0" cellpadding="0">
                            <thead>
                                <tr>
                                    <th><span>Product Name</span></th>
                                    <th class="mid"><span>Stock</span></th>
                                    <th class="mid"><span>Action</span></th>
                                </tr>
                            </thead>
                            <%
                              String url = "jdbc:mysql://localhost:3306/BEII";
                              Connection con = null;
                              PreparedStatement ps = null;
                              ResultSet rs = null;
                              try {
                                Class.forName("com.mysql.jdbc.Driver");
                                try {
                                  con = DriverManager.getConnection(url, "root", "");
                                  ps = (PreparedStatement) con.prepareStatement("Select * from product ORDER by stack ASC");
                                  rs = ps.executeQuery();
                                  while (rs.next()) {%>
                            <tr>
                                <td class="lalign"><%=rs.getString("productName")%></td>
                                <td><%=rs.getString("stack")%></td>
                                <td><button type="button" class="addd" data-toggle="modal" data-target="#Add<%=rs.getString("ID")%>">ADD</button></td>
                            </tr>
                            <%  }%> 
                        </table>
                        <script>
                            $(function () {
                                $('#keywords').tablesorter();
                            });
                        </script>
                        <%  ps = (PreparedStatement) con.prepareStatement("Select * from product ORDER by stack ASC");
                          rs = ps.executeQuery();
                          while (rs.next()) {%>
                        <div class="modal fade" id="Add<%=rs.getString("ID")%>" role="dialog">
                            <div class="modal-dialog modal-sm">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h7 class="modal-title"><%=rs.getString("productName")%> Quantity</h7>
                                    </div>
                                    <div class="modal-body form-style-5">
                                        <form action="EditStock">
                                            <input type="hidden" name="id" value="<%=rs.getString("ID")%>" />
                                            <input type="number" placeholder="Quantity" name="stock" max="1000" size="50" />
                                            <input type="submit" name="clear" value="ADD" class="form-control" size="50" style="margin: 5px;" />
                                        </form>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <%
                              }
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





                </div> <!-- End of ViewAll -->
                <script type="text/javascript">
                    $(function () {

                        $('#mytabcontent').slimScroll();

                        $('#ViewAll').slimScroll({
                            allowPageScroll: true
                        });

                    });
                </script>
            </div> <!-- End of Container2 -->
        </div>
    </body>
</html>