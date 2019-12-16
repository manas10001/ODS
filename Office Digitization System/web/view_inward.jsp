<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
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
        <title>View Inward</title>
    </head>
    <body style="background-color: #B0E2FF">
        <%
//CONNECTING DATABASE
        try{
            String ut = (String) session.getAttribute("UserType");
 //USERNAME          
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
            String hod="abc";
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
//TYPE OF SEARCH            
            String input=request.getParameter("data");
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
            Statement st2 = con.createStatement();
            ResultSet rs = null;
            ResultSet ru = null;
            String sql=null;
//FILE PATH            
            String path = getServletContext().getRealPath("/" );
            //path=path.replace("build/web/","data/");
            path=path+"data/";
			//System.out.println(path);
            
            if(ut.equals("admin")){
//ADMIN SEARCH
                if(input.equals("bysubject")){
                    String fromdt=request.getParameter("subject");
                    sql="SELECT * FROM data WHERE sub='"+fromdt+"'";
                    System.out.println(fromdt);
                    rs=st.executeQuery(sql);
                }
                 if(input.equals("byfname")){
                    String fromdt=request.getParameter("fname");
                    sql="SELECT * FROM data WHERE fname like '%"+fromdt+"%' ";
                    rs=st.executeQuery(sql);
                 }
                 if(input.equals("byinward")){
                    String fromdt=request.getParameter("inwardno");
                    sql="SELECT * FROM data WHERE in_no='"+fromdt+"' ";
                    rs=st.executeQuery(sql);
                 }
            }else if(hod=="hod"){
//HOD SEARCH 
                if(input.equals("bysubject")){
                    String fromdt=request.getParameter("subject");
                    sql="SELECT * FROM data WHERE sub='"+fromdt+"' AND dept='"+dept+"' ";
                    //System.out.println(fromdt);
                    rs=st.executeQuery(sql);
                }
                 if(input.equals("byfname")){
                    String fromdt=request.getParameter("fname");
                    sql="SELECT * FROM data WHERE fname like '%"+fromdt+"%' AND dept='"+dept+"' ";
                    rs=st.executeQuery(sql);
                 }
                 if(input.equals("byinward")){
                    String fromdt=request.getParameter("inwardno");
                    sql="SELECT * FROM data WHERE in_no='"+fromdt+"' AND dept='"+dept+"' ";
                    rs=st.executeQuery(sql);
                 }
            }
            else if(ut.equals("allow") || ut.equals("disallow") ){
//OTHER USERS   

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
                String dynamicquery="'"+user+"'";  
                while(it.hasNext()){
                //dynamicquery=dynamicquery+" OR uploder='"+it.next()+"'";   
                dynamicquery=dynamicquery+" , '"+it.next()+"'";
                }
                System.out.println(dynamicquery);
                if(input.equals("bysubject")){
                    String fromdt=request.getParameter("subject");
                    System.out.println(fromdt);
                    sql="SELECT * FROM data WHERE dept='"+dept+"' AND sub='"+fromdt+"' AND uploder IN ("+dynamicquery+")";
                    //sql=sql.concat(dynamicquery);
                    //System.out.println(sql);
                    rs=st.executeQuery(sql);
                }
                 if(input.equals("byfname")){
                    String fromdt=request.getParameter("fname");
                    sql="SELECT * FROM data WHERE fname like '%"+fromdt+"%' AND dept='"+dept+"' AND uploder IN ("+dynamicquery+")";
                    //sql=sql.concat(dynamicquery);
                    rs=st.executeQuery(sql);
                 }
                 if(input.equals("byinward")){
                    String fromdt=request.getParameter("inwardno");
                    sql="SELECT * FROM data WHERE in_no='"+fromdt+"' AND dept='"+dept+"' AND uploder IN ("+dynamicquery+")";
                    //sql=sql.concat(dynamicquery);
                    rs=st.executeQuery(sql);
                 }
                }else{
//IF UCREATION IS OFF THAT MEANS THAT USER IS LEAF USER
                if(input.equals("bysubject")){
                    String fromdt=request.getParameter("subject");
                    sql="SELECT * FROM data WHERE sub='"+fromdt+"' AND dept='"+dept+"' AND uploder='"+user+"'";
                    //System.out.println(fromdt);
                    rs=st.executeQuery(sql);
                }
                 if(input.equals("byfname")){
                    String fromdt=request.getParameter("fname");
                    sql="SELECT * FROM data WHERE fname like '%"+fromdt+"%' AND dept='"+dept+"' AND uploder='"+user+"'";
                    rs=st.executeQuery(sql);
                 }
                 if(input.equals("byinward")){
                    String fromdt=request.getParameter("inwardno");
                    sql="SELECT * FROM data WHERE in_no='"+fromdt+"' AND dept='"+dept+"' AND uploder='"+user+"'";
                    rs=st.executeQuery(sql);
                 }
                }
                 
            }else{}
            %><br><br>
                <div class="container" style="margin-top: 30px">
            <div>
                <form name="abc" action="download.jsp">
                <table class="table table-hover table-striped">
                    <thead>
                        <tr style="background: #33be40">
                            <th>Inward No.</th>
                            <th>Upload Date</th>
                            <th>Document No.</th>
                            <th>Document Date.</th>
                            <th>Subject</th>    
                            <th>Category</th>
                            <th>Uploder</th>
                            <th>File Name</th>
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
                                <%= rs.getString(8)%>
                            </td>
                            <td> 
                                <%= rs.getString(11)%>
                            </td>
                             <%
                            String a=rs.getString(2);
                            a=a.replace("/", "_");
                            %>
                            <td>
                                <a class="btn btn-primary" href= "<%="data/"+a+rs.getString(11)%>" >Preview</a>
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
            }%>
                    </tbody>
                </table>
                    
            </div>
                    </form>
        </div>
    </body>
</html>
