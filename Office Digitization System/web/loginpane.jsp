<%@include file="nav.jsp" %>
<%@include file="links.jsp" %>
<html>
    <head>
        <title>Login Form</title>
         <link rel="stylesheet" type="text/css" href="css/structure.css">
         
    </head>


    <body style="background-color: #B0E2FF">
<br><br><br>
      <center><h3>Admin Login</h3></center>
        <form class="box login" action="AdminLogin" method="post">
           
            <fieldset class="boxBody">
                <span class=" label label-info">Username</span>
                <input type="text" tabindex="1" placeholder="Enter Username" required name="username">
                <span class=" label label-info">Password</span>
                <input type="password" tabindex="2" placeholder="Enter Password" required name="password"  maxlength="30" minlength="8">
                <!--input type="text" name="utype" value="admin" style="visibility:hidden;"-->
            </fieldset>
            <center>            
                <input type="submit" class="btnLogin" value="Login" tabindex="3"></center>
            <%@include file="flash.jsp" %>
            
        </form>
    </body>
</html>