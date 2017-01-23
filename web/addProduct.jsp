
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <%

          String user = (String) session.getAttribute("us");
          if (user == null) {
            String cpage = "addProduct.jsp";
            session.setAttribute("cpage", cpage);
            response.sendRedirect("Admin");

          }
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <link rel="stylesheet" href="CSS/Admin/main.css">
        <link rel="stylesheet" href="CSS/Admin/Manage.css">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="CSS/component.css" />
        <link rel="stylesheet" type="text/css" href="CSS/demo.css" />
        <link rel="stylesheet" type="text/css" href="CSS/normalize.css" />
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
       
            
        
    </head>
    <body>
        <script>

            if (<%=session.getAttribute("accept")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Product Already Exist!');
                    }, 500);
                });
            } else {
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
            <% session.removeAttribute("accept");%>
            }
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
            <div id="navigator2">
                <ul>
                    <li><a href="ViewAll">ViewAll</a></li>
                    <li><a href="ViewWood">Wood</a></li>
                    <li><a href="ViewGlass">Glass</a></li>
                    <li><a href="ViewGolf">Golf</a></li>
                    <li class="active1" style="cursor: default;"><a>AddProduct</a></li>
                    <li><a href="AddStock">AddStock</a></li>
                </ul>
            </div>
            <h1>ADD PRODUCT</h1>
            <form name="fileform" method="post" action="uploadServlet" enctype="multipart/form-data">
                <table>
                    <tr>

                        <td colspan="2"><input type="text" name="productname" size="50" class="form-control" placeholder="Name of product" style="margin: 5px;" required/></td>
                    </tr>
                    <tr>

                        <td colspan="2"><input type="number" name="price" size="50" class="form-control" placeholder="Price of product" step="0.01" style="margin: 5px;" required/></td>
                    </tr>
                    <tr>

                        <td colspan="2"><textarea type="text" name="description" class="form-control"  placeholder="Description"  rows="auto" style="margin: 5px;" cols="20" required></textarea></td>
                    </tr>
                    <tr>
                        <td><label for="type">Type: </label></td>
                        <td><select name="type" class="styled-select blue semi-square">
                                <option value="Wood">Wood</option>
                                <option value="Golf">Golf</option>
                                <option value="Glass">Glass</option>

                            </select>
                        </td>
                    </tr>
                    <tr>

                        <td colspan="2"><input type="file" id="photo" name="photo" size="50" accept="image/jpeg" class="inputfile inputfile-5" required/>
                            <label for="photo"><figure><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg></figure> <span>Choose a file&hellip;</span></label>
                        </td>
                    <script src="JS/file.js" type="text/javascript"></script>
                    </tr>
                    <tr>
                        <td colspan="2"><center><input type="submit" value="Save" class="btn btn-sm"/></center></td>
                    </tr>

                </table>
            </form>
        </div>

    </body>
</html>
