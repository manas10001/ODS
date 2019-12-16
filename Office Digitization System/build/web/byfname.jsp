<%@include file="sessioncheck.jsp"%>
<%@include file="links.jsp" %>
<%@include file="nav.jsp" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/structure.css">       
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Search:By Name</title>
</head>
<body style="background-color: #B0E2FF">
<br>
<div class="row background space20" style="background-color: #76EEC6; background-size: cover">
            
            <form class="form-signin" action="view_inward.jsp" method="post">
                <!--<h2 class="form-signin-heading">Add User's Details </h2>-->
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <div></div>
               <span class="label label-info">File name</span>&nbsp;&nbsp;
                <input type="text" placeholder="Enter Filename"  name="fname"/>
               
                <br><br>
                <input type="text" name="data" value="byfname" style="visibility: hidden" />
                
                          
                <center>
                    
                <button align="middle" class="btn btn-large btn-primary" type="submit" align="center" >View</button></center>
           </form>
   
            
        </div>
</body>
</html>

