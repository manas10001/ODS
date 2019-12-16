package user;

import db.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class DevLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        try {          
//GETTING PARAMETERS AND CONNECTING DATABASE
            String username1 = request.getParameter("username");
            String password = request.getParameter("password");
//CONNECTING DATABASE
             Dbconn db=new Dbconn();
            Connection con =db.connect();          
            
              //out.println(con);
              Statement statement = con.createStatement();
//VERIFYING USER-NAME AND PASSWORD
            ResultSet resultSet = statement.executeQuery("SELECT * FROM dev_users where username='" + username1+ "' AND password='" + password + "';");
            if (resultSet.next()) {
//SETTING SESSION ATTRIBUTES IF LOGIN IS SUCCESSFULL
                session.setAttribute("UserType", "devlop");
                session.setAttribute("username", username1);
                session.setAttribute("flash_message", "Logged in successfully !!!");
                session.setAttribute("flash_type", "success");
                response.sendRedirect("index.jsp");

            } else {
//UNSUCCESSFULL LOGIN
                session.setAttribute("flash_message", "failed. try again");
                session.setAttribute("flash_type", "danger");
                response.sendRedirect("Devlogin.jsp");
                //out.println("sorry");
                
            }

        } catch (Exception ex) {
            //out.println("exception="+ex);
             response.sendRedirect("Devlogin.jsp");
            Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
