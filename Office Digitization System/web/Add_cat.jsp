<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="db.Dbconn"%>
<%@include file="links.jsp" %>
<%@include file="nav.jsp" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/structure.css">       
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Add Category </title>
</head>
 <body style="background-color: #B0E2FF"><br><br>
 
<div class="row background space20" style="background-color: #49afcd; background-size: cover">
            
    <form class="form-signin" action="addcat" method="post">
                <h2 class="form-signin-heading">Add Category Details </h2>
                <span class="label label-info">Category Name.</span><br>    
                <input type="text" class="input-evel validate[required]" placeholder="Category Name."  name="catname" required="required"/>
                
               
                <!--<input type="text" class="input-block-level validate[required]" placeholder="Address" name="address"/>-->
               
                <button align="middle" class="btn btn-large btn-primary" type="submit" align="center" >Submit</button>
            </form>
           <%@include file="flash.jsp" %>
        </div>
  <center>
                
             <table class="table table-hover table-striped" style="width: 400px;overflow: scroll;color: #0077b3;background-color: #F2F3FF">
                    <thead >
                        <tr >
                            <th>ID</th>
                            <th>Category</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                       <%
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
                ResultSet rs = null;
//DISPLAYING PRE EXISTING DOCUMENT CATEGORIES OF FILES
                String sql = "select * from type";
                System.out.println();
                rs = st.executeQuery(sql);
                while(rs.next())
                {
                       %>
                        <tr>
                            <td> 
                                <%=rs.getString(1)%>
                            </td>
                            <td> 
                             <%=rs.getString(2)%>
                            </td>
                            <td> 
                                <a class="btn btn-danger" href="delcat.jsp?id=<%=rs.getString(1)%>" >DELETE</a>
                            </td>
                           <%}%>
                          
                        </tr>
                      
          
                    </tbody>
                </table>
 
   </center>
 
</body>
</html>