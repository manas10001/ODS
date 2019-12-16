<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="db.Dbconn"%>
<%@include file="sessioncheck.jsp"%>
<%@include file="links.jsp" %>
<%@include file="nav.jsp" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/structure.css">
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Add Inward</title>
    </head>
    <body style="background-color: #B0E2FF">
 <%
            
            try {
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement st = con.createStatement();
        %>
		<%@include file="flash.jsp" %>
<div class="row background space20" style="background-color: #49afcd; background-size: cover">
            
    <form class="form-signin" action="Add_inword" method="post" enctype="multipart/form-data">
                <h2 class="form-signin-heading">Add inward Details </h2>
                <span class="label label-info">Inward No.</span>
               
                    <%
                    String defval=(String) session.getAttribute("inwdid");
                    %>
                </br>
                <span class="label label-info"><%=defval%>
                <input type="number" placeholder="Enter Inward No." name="in_wordno" required="required"><br>
                </span><br>
                <br><span class="label label-info">Current Date</span>
                <input type="text" value="<%= new java.util.Date() %>" placeholder="<%= new java.util.Date() %>" name="curntdate" readonly/>
                <span class="label label-info">Document No</span>
                <input type="number" placeholder="Document No." name="letterno" required="required"/>
                <span class="label label-info">Document Date</span>
                 <input type="date" name="datepicker" id="datepicker">
                <!--<input type="text" class="input-block-level validate[required]" placeholder="Address" name="address"/>-->
                <span class="label label-info">Subject</span>
                <input type="textarea" style="height:100px" placeholder="Enter Subject Here" name="sub" required="required"/>
                <br>
                <span class="label label-info">Type</span>
                <select name="type">
                <option value="">Select type</option>
                   <%
                     String sql2 =  "SELECT type FROM `type`";
                ResultSet  rs = st.executeQuery(sql2);
                System.out.println("sql---"+sql2);
                    while(rs.next()){
                    %>
                    <option value="<%= rs.getString("type")%>"><%= rs.getString("type")%></option>
                     <% }
           %>
                </select>  
            <%}
                catch (Exception e) {
                e.printStackTrace();
            }%>
                <br>
                <span class="label label-info">Select File</span>
                <input type="file" class="input-block-level validate[required, custom[phone]]" name="file" required="required"/>
                <input type="text" name="stat"  value="Inword" style="visibility: hidden"required="required"/>
                <button align="middle" class="btn btn-large btn-primary" type="submit" align="center" >Submit</button>
            </form>
           
        </div>
    </body>
</html>