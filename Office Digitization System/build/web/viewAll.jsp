<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.Dbconn"%>
<%@include file="sessioncheck.jsp"%>
<%@include file="links.jsp" %>
<%@include file="nav.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" type="text/css" href="css/structure.css">       
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>View All</title>
    </head>
    <body style="background-color: #B0E2FF">
        <%
        try{
//GETTING THE SESSION ATTRIBUTES IN VARIABLES
//USERTYPE
            String ut = (String) session.getAttribute("UserType");
            //System.out.println(ut);           
            String user=null;
            if(session.getAttribute("username")!="" && session.getAttribute("username")!=null){
            user = (String) session.getAttribute("username");
            //System.out.println(user);
            }
//CATEGORY          
            String uc=null;
            if(session.getAttribute("catagory")!="" && session.getAttribute("catagory")!=null){
            uc = (String) session.getAttribute("catagory");
            //System.out.println(uc);
            }
//IS HOD?          
            String hod="something";
            if(session.getAttribute("hod")!="" && session.getAttribute("hod")!=null){
            hod = (String) session.getAttribute("hod");
            //System.out.println(hod);
            }
//DEPARTMENT         
            String dept=null;
            if(session.getAttribute("dept")!="" && session.getAttribute("dept")!=null){
            dept = (String) session.getAttribute("dept");
            //System.out.println(dept);
            }
//CONNECTING DATABASE            
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            ResultSet rs = null;
            ResultSet ru=null;
            String sql=null;    
            
			/*String path = getServletContext().getRealPath("/" );
            //path=path.replace("build/web/","data/");
            path=path+"data/";
			System.out.println(path);
			*/
            if(ut.equals("admin")){
//ADMIN SEARCH
                sql="SELECT * FROM data";
                rs=st.executeQuery(sql);
            }
            else if(hod.equals("hod")){
//HOD SEARCH
                sql="SELECT * FROM data WHERE dept='"+dept+"'";
                rs=st.executeQuery(sql);
            }
            else if(ut.equals("allow") || ut.equals("disallow")){
//OTHER USERS SEARCH
                //System.out.println(uc);
                if(uc!=null && uc.equals("on")){
//IF USERCREATION IS ON THEN THE USER MAY HAVE SUBUSERS
                //System.out.println("this user have subusers");    
//AN ARRAYLIST TO STORE THE NAMES OF ALL USERS THAT ARE CREATED BY THIS USER
                ArrayList<String> users=new ArrayList<String>();
//RUNNING A QUERY AND GETTING THE NAMES OF SUBUSERS IN A RESULTSET
                String query="Select username from "+dept+"_users WHERE createdby='"+user+"' ";
                //System.out.println(query);
                ru=st2.executeQuery(query);
//GETTING THE RESULTSET ELEMENTS IN AN ARRAYLIST
                while(ru.next()){
                //System.out.println(i);
                users.add(ru.getString("username"));
                }
                Iterator it=users.iterator();
                String dynamicquery="";  
                while(it.hasNext()){
                dynamicquery=dynamicquery+" OR uploder='"+it.next()+"'";                    
                }
                System.out.println(dynamicquery);
                sql="SELECT * FROM data WHERE dept='"+dept+"' AND uploder='"+user+"'";
                sql=sql.concat(dynamicquery);
                //System.out.println("Final query : "+sql);
                rs=st1.executeQuery(sql); 
                }else{
//IF UCREATION IS OFF THAT IS THE USER IN A LEAF USER                    
                //System.out.println("this user dosent have subusers");
                sql="SELECT * FROM data WHERE uploder='"+user+"' AND dept='"+dept+"' ";
                rs=st1.executeQuery(sql); 
                }
                //sql="SELECT * FROM data WHERE uploder='"+user+"' AND dept='"+dept+"' ";
                //rs=st1.executeQuery(sql);                
            }
            else{
                
                System.out.println("last else block");
            }
           
            %><br><br>
                <div class="container" style="margin-top: 30px">
            <div>
                <!--form name="abc" action="download.jsp">
				<%
		//		if(ut.equals("admin")){%>
				<form>
				<a class="btn btn-danger" align="left" href="viewAll.jsp">Clear Trash</a>
				</form-->
				<%
		//		}
				%>
                <table class="table table-hover table-striped">
<!--DISPLAYING DATA-->
                    <thead>
                        <tr style="background: #33be40">
                            <th>Inward No.</th>
                            <th>Upload Date</th>
                            <th>Document No.</th>
                            <th>Document Date.</th>
                            <th>Subject</th>    
                            <th>Category</th>
                            <th>File Name</th>
                            <th>Uploder</th>
                            <th>Preview</th>
                            <th>Download</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody >
                        <%while (rs.next()) {%>
                        <tr style="color: orangered">
                            <td> 
                                <%= rs.getString(2)%>
                            </td>
                            <td> 
                                <%= rs.getString(3)%>
                            </td>
                            <td> 
                                <%= rs.getString(4)%>
                            </td>
                            <td> 
                                <%= rs.getString(5)%>
                            </td>
                            <td> 
                                <%= rs.getString(6)%>
                            </td>
                            <td> 
                                <%= rs.getString(7)%>
                            </td>
                            <td> 
                                <%= rs.getString(11)%>
                            </td>
                            <td> 
                                <%= rs.getString(8)%>
                            </td>
                             <%
                            String a=rs.getString(2);
                            a=a.replace("/", "_");
                            %>
                            <td> 
                                <a class="btn btn-primary" href= "<%= "data/"+a+rs.getString(11)%>">Preview</a>
                            </td>
                            <!--input type="text" name="filename" value="<%//= rs.getString(11)%>" style="visibility: hidden"-->
                            <td>
                                <a class="btn btn-success" href= "download.jsp?filename=<%= a+rs.getString(11)%>" >Download</a>
                            </td>
                            <td> 
                                <a class="btn btn-danger" href= "totrash.jsp?id=<%= rs.getString(2)%>&name=<%= rs.getString(11)%>" >Delete</a>
                            </td>
                           
                        </tr>
                    
                        <% }
            } catch (Exception e) {
                e.printStackTrace();
                //out.println(e);
            }%>
                    </tbody>
                </table>
                    </form>
            </div>
                    
        </div>
    </body>
</html>
