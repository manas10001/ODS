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
            String sql="INSERT INTO trash SELECT * FROM data WHERE in_no="+inid+"";
            System.out.println("totrash query :   "+sql);
            st.executeUpdate(sql);
			}
			catch(Exception e){
				System.out.println("Ex on totrash.jsp "+e.toString());
			}
			try{
			st.executeUpdate("DELETE FROM data WHERE in_no='"+inid+"'");
			String path = getServletContext().getRealPath("/" );
                        //System.out.println(path);
                        inid=inid.replace("/","_");
                        
			String trash=path+"trash\\"+inid+fname;
                        path=path+"data\\"+inid+fname;
			Path temp = Files.move(Paths.get(path), Paths.get(trash));
                        }
			catch(Exception e){
				System.out.println("Ex2  : " + e.toString());
			}
            response.sendRedirect("viewAll.jsp");
%>