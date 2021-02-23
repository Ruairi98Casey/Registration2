<%-- 
    Document   : adminUpdate
    Created on : 07-Dec-2020, 22:36:47
    Author     : ruair
--%>

<!-- Reference to the source I used to complete the 'Navigation Bar' in this form - https://www.w3schools.com/css/tryit.asp?filename=trycss_navbar_horizontal_responsive (w3schools) -->
<!-- Reference to the source I used to complete the 'Admin' Functionality in this form - https://www.youtube.com/watch?v=-etRgxd9vc4 (YouTube) -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

    if (request.getParameter("submit") != null) {
        String id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String usertype = request.getParameter("usertype");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "bis2020");
        pst = con.prepareStatement("update general set fullname = ?, username = ?, email = ?, password = ?, usertype = ? where id = ?");
        pst.setString(1, fullname);
        pst.setString(2, username);
        pst.setString(3, email);
        pst.setString(4, password);
        pst.setString(5, usertype);
        pst.setString(6, id);
        pst.executeUpdate();

%>


<script>

    alert("Record Updated");

</script>


<%            }


%>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A Helping Hand</title>
        <!-- add icon link -->
        <link rel = "icon" href =  
              "https://image.freepik.com/free-vector/handshake-icon-flat-style_169241-482.jpg" 
              type = "image/x-icon"> 
        <link href="bootstrapNEW/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrapNEW/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
        
        <ul class="topnav">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">About</a></li>
            <li><a href="covid.html">Covid-19</a></li>
            <li class="right"><a href="register.jsp">Register</a></li>
            <li class="right"><a href="login.jsp">Login</a></li>
            <li class="right"><a class="active" href="adminReport.jsp">Admin Records</a></li>
        </ul>
        
        <h1>User Update</h1>

        <div class="row">   
            <div class="col-sm-4">   
                <form method="POST" action="#">

                    <%                        Connection con;
                        PreparedStatement pst;
                        ResultSet rs;

                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "bis2020");

                        String id = request.getParameter("id");
                        pst = con.prepareStatement("select * from general where id = ?");
                        pst.setString(1, id);
                        rs = pst.executeQuery();

                        while (rs.next()) {
                    %>


                    <div align="left">
                        <label class="form-label">Full Name</label>   
                        <input type="text" class="form-control" placeholder="Full Name" value="<%= rs.getString("fullname")%>" name="fullname" id="fullname" required >
                    </div>

                    <div align="left">
                        <label class="form-label">User Name</label>   
                        <input type="text" class="form-control" placeholder="User Name" value="<%= rs.getString("username")%>" name="username" id="username" required >
                    </div>

                    <div align="left">
                        <label class="form-label">Email</label>   
                        <input type="text" class="form-control" placeholder="Email" value="<%= rs.getString("email")%>" name="email" id="email" required >
                    </div>

                    <div align="left">
                        <label class="form-label">Password</label>   
                        <input type="text" class="form-control" placeholder="Password" value="<%= rs.getString("password")%>" name="password" id="password" required >
                    </div>                    

                    <!-- Select Basic -->
                    <div class="form-group">
                        <label class="col-md-3 control-label">User Type</label>
                        <div class="col-md-9">
                            <select class="form-control" value="<%= rs.getString("usertype")%>" name="usertype" id="usertype">
                                <option value="Buddy">Buddy</option>
                                <option value="Friend In Need">Friend In Need</option>
                            </select>
                        </div>
                    </div>


                    <!-- Finished Parsing name, course, value --->
                    <%
                        }
                    %>

                    </br>

                    <div align="right">
                        <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                        <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                    </div>

                    <div align="right">

                        <p><a href="adminReport.jsp">Click Back</a></p>

                    </div>

                </form>

            </div>        

        </div>

    </body>

</html>
