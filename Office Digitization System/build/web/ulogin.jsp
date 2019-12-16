<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="db.Dbconn"%>
<%@include file="links.jsp" %>
<%@include file="nav.jsp" %>
<html>
    <head>
        <title>Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/structure.css">
    </head>


    <body style="background-color: #B0E2FF">
<br><br><br>
      <center><h3>User Login</h3></center>
        <form class="box login" action="Ulogin" method="post">
           
            <fieldset class="boxBody">
                <label style="color: #FCFCFC;font-style: normal">Select Department</label>
                <center>
                <select name="dept" class="btn btn-default">
                <option class="btn btn-default">Select Your Department.</option>
<%
//CONNECTING DATABASE
            Dbconn db=new Dbconn();
            Connection con =Dbconn.connect();
              //out.println(con);
            Statement statement = con.createStatement();
//VERIFYING USER-NAME AND PASSWORD
            ResultSet rs = statement.executeQuery("SELECT department FROM dept_users ;");
            while(rs.next()){
                int i=1;
%>
                    <option value="<%=rs.getString("department")%>" required><%=rs.getString("department")%></option>
<%
    i++;
}
%>
                </select>
                </center><br>
                <span class=" label label-info">Username</span>
                <input type="text" tabindex="1" placeholder="Enter Username" required name="username">
                <span class=" label label-info">Password</span>
                <input type="password" tabindex="2" placeholder="Enter Password" required name="password"  maxlength="30" minlength="8">
                <!--input type="text" name="utype" value="user" style="visibility:hidden;"-->
            </fieldset>
            <center>            
                <input type="submit" class="btnLogin" value="Login" tabindex="3"></center>
            
        </form>
    </body>
</html>