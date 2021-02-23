<%-- 
    Document   : login
    Created on : 24-Nov-2020, 18:02:03
    Author     : ruair
--%>

<!-- Reference to the source I used to complete the 'Login' functionality in this form - https://www.youtube.com/watch?v=7u9XtWIXzOA (YouTube) -->
<!-- Reference to the source I used to complete the 'Navigation Bar' in this form - https://www.w3schools.com/css/tryit.asp?filename=trycss_navbar_horizontal_responsive (w3schools) -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A Helping Hand</title>
        <link href="bootstrapNEW/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrapNEW/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- add icon link -->
        <link rel = "icon" href =  
              "https://image.freepik.com/free-vector/handshake-icon-flat-style_169241-482.jpg" 
              type = "image/x-icon"> 

        <style>

            .registercontainer{
                width: 100%;
                height: auto;
                text-align: center;
            }


            body {margin: 0;}

            ul.topnav {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
            }

            ul.topnav li {float: left;}

            ul.topnav li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            ul.topnav li a:hover:not(.active) {background-color: #111;}

            ul.topnav li a.active {background-color: #4CAF50;}

            ul.topnav li.right {float: right;}

            @media screen and (max-width: 600px) {
                ul.topnav li.right, 
                ul.topnav li {float: none;}
            }
        </style>


    </head>
    <body>

        <ul class="topnav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">About</a></li>
            <li><a href="covid.html">Covid-19</a></li>
            <li class="right"><a class="active" href="login.jsp">Login</a></li>
        </ul>
        
        <br>
        
        <div class="registercontainer">

            <form action="login" method="post">

                <label>User Name</label><br/> 
                <input type="text" placeholder="Enter Username" name="uname" required></br>

                <br>
                
                <label>Password</label><br/> 
                <input id="password" type="password" placeholder="Enter Password" name="psw"></br><br/>
                <!--error message if login details are incorrect-->
                <span style="color: red;">${error}</span><br>
                <input type="submit" id="submit" value="LOGIN"></br> 

            </form>

        </div>

    </body>
</html>

