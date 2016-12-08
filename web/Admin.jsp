<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="CSS/bootstrap.min.css">
        <script src="JS/jquery.min.js"></script>
        <script src="JS/bootstrap.min.js"></script>
        <link rel="stylesheet" href="CSS/adminlogin.css">
        <title>ADMIN</title>
    </head>
    <body>
        <div id="AdminContainer" class="container">
            <div class="row">
                <div class="col-md-offset-5 col-md-3">
                    <div class="form-login">
                        <h4>Welcome back.</h4>
                        <form name="login" method="POST" action="AdminAuth">
                            <table>
                                <tr>
                                <input type="text" id="userName" name="userName" class="form-control input-sm chat-input" placeholder="Username" />
                                </tr>
                                <tr>
                                <input type="password" id="userPassword" name="userPassword" class="form-control input-sm chat-input" placeholder="Password" />
                                </tr>
                                <tr>
                                <input type="submit" class="btn btn-primary btn-md" value="LOGIN" name="Login"/>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
