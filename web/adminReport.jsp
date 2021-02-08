<%-- 
    Document   : adminReport
    Created on : 07-Dec-2020, 20:17:02
    Author     : ruair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<%

    if (request.getParameter("submit") != null) {
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
        pst = con.prepareStatement("insert into general(fullname,username,email,password,usertype)values(?,?,?,?,?)");
        pst.setString(1, fullname);
        pst.setString(2, username);
        pst.setString(3, email);
        pst.setString(4, password);
        pst.setString(5, usertype);
        pst.executeUpdate();

%>
<script>

    alert("Record Added");

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
            <li class="right"><a href="register.jsp">Register</a></li>
            <li class="right"><a href="login.jsp">Login</a></li>
            <li class="right"><a class="active" href="adminReport.jsp">Admin Records</a></li>
        </ul>

    <center><h1>A Helping Hand</h1></center>
    <center><h5>Administration Records</h5></center>

    </br>
    <!-- Designing form -->
    <div class="row">
        <div class="col-sm-4">   
            <form method="POST" action="#">

                <div align="left">
                    <label class="form-label">Full Name</label>   
                    <input type="text" class="form-control" placeholder="Full Name" name="fullname" id="fullname" required >
                </div>

                <div align="left">
                    <label class="form-label">User Name</label>   
                    <input type="text" class="form-control" placeholder="User Name" name="username" id="username" required >
                </div>

                <div align="left">
                    <label class="form-label">Email</label>   
                    <input type="text" class="form-control" placeholder="Email" name="email" id="email" required >
                </div>

                <div align="left">
                    <label class="form-label">Password</label>   
                    <input type="text" class="form-control" placeholder="Password" name="password" id="password" required >
                </div>

                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-3 control-label" for="usertype">User Type</label>
                    <div class="col-md-9">
                        <select style="width:440px" id="usertype" name="usertype" class="form-control">
                            <option value="Buddy">Buddy</option>
                            <option value="Friend In Need">Friend In Need</option>
                        </select>
                    </div>
                </div>

                </br>

                <div align="right">
                    <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                    <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                </div>

            </form>

        </div>
        <!-- Designing table which will display DB information on users -->
        <div class="col-sm-8">   

            <div class="panel-body">
                <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">
                    <thead>
                        <tr>
                            <th>Full Name</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>User Type</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>

                        <!-- Establishing DB Connection using JSP -->
                        <%                                Connection con;
                            PreparedStatement pst;
                            ResultSet rs;

                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "bis2020");

                            String query = "select * from general";
                            Statement st = con.createStatement();
                            rs = st.executeQuery(query);

                            while (rs.next()) {
                                String id = rs.getString("id");
                        %>

                        <!-- Retrieving Data for table -->
                        <tr>
                            <td><%=rs.getString("fullname")%></td>
                            <td><%=rs.getString("username")%></td>
                            <td><%=rs.getString("email")%></td>
                            <td><%=rs.getString("password")%></td>
                            <td><%=rs.getString("usertype")%></td>
                            <td><a href="adminUpdate.jsp?id=<%=id%>" data-toggle="tooltip" title="Edit a record">Edit</a></td>
                            <td><a href="adminDelete.jsp?id=<%=id%>" data-toggle="tooltip" title="Delete a record">Delete</a></td>
                        </tr>

                        <%
                            }
                        %>                   
                </table>
            </div>
        </div>
    </div>
</body>
</html>
