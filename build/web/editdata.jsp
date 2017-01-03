<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="UpdateData" method="POST">
            <table>


                <tr>
                    <td>ID</td>
                    <td><input type="text" name="ID" value="<%=(String) request.getAttribute("ID")%>" readonly/></td>
                </tr>
                <tr>
                    <td>Product Name</td>
                    <td><input type="text" name="productname" value="<%= request.getAttribute("name")%>"/></td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td><input type="text" name="price" value="<%=(String) request.getAttribute("price")%>"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea style="resize: none;" type="text" name="description"  rows="10" cols="30" ><%=(String) request.getAttribute("details")%></textarea></td>
                </tr>
                <tr>
                    <td>Type</td>
                    <td>
                        <select name="type">
                            <option value="Wood">Wood</option>
                            <option value="Golf">Golf</option>
                            <option value="Glass">Glass</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="update" value="Update"/></td>
                </tr>


            </table>
        </form>
    </body>
</html>
