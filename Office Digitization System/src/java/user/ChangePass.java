
package user;

import db.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class ChangePass extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
         
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
                     try {
                    HttpSession session=request.getSession(true);
//CONNECTING DATABASE
                    Dbconn db=new Dbconn();
                    Connection con =Dbconn.connect();
                    //out.println(con);
                    Statement st = con.createStatement();
                    String UT=(String) session.getAttribute("UserType");
                    if(UT.equals("allow") || UT.equals("disallow") || UT.equals(null)){
                        UT=(String) session.getAttribute("dept");
                    }
                    if(session.getAttribute("catagory")!="" || session.getAttribute("catagory")!=null){
                        UT="dept";
                    }
                    String UN=(String) session.getAttribute("username");
                    String oldpass =request.getParameter("oldpass");
                    
                    System.out.println(oldpass);
                    ResultSet RS = st.executeQuery("SELECT * FROM "+UT+"_users where username='" +UN+ "' AND password='" +oldpass+ "';");
                    
                    System.out.println(UT);
                    if(RS.next()){
                    System.out.println("password correct");
                    String newpass =(String) request.getParameter("newpass"); 
                    String confirmpass =(String) request.getParameter("confirmpass");
                    if(newpass.equals(confirmpass)){
                    String sql1 = "UPDATE "+UT+"_users set password ='"+newpass+"' WHERE username ='"+UN+"';";
                    //Statement st = con.createStatement();
                    int rs=st.executeUpdate(sql1);
                    if(rs!=0){
                    System.out.println("password changed");
                    session.setAttribute("flash_message", "Password Changed");
                    session.setAttribute("flash_type", "success");
                    response.sendRedirect("ChangePass.jsp");
                //System.out.println("sql"+sql1);
                    } 
                    }
                    else{
                session.setAttribute("flash_message", "Passwords Don't Match");
                session.setAttribute("flash_type", "warning");
                response.sendRedirect("ChangePass.jsp");
                    }
                     }else{
                        //flash for wrong password
                 session.setAttribute("flash_message", "Wrong Password");
                 session.setAttribute("flash_type", "warning");
                 response.sendRedirect("ChangePass.jsp");
                    }
                    }
                catch (Exception e) {
                e.printStackTrace();
            }
                    finally{
               out.close();
            }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
