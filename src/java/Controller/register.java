
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ruair REGISTRATION 2
 */
public class register extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        
 
    }

    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
                PrintWriter out = response.getWriter();
        
        //now here we need to add JDBC connection and take values from jsp and insert in into our database
        
        String fullname = request.getParameter("fname");
        String username = request.getParameter("uname");
        String email = request.getParameter("email");
        String password = request.getParameter("psw");
        String confirmpass = request.getParameter("cnfpsw");
        
        // here we are taking user enter values from jsp and with the help of this servlet we are able to inster it into the database
        
        try{
            
            Connection con;
            
            Class.forName("com.mysql.jdbc.Driver");
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","bis2020");
                    
            System.out.println("Connected");
            
            //now we are connected with the DB
            
            String sql = "insert into register.register(fullname,username,email,password,confirmpass) values(?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(sql);
            
            ps.setString(1, fullname);
            ps.setString(2, username);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, confirmpass);
            
            
            ps.executeUpdate();
            
            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
            
            
        }catch(Exception e){
                System.out.println("ERROR :: "+e.getMessage());
                }
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
