<%-- 
    Document   : AdminDelete
    Created on : 07-Dec-2020, 22:39:29
    Author     : ruair
--%>

<!-- Reference to the source I used to complete the 'Admin' Functionality in this form - https://www.youtube.com/watch?v=-etRgxd9vc4 (YouTube) -->

<%@page import="java.sql.*" %>



<%

        String id = request.getParameter("id");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "bis2020");
        pst = con.prepareStatement("delete from general where id = ?");

        pst.setString(1, id);
        pst.executeUpdate();

%>


<script>

    alert("Record Deleted");

</script>



