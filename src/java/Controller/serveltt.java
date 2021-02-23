/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Source code used in this form - https://www.youtube.com/watch?v=4XNzeodniZg (YouTube)

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/serveltt")
public class serveltt extends HttpServlet 
{
     int i;
    Connection con;
    PreparedStatement pst;
    ResultSet rs;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        try {
            i++;
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            String USER= request.getParameter("combo");

            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/users?useSSL=false", "root", "bis2020");
            pst = con.prepareStatement("select fullname,username,email,usertype from general where usertype=?");
            pst.setString(1, USER);
            rs = pst.executeQuery();
             out.println("<br>");
             out.println("<br>");
             out.println("<table width=60% border= 1 align=center   >");
             out.println("<tr><td colspan=4 " );
             out.println("<center><h2><center>List of Users</h2></center>");	
             out.println("</td></tr>");
             out.println("<tr>");
             out.println("<th>Full Name</th>");
             out.println("<th>User Name</th>");
             out.println("<th>Email</th>");
             out.println("<th>User Type</th>");
             out.println("</tr>");

              while(rs.next())
              {
                  out.println("<tr>");
                  out.println("<td>" + rs.getString("fullname") + "</td> ");
                  out.println("<td>" + rs.getString("username") + "</td> ");
                  out.println("<td>" + rs.getString("email") + "</td> ");
                  out.println("<td>" + rs.getString("usertype") + "</td> ");
                  out.println("</tr>");

                  
              }
              out.println("</table>");
        
               } 
            catch (ClassNotFoundException ex) {
           
        }catch (Exception e) 
        { throw new ServletException("error", e); }
    }
    
    public void destory()
    {
        i = 0;
    }

    
}