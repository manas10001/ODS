package user;

import db.Dbconn;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Add_dept extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        HttpSession session = request.getSession(true);
        PrintWriter out = response.getWriter();
        try{
        Integer n=(Integer) session.getAttribute("no");
        //int n=Integer.parseInt(s);
        int i=1;
//GETTNIG MULTIPLE PARAMETERS USING WHILE LOOP
        while(i<=n){
        String dname=request.getParameter("dept"+i+"");
        dname=dname.replace(" ", "_");
        String name=request.getParameter("name"+i+"");
        String pass=request.getParameter("pass"+i+"");
        String cb=request.getParameter("cuser"+i+"");
        if(cb==null){
        cb="off";
        }
        //out.println(cb);
        //out.println(name);
        //out.println(pass);
        Dbconn db=new Dbconn();
        Connection con =db.connect(); 
        Statement st=con.createStatement();
        String sql="INSERT INTO dept_users (username,password,department,type) VALUES ('"+name+"','"+pass+"','"+dname+"','"+cb+"')";
        String sql2="CREATE TABLE `hirarchy`.`"+dname+"_users` ( `id` INT NOT NULL AUTO_INCREMENT , `username` VARCHAR(30) NOT NULL , `password` VARCHAR(30) NOT NULL , `email` VARCHAR(50) NOT NULL , `phoneno` VARCHAR(12) NOT NULL , `type` VARCHAR(10) NOT NULL , `createdby` VARCHAR(30) NOT NULL , `ucreation` VARCHAR(5) NOT NULL , `created_timestamp` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , PRIMARY KEY (`id`)) ENGINE = InnoDB;";
        st.executeUpdate(sql);
        st.executeUpdate(sql2);
        i++;
        } 
        response.sendRedirect("Add_dept.jsp");
        }catch(Exception ex){
        out.println(ex);
        }
        
    }

@Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
