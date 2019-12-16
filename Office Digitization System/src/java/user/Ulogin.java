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

public class Ulogin extends HttpServlet {

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
            String dept = request.getParameter("dept");
            dept=dept.replace(" ", "_");
            session.setAttribute("dept",dept);
            //out.println(dept);
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
              Statement statement = con.createStatement();
//VERIFYING USER-NAME AND PASSWORD
            ResultSet resultSet = statement.executeQuery("SELECT * FROM "+dept+"_users where username='" + username1+ "' AND password='" + password + "';");
            if (resultSet.next()) {
//SETTING SESSION ATTRIBUTES IF LOGIN IS SUCCESSFULL
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery("Select * from admin_users");
                rs2.next();
                String u = rs2.getString(4);
                u=u+"/"+session.getAttribute("dept")+"/";
                session.setAttribute("inwdid", u);
                String s=resultSet.getString("ucreation");
                session.setAttribute("catagory",s);
                session.setAttribute("id",resultSet.getString("id"));
                session.setAttribute("username", username1);
                session.setAttribute("UserType", resultSet.getString(6));
                session.setAttribute("flash_message", "Logged in successfully !!!");
                session.setAttribute("flash_type", "success");
                response.sendRedirect("index.jsp");
                out.println("login success");
            } else {
//UNSUCCESSFULL LOGIN
                session.setAttribute("flash_message", "failed. try again");
                session.setAttribute("flash_type", "danger");
                response.sendRedirect("ulogin.jsp");
                //out.println("sorry unsuccessfull login");                
            }

        } catch (Exception ex) {
           // out.println("exception="+ex);
             response.sendRedirect("ulogin.jsp");
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
