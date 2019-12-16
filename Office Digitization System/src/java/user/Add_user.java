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

public class Add_user extends HttpServlet {


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
        String dept=(String) session.getAttribute("dept");
        dept=dept.replace(" ","_");
        String unme=(String) session.getAttribute("username");
        //int n=Integer.parseInt(s);
        int i=1;
//GETTNIG MULTIPLE PARAMETERS USING WHILE LOOP
        while(i<=n){
        String name=request.getParameter("name"+i+"");
        String pass=request.getParameter("pass"+i+"");
        String email=request.getParameter("email"+i+"");
        String phone=request.getParameter("phone"+i+"");
        String cb=request.getParameter("adddoc"+i+"");
        String ucreation=request.getParameter("ucreation"+i+"");
        if(cb==null){
        cb="disallow";
        }else{
        cb="allow";
        }
        if(ucreation==null){
        ucreation="off";
        }
        //out.println(cb);
        //out.println(name);
        //out.println(pass);
        Dbconn db=new Dbconn();
        Connection con =db.connect(); 
        Statement st=con.createStatement();
        String sql="INSERT INTO "+dept+"_users (username,password,email,phoneno,type,createdby,ucreation) VALUES ('"+name+"','"+pass+"','"+email+"','"+phone+"','"+cb+"','"+unme+"','"+ucreation+"')";
        st.executeUpdate(sql);
        i++;
        } 
        response.sendRedirect("addUser.jsp");
        }catch(Exception ex){
        out.println(ex);
        }
        
    }

@Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
