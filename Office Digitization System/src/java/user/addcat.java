package user;

import db.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class addcat extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        try {
             String cat = request.getParameter("catname");
             String sql = "select * from type where type = '" + cat + "'";
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
             if (!rs.next()) {
                sql = "insert into type values (null,'"+cat+"')";
                int count = st.executeUpdate(sql);
                if (count > 0) {
                    session.setAttribute("flash_message", "'"+cat+"' Category added successfully");
                    session.setAttribute("flash_type", "success");
                    response.sendRedirect("Add_cat.jsp");
                } else {
                    session.setAttribute("flash_message", "Failed to add data");
                    session.setAttribute("flash_type", "fail");
                    response.sendRedirect("Add_cat.jsp");
                }
               } else {
                session.setAttribute("flash_message", "Alredy Exist");
                session.setAttribute("flash_type", "fail");
                response.sendRedirect("Add_cat.jsp");
            }
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }


}
