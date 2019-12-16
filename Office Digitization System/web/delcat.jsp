
<%@page import="db.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Category</title>
    </head>
    <body>
        <%
        //CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
            String id=request.getParameter("id");
            String sql="DELETE FROM `type` WHERE `id`="+id+"";
             st.executeUpdate(sql);
            response.sendRedirect("Add_cat.jsp");
        %>
    </body>
</html>
