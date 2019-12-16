<%@page import="db.Dbconn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
     String fname=request.getParameter("name");
     String inid=request.getParameter("id");
     
     //CONNECTING DATABASE            
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
            
            try{
    // REMOVING FILE ENTRY FROM DATABASE
            st.executeUpdate("DELETE FROM trash WHERE in_no='"+inid+"'");
    // REMOVING FILE FROM THE SERVER
            String path = getServletContext().getRealPath("/" );
            inid=inid.replace("/","_");
            path=path+"trash\\"+inid+fname;
            File f = new File(path);
            f.delete();
            }catch(Exception e){
            System.out.println("Exception occured while deleting file forever: "+e);
            }
            response.sendRedirect("viewTrash.jsp");
%>
