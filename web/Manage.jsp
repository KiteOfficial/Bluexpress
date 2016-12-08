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
                    <li><a href="OrderedList.jsp">Ordered List</a></li>
                    <li class="active"><a>Manage Product</a></li>
                    <li><a href="ManagePage.jsp">Manage Page</a></li>
                    <li style="float: right;"><a href="LogOut">Logout</a></li>
                </ul>
            </div>
            <div id="navigator2">
                <ul>
                    <li class="active1"><a style="cursor: default;">ViewAll</a></li>
                    <li><a href="#home">Wood</a></li>
                    <li><a href="#news">Glass</a></li>
                    <li><a href="#contact">Golf</a></li>
                    <li><a href="addProduct.jsp" target="_self">AddProduct</a></li>
                </ul>
            </div>
            <div id="ViewAll">
                <table align="center" border="1px">
                    <% Iterator itr; %>
                    <% List prod = (List) request.getAttribute("prod"); %>
                    <% for (itr = prod.iterator(); itr.hasNext();) { %>
                    <tr>
                        <% String s = (String) itr.next();%>
                        <td> <%=s%></td>
                        <td> <%=itr.next()%></td>
                        <td> <%=itr.next()%></td>
                        <td> <%=itr.next()%></td>
                        <td> <%=itr.next()%></td>
                        <td> <input type="submit" value="Edit" name="Edit" onclick="editRecord(<%=s%>);"</td>
                        <td> <input type="submit" value="Delete" name="Delete" onclick="deleteRecord(<%=s%>);"</td>

                    </tr>
                    <% }%>
                </table>
            </div>
        </div>
    </body>
</html>