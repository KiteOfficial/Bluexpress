
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title></title>
        <link rel="stylesheet" href="CSS/Admin/main.css">
        <link rel="stylesheet" href="CSS/Admin/Manage.css">
    </head>
    <body>

        <div id="Container">
            <div id="navigator">
                <ul>
                    <li><a href="OrderedList.jsp">Ordered List</a></li>
                    <li class="active"><a>Manage Product</a></li>
                    <li><a href="ManagePage.jsp">Manage Page</a></li>
                </ul>
            </div>
            <div id="navigator2">
                <ul>
                    <li><a href="ViewAll">ViewAll</a></li>
                    <li><a href="#home">Wood</a></li>
                    <li><a href="#news">Glass</a></li>
                    <li><a href="#contact">Golf</a></li>
                    <li class="active1"><a>AddProduct</a></li>
                </ul>
            </div>
            <h1>ADD PRODUCT</h1>
            <form name="fileform" method="post" action="uploadServlet" enctype="multipart/form-data">
                <table>
                    <tr>
                        <td><label for="productName">Product Name:</label></td>
                        <td><input type="text" name="productname" size="50" placeholder="Name of product" required/></td>
                    </tr>
                    <tr>
                        <td><label for="price">Price: </label></td>
                        <td><input type="number" name="price" size="50" placeholder="Price of product" step="0.01" required/></td>
                    </tr>
                    <tr>
                        <td><label for="description">Description: </label></td>
                        <td><textarea type="text" name="description"  placeholder="Description"  rows="auto" cols="20" required></textarea></td>
                    </tr>
                    <tr>
                        <td><label for="type">Type: </label></td>
                        <td><select name="type">
                                <option value="Wood">Wood</option>
                                <option value="Golf">Golf</option>
                                <option value="Glass">Glass</option>

                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="photo">Photo:  </label></td>
                        <td><input type="file" name="photo" size="50" accept="image/jpeg" required/>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><center><input type="submit" value="Save"/></center></td>
                    </tr>
                </table>
            </form>
        </div>

    </body>
</html>
