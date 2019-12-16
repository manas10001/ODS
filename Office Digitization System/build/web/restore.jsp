<%@page import="db.Dbconn"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.io.*"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.*"%>
<%
                String fname=request.getParameter("name");
                String inid=request.getParameter("id");
	
//CONNECTING DATABASE            
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
            //out.println(con);
            Statement st = con.createStatement();
			try{
            st.executeUpdate("INSERT INTO data SELECT * FROM trash WHERE in_no='"+inid+"'");            //remove the extra column
			}
			catch(Exception e){
				System.out.println(e.toString());
			}
			try{
			st.executeUpdate("DELETE FROM trash WHERE in_no='"+inid+"'");
			String path = getServletContext().getRealPath("/" );
                        //System.out.println(path);
                        inid=inid.replace("/","_");
                        
			String trash=path+"trash\\"+inid+fname;
                        path=path+"data\\"+inid+fname;
			Path temp = Files.move(Paths.get(trash), Paths.get(path));
                        }
			catch(Exception e){
				System.out.println("Ex : " + e.toString());
			}
            response.sendRedirect("viewTrash.jsp");
%>