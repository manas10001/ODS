<%@include file="sessioncheck.jsp"%>
<%@include file="links.jsp" %>
<%@include file="nav.jsp" %>

<head>
<link rel="stylesheet" type="text/css" href="css/structure.css">       
        <link href="css/bootstrap.css" rel="stylesheet">
        <title>Search:By Inward no.</title>
</head>
<body style="background-color: #B0E2FF">
        <div class="row background space20" style="background-color: #FAEBD7; background-size: cover">
            
            <form class="form-signin" action="view_inward.jsp" method="post">
                <!--<h2 class="form-signin-heading">Add User's Details </h2>-->
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <div></div><span class="label label-info">Inward No.</span>
                <input type="textarea" placeholder="Enter Inward No."  name="inwardno" /><br>
               ,
                <!--<br>-->
                
                <!--byinward-->
                <br>
                
                <center>
                     <input type="text"   name="data" value="byinward" style="visibility: hidden" />
                    
                <button align="middle" class="btn btn-large btn-primary" type="submit" align="center" >View</button></center>
           </div>
            </form>
   
            
        </div>
    </body>
</html>
