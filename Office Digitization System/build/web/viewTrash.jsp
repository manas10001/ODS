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
        <title>View Trash</title>
    </head>
    <body style="background-color: #B0E2FF">
        <%
        try{
            String ut = (String) session.getAttribute("UserType");
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
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
            ResultSet rs = null;
            String sql=null;
            if(ut.equals("admin")){
//IF USER IS ADMIN HE CAN VIEW ALL TRASH
                    sql="SELECT * FROM trash";
                    rs=st.executeQuery(sql);
                    
            }else if(hod.equals("hod")){
//IF USER IS HOD HE WILL VIEW TRASH OF HIS DEPARTMENT
                    sql="SELECT * FROM data WHERE dept='"+dept+"' ";
                    rs=st.executeQuery(sql);
            }else{
                    %><script type="text/javascript">alert("YOU ARE NOT ALLOWED TO ACCESS TRASH!");</script><%
                response.sendRedirect("index.jsp");
            }
            %><br><br>
                <div class="container" style="margin-top: 30px">
            <div>
                <form>
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
                            <th>Restore</th>
                            <th>Delete Forever</th>
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
                            
                            <!--input type="text" name="filename" value="<%//= rs.getString(11)%>" style="visibility: hidden"-->
                            <td> 
                                <a class="btn btn-success" href= "restore.jsp?filename=<%= rs.getString(2)+rs.getString(11)%>" >Restore</a>
                            </td>
                            <td> 
                                <a class="btn btn-danger" href= "delete.jsp?id=<%= rs.getString(2)%>&name=<%= rs.getString(11)%>" >Delete Forever</a>
                            </td>
                           
                        </tr>
                    
                        <% }
            } catch (Exception e) {
                e.printStackTrace();
            }%>
                    </tbody>
                </table>
                </form>  
            </div>
        </div>
    </body>
</html>
