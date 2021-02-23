<%-- 
    Document   : index
    Created on : 24-Nov-2020, 17:58:58
    Author     : ruair
--%>

<!-- Reference to the source I used to complete the 'Register' functionality in this form - https://www.youtube.com/watch?v=lBB_hZj_vXM (YouTube) -->
<!-- Reference to the source I used to complete the 'Login' & 'Log Out' functionality in this form - https://www.youtube.com/watch?v=7u9XtWIXzOA (YouTube) -->
<!-- Reference to the source I used to complete the 'Navigation Bar' in this form - https://www.w3schools.com/css/tryit.asp?filename=trycss_navbar_horizontal_responsive (w3schools) -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <title>A Helping Hand</title>
        <link href="bootstrapNEW/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrapNEW/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- add icon link -->
        <link rel = "icon" href =  
              "https://image.freepik.com/free-vector/handshake-icon-flat-style_169241-482.jpg" 
              type = "image/x-icon"> 
                <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Applying CSS to the navigation bar -->
        <style>

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
        

        <!-- Retrieving session from login.java --> 
        <%
            String Name = (String) session.getAttribute("username");
            System.out.println("USERNAME INDEX JSP" + Name);

            if (Name == null) {
                //if name null then no one is logged in so it show this

        %>
        


        <ul class="topnav">
            <li><a class="active" href="#home">Home</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">About</a></li>
            <li><a href="covid.html">Covid-19</a></li>
            <li class="right"><a href="register.jsp">Register</a></li>
            <li class="right"><a href="login.jsp">Login</a></li>
            <li class="right"><a href="adminReport.jsp">Admin Records</a></li>
        </ul>

    </br><center><h1>Welcome to A Helping Hand</h1></center>

    <%} else if (Name != null) {
        //if name not null then someone is logged in, then we are going to change the navigation bar 
    %>

    <!-- Navigation bar when someone is logged in -->

    <ul class="topnav">
        <li><a class="active" href="#home">Home</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Contact</a></li>
        <li><a href="#">About</a></li>
        <li><a href="covid.html">Covid-19</a></li>
        <li class="right"><a href="logout.jsp">Log Out</a></li>
    </ul>

    <!-- Retrieving session from login.java and displaying username from DB on form if logged -->
    <br>
    <h5 style="color: black; font-size: 20px;">Welcome, <%out.println(Name);%></h5>
    <br>
    
    <!-- Source code used for search functionality this form - https://www.youtube.com/watch?v=4XNzeodniZg (YouTube) -->
    
        <div align="center" class="container">

            <div class="form-group">
                <h2>Search Users</h2>
            </div>
            <br>
            <div class="form-group">
                <form method="get" action="serveltt">    <!-- Name of serveltt.jsp --> 
                    <div class="form-group">                       
                        <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            try {
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "bis2020");
                                pst = con.prepareStatement("select distinct usertype from general"); //distint will only show value once in comebo box
                                rs = pst.executeQuery();

                                if (rs.next()) {
                                    out.println("<tr>");
                                    out.println("<td>Choose User Type</td>");
                                    out.println("<td>");
                                    out.println("<select name='combo'>");
                                    do {
                                        //creating 'USER' variable to store the 'usertype' field from MySQL
                                        String USER = rs.getString("usertype");
                                        out.println("<option value='" + USER + "'>" + USER + "</option>");
                                    } while (rs.next());
                                    out.println("</select>");
                                    rs.close();
                                    out.println("</td></tr>");
                                    out.println("</tr><td colspan=2 align=center><input type=submit  value=Search></td></tr>");
                                } else {
                                    out.println("<tr>");
                                    out.println("<td colspan=2 align=right>");
                                    out.println("Sorry table is Empty");
                                    out.println("</td>");
                                }

                                out.println("</form>");
                            } catch (Exception e) {
                                e.printStackTrace(); // Or System.out.println(e);
                            }

                        %>
                    </div>


                </form>                     

            </div>      

        </div>

    <%}%>


</body>
</html>