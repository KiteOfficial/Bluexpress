<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/Admin/ViewProduct.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
    </head>
    <body>
        <script type="text/javascript">
            function editRecord(id) {
                url = "EditRecord";
                window.location.href = "http://localhost:8080/BEII1/" + url + "?id=" + id;
            }

            function deleteRecord(id) {
                if (confirm("Are you sure?")) {
                    url = "DeleteRecord";
                    window.location.href = "http://localhost:8080/BEII1/" + url + "?id=" + id;
                }
                return false;
            }
        </script>
        <div id="Container">
            <div id="navigator">
                <ul>
                    <li><a href="OrderedList">Ordered List</a></li>
                    <li class="active"><a>Manage Product</a></li>
                    <li><a href="ManagePage.jsp">Manage Page</a></li>
                    <li style="float: right;"><a href="LogOut">Logout</a></li>
                    <li style="float: right;"><a href="Welcome">Page</a></li>
                </ul>
            </div>
            <div id="Container2">
                <div id="navigator2">
                    <ul>
                        <li><a href="ViewAll">ViewAll</a></li>
                        <li class="active1"><a style="cursor: default;">Wood</a></li>
                        <li><a href="ViewGlass">Glass</a></li>
                        <li><a href="ViewGolf">Golf</a></li>
                        <li><a href="addProduct.jsp" target="_self">AddProduct</a></li>
                        <li><a href="AddStock" target="_self">AddStock</a></li>
                    </ul>
                </div>
                <div class="ViewAll">
                    <div id="wrapper">
                    <table id="viewprod" class="table table-hover" align="center">
                        <thead>
                            <tr >
                                <th class="ids">ID</th>
                                <th class="names">Product Name</th>
                                <th>Price</th>
                                <th>Description</th>
                                <th>Type</th>
                                <th colspan="2">Action</th>
                            </tr>
                        </thead>
                        <% Iterator itr; %>
                        <% List prod = (List) request.getAttribute("prod"); %>
                        <% for (itr = prod.iterator(); itr.hasNext();) { %>
                        <tr>
                            <% String s = (String) itr.next();%>
                            <td class="ids"> <%=s%></td>
                            <td class="names"> <%=itr.next()%></td>
                            <td> <%=itr.next()%></td>
                            <td> <%=itr.next()%></td>
                            <td> <%=itr.next()%></td>
                            <td> <input class="btn btn-primary btn-block" type="submit" value="Edit" name="Edit" onclick="editRecord(<%=s%>);"</td>
                            <td> <input class="btn btn-primary btn-block" type="submit" value="Delete" name="Delete" onclick="deleteRecord(<%=s%>);"</td>

                        </tr>
                        <% }%>
                    </table>
                    </div>
                </div> <!-- End of ViewAll -->
                <script type="text/javascript">
                    $(function () {

                        $('#mytabcontent').slimScroll();

                        $('#wrapper').slimScroll({
                            allowPageScroll: true
                        });

                    });
                </script>
            </div> <!-- End of Container2 -->
        </div>
    </body>
</html>