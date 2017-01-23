<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="CSS/Admin/main.css">
        <link rel="stylesheet" href="CSS/Admin/Manage.css">
        <link rel="stylesheet" href="CSS/Admin/ManageAbout.css">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <script src="JS/jquery.slimscroll.js"></script>
    </head>
    <body>
        <script>

            if (<%=session.getAttribute("tanggap")%>) {
                var dialog = bootbox.dialog({
                    message: '<p><i class="fa fa-spin fa-spinner"></i> Loading...</p>',
                    size: 'small',
                    backdrop: true
                });
                dialog.init(function () {
                    setTimeout(function () {
                        dialog.find('.bootbox-body').html('Successully update!');
                    }, 500);
                });
            }
            <% session.removeAttribute("tanggap");%>

        </script>
        <div id="Container">
            <div id="navigator">
                <ul>
                    <li><a href="OrderedList">Ordered List</a></li>
                    <li><a href="ViewAll">Manage Product</a></li>
                    <li class="active"><a>Manage Page</a></li>
                    <li><a href="#">Manage Report</a></li>
                    <li style="float: right;"><a href="LogOut">Logout</a></li>
                    <li style="float: right;"><a href="Welcome">Page</a></li>
                </ul>
            </div>
            <div id="navigator2">
                <ul>
                    <li><a href="ManagePage">Home</a></li>
                    <li style="cursor: default;" class="active1"><a>About</a></li>
                </ul>
            </div>
            <div id="AboutContainer main">

                <div id="tablecontent" class="class1">

                    <div class="form-style-5">
                        <form action="ManageAbout" method="Post">
                            <fieldset>
                                <legend><span class="number">0</span>Information</legend>

                                <div class="text1">
                                    <input type="email" name="email" placeholder="Sample@site.domain" class="name"/>
                                </div>

                                <div class="text1">
                                    <input type="text" name="fb" placeholder="Facebook" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="text" name="insta" placeholder="Instagram" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="number" placeholder="Smart/TnT/Sun Number" class="name" name="sn" />
                                </div>
                                <div class="text1">
                                    <input type="number" name="gn" placeholder="Globe/TM/" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="number" name="tn" placeholder="Telephone Number" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="text" name="add" placeholder="Address" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="text" name="comname" placeholder="Company Name" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="text" name="fname" placeholder="First Name" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="text" name="lname" placeholder="Last Name" class="name" />
                                </div>
                                <div class="text1">
                                    <input type="text" name="map" placeholder="Embed Google Map" class="name">
                                </div>
                                <div class="help-tip">
                                    <p>To get the map from google:
                                        Go to maps.google.com and set your desire location. Then go to menu and click "share or embed map" select emmbed map tab and copy a small link</p>
                                </div>


                            </fieldset>
                            <input type="submit" value="Update" name="update" />
                        </form>
                    </div>
                </div>

            </div>
    </body>
</html>
<!-- <div id="input"> 
                            <input type="submit" class="myButton" value="Update" name="update"/>
                        </div> -->
