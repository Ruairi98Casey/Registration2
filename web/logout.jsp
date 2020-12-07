<%-- 
    Document   : logout
    Created on : 24-Nov-2020, 18:52:55
    Author     : ruair
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A Helping Hand</title>

        <!-- add icon link -->
        <link rel = "icon" href =  
              "https://image.freepik.com/free-vector/handshake-icon-flat-style_169241-482.jpg" 
              type = "image/x-icon"> 
    </head>
    <body>
        <!-- If user logs out, they are redirected to index.jsp -->
        
        <%session.invalidate();%>

        <jsp:forward page="index.jsp" />

    </body>
</html>
