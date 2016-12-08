

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function startTime() {
                var today = new Date();
                var month = new Array();
                month[0] = "January";
                month[1] = "February";
                month[2] = "March";
                month[3] = "April";
                month[4] = "May";
                month[5] = "June";
                month[6] = "July";
                month[7] = "August";
                month[8] = "September";
                month[9] = "October";
                month[10] = "November";
                month[11] = "December";
                var mo = month[today.getMonth()];
                var d = today.getDate();
                var y = today.getFullYear();
                var h = today.getHours();
                var m = today.getMinutes();
                var s = today.getSeconds();
                var ampm = h >= 12 ? 'PM' : 'AM';
                h = h % 12;
                h = h ? h : 12;
                m = m < 10 ? '0' + m : m;
                
                document.getElementById('txt').innerHTML =
                        mo + " " + d + " " + y + "</br>" + h + ":" + m + " " + ampm;
                var t = setTimeout(startTime, 500);
            }
           
        </script>
        <link rel="stylesheet" href="CSS/main.css">
        <link rel="stylesheet" href="CSS/clock.css">
    </head>
    <body onload="startTime()" allowtransparency="true">
        <div id="txt"></div>

    </body>

</html>
