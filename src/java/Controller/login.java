
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ruair REGISTRATION 2
 */
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            PrintWriter out = response.getWriter();
            
            //request for parameters username & password to jsp
            
            String username = request.getParameter("uname");
            String password = request.getParameter("psw");
            
            //creating connection to proceed further
            
            try{
                Connection con;
                
                Class.forName("com.mysql.jdbc.Driver");
                
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb?useSSL=false","root","bis2020");
                
                System.out.println("Connected Login Part"); //connection complete
                
                String sql = "select * from register.register where username=? and password=?";
                
                PreparedStatement ps = con.prepareStatement(sql);//this will run the query
                
                ps.setString(1, username);
                ps.setString(2, password);
                
                //after this we need DB username and Db password to match from user input & database
                
                String unameDB = "";
                String passDb = "";
                
                ResultSet rs = ps.executeQuery();
                
                while(rs.next()){
                    unameDB = rs.getString("username");
                    passDb = rs.getString("password");
                    
                    System.out.println("Database username ::: "+unameDB);
                    System.out.println("Database password ::: "+passDb);
                }
                
                
                if(username.equals(unameDB) && password.equals(passDb)){
                    System.out.println("Inside IFF");
                    
                    HttpSession session=request.getSession();
                    
                    session.setAttribute("username", username);
                    
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    rd.forward(request, response);
                    
                }else{
                    System.out.println("Inside ELSEE");
                    request.setAttribute("error", "INVALID CREDENTIALS");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.include(request, response);
                    
                }
                
                //Login done and working as expected
                //Now I will change the navigation bar
                
                
                
                
            }catch(Exception e){
                System.out.println("Error From LOGIN PART ::"+e.getMessage());
            }
            
            
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
