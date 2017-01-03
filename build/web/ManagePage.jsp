<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%

          String user = (String) session.getAttribute("us");
          if (user == null) {
            String cpage = "ManagePage.jsp";
            session.setAttribute("cpage", cpage);
            response.sendRedirect("Admin");

          }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/Admin/main.css">
        <link rel="stylesheet" href="CSS/Admin/Manage.css">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" href="CSS/Admin/bootstrapCDN.css">
        <link rel="stylesheet" type="text/css" href="CSS/component.css" />
        <link rel="stylesheet" type="text/css" href="CSS/demo.css" />
        <link rel="stylesheet" type="text/css" href="CSS/normalize.css" />
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
    </head>
    <body>
        <div id="Container">
            <div id="navigator">
                <ul>
                    <li><a href="OrderedList">Ordered List</a></li>
                    <li><a href="ViewAll">Manage Product</a></li>
                    <li class="active"><a>Manage Page</a></li>
                    <li style="float: right;"><a href="LogOut">Logout</a></li>
                    <li style="float: right;"><a href="Welcome">Page</a></li>
                </ul>
            </div>
            <div id="navigator2">
                <ul>
                    <li class="active1"><a style="cursor: default;">Home</a></li>
                    <li><a href="ManageAbout">About</a></li>
                </ul>
            </div>
            <div id="uploadimage" style="float: right;">
                <form action="UpdateHome" method="POST" enctype="multipart/form-data">

                    <table id="tables">
                        <%
                          for (int i = 1; i <= 5; i++) {
                        %>
                        <tr>
                            <td><p>Image<%=i%></p></td>
                            <td class="tabpic"><img class="mySlides" src="Images/slider/Image<%=i %>.jpg"></td>
                            <td>
                                <input type="file" name="file<%=i%>" id="file<%=i%>" class="inputfile inputfile-4" accept="image/jpeg"/>
                                <label for="file<%=i%>"><figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure> <span>Choose a file&hellip;</span></label>

                            </td>
                            <td><input type="submit" class="btn btn-primary input-lg" name="im<%=i%>"/></td>
                        </tr>
                        <% }%>

                        <script src="JS/file.js" type="text/javascript"></script>
                    </table>

                </form>
            </div>
            <script type="text/javascript">
                $(function () {

                    $('#mytabcontent').slimScroll();

                    $('#uploadimage').slimScroll({
                        allowPageScroll: true
                    });

                });
            </script>
        </div>
    </body>
</html>

