<%@include file="sessioncheck.jsp"%>
<%@include file="nav.jsp" %>
<%@include file="links.jsp"%>
<%@include file="flash.jsp" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/structure.css">    
        <title>Add Admin</title>
    </head>
    <body style="background-color: #B0E2FF">
 
<div class="row background space20"><br><br>
     <center><h3>Add Admin User</h3></center>
        <form class="box login" action="Add_Admin" method="post">
           
            <fieldset class="boxBody">
                <span class="label label-info">Officename</span>
                <input type="text" tabindex="1" placeholder="Enter Officename" required name="ofname">
                <span class="label label-info">Username</span>
                <input type="text" tabindex="1" placeholder="Enter Username" required name="username">
                <span class="label label-info">Password</span>
                <input type="password" tabindex="2" placeholder="Enter Password" required name="password">
            </fieldset>
            <center>            
                <input type="submit" class="btnLogin" value="Add Admin" tabindex="3"></center>
          
            
        </form>
           
        </div>
 
    </body>
</html>
