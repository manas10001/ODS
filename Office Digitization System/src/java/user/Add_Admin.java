package user;

import db.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Add_Admin extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
        try{
            HttpSession session=request.getSession(true);
//STORING SESSION VARIABLES INTO VARIABLES
            String office=request.getParameter("ofname");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String sql="SELECT * FROM admin_users WHERE username='"+username+"'";
//CONNECTING DATABASE
             Dbconn db=new Dbconn();
            Connection con =db.connect();
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery(sql);
//IF USER IS NOT ALREADY PRESENT
            if(!rs.next()){
//ADDING THE ADMIN CREDENTIALS IF THE ACCOUNT IS NOT ALREADY AVAILABLE 
                String sql1="INSERT INTO admin_users (username,password,office) VALUES('"+username+"','"+password+"','"+office+"')";
                int count = st.executeUpdate(sql1);
                if (count > 0) {
                    session.setAttribute("flash_message", "'"+username+"' User added successfully");
                    session.setAttribute("flash_type","success");
                    response.sendRedirect("Add_Admin.jsp");
                }
//IF UUSER ACCOUNT ALREADY EXISTS
                else{
                    session.setAttribute("flash_message", "ACCOUNT ALREADY EXISTS!");
                    session.setAttribute("flash_type", "danger");
                    response.sendRedirect("Add_Admin.jsp");
                }
//ANY OTHER FAILURE OF ADDING DATA.
            }else{
                session.setAttribute("flash_type", "warning");                
                session.setAttribute("flash_message", "Failed to add data");                
                response.sendRedirect("Add_Admin.jsp");
            }
        }catch(Exception ex){
            out.println("exception="+ex);
             response.sendRedirect("Add_Admin.jsp");
            Logger.getLogger(AdminLogin.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            out.close();
        }
    }

}
