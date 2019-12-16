<%@include file="nav.jsp" %>
<%@include file="links.jsp" %>
<html>
    <head>
        <title>Login Form</title>
        <link rel="stylesheet" type="text/css" href="css/structure.css">
    </head>


    <body style="background-color: #B0E2FF">
<br><br><br>   <center><h3>Department Admin Login</h3></center>
           <form class="box login" action="DeptLogin" method="post">
             <fieldset class="boxBody">             
                <span class=" label label-info">Username</span>
                <input type="text" tabindex="1" placeholder="Enter Username" required name="username">
                <span class=" label label-info">Password</span>
                <input type="password" tabindex="2" placeholder="Enter Password" required name="password">
                <!--input type="text" name="utype" value="dept" style="visibility:hidden;"-->
            </fieldset>
            <center>            
                <input type="submit" class="btnLogin" value="Login" tabindex="3"></center><br>
            <%@include file="flash.jsp" %>
            
        </form>
    </body>
</html>