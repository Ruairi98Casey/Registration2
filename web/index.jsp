<%-- 
    Document   : index
    Created on : 24-Nov-2020, 17:58:58
    Author     : ruair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- Applying CSS to navigation bar -->
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
            System.out.println("USRENAME INDEX JSP" + Name);

            if (Name == null) {
                //if name null then no one is logged in so it show this

        %>


        <ul class="topnav">
            <li><a class="active" href="#home">Home</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">About</a></li>
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
        <li class="right"><a href="logout.jsp">Log Out</a></li>
    </ul>

    <!-- Retrieving session from login.java and displaying username from DB on form if logged --> 
    <h5 style="color: black; font-size: 20px;">Welcome, <%out.println(Name);%></h5>

    <div class="col-sm-8">   

        <div class="panel-body">
            <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>User Name</th>
                        <th>User Type</th>
                    </tr>

                    <%                                Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "bis2020");

                        String query = "select * from general where usertype = 'Friend In Need'";
                        Statement st = con.createStatement();
                        rs = st.executeQuery(query);

                        while (rs.next()) {
                            String id = rs.getString("id");
                    %>

                    <tr>
                        <td><%=rs.getString("fullname")%></td>
                        <td><%=rs.getString("username")%></td>
                        <td><%=rs.getString("usertype")%></td>
                    </tr>

                    <%
                        }
                    %>                   
            </table>
        </div>
    </div>

    <%}%>


</body>
</html>