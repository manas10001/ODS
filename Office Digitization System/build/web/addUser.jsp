<%@include file="sessioncheck.jsp"%>
<%@include file="nav.jsp" %>
<%@include file="links.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add User</title>
        <link rel="stylesheet" type="text/css" href="css/structure.css">
    </head>
    <body style="background-color: #B0E2FF">
        <div class="container"><br><br><br><br><br><br>
            <div><center>
                    <form class="box login" action="" method="post">         
                        <fieldset class="boxBody">
                            <label class=" label label-success">Enter no of users to be added:</label><br><br>
                            <input type="number" tabindex="1" placeholder="Enter No" class="btn btn-default" required name="no">
                        </fieldset>
                        <center>            
                            <input type="submit" class="btnLogin" value="Submit" tabindex="3"></center>
                            <%@include file="flash.jsp" %>            
                    </form><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                </center>
            </div>
            <div class="panel panel-default">
                <form action="Add_user" method="post" class="login">
                    <%      try {
                            String s = request.getParameter("no");
                            int h = Integer.parseInt(s);
                            if(h<=10){
                            session.setAttribute("no", h);
                            //session.setAttribute("UserType", "allow");
                            int i = 1;

                            while (i <= h) {
                    %>    

                    <div class="panel-heading">
                        <h4 class="panel-title">   <center>                        
                                <a class="btn btn-default" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i%>">
                                    Enter details of user<%=i%>
                                </a></center>
                        </h4>
                    </div>
                    <div id="collapse<%=i%>" class="panel-collapse collapse">
                        <div class="panel-body boxBody"><center>

                                <lable>Username:</lable>&emsp;&emsp;&emsp;
                                <input type="text" name="name<%=i%>" placeholder="User Name" required class="btn btn-default" ><br><br>
                                <lable>Password:</lable>&nbsp;&emsp;&emsp;&emsp;
                                <input type="password" name="pass<%=i%>" placeholder="Password" required class="btn btn-default"  maxlength="30" minlength="8" ><br><br>
                                <lable>E-mail:</lable>&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;
                                <input type="text" name="email<%=i%>" placeholder="E-mail ID" required class="btn btn-default"><br><br>
                                <lable>Phone Number:</lable>&emsp;
                                <input type="number" name="phone<%=i%>" placeholder="Phone Number" required class="btn btn-default"  maxlength="10" minlength="10"><br><br>
                                <input type="checkbox" name="adddoc<%=i%>" checked ><lable>&emsp;Allowed To Add Documents.</lable><br><br>
                                <input type="checkbox" name="ucreation<%=i%>"><lable>&emsp;Allowed To Create Sub Users.</lable>
                            </center>
                        </div>
                    </div>
                    <hr>
                    <%
                        if (i == h) {
                    %>
                    <center><input type="submit" value="Submit" class="btn btn-success"></center>
                        <%
                                    }
                                    i++;
                                }
                                }else{
                                        %><div class="alert alert-danger">You cannonot add more than 10 users at a time.</div><%
                                     }
                            } catch (Exception e) {
                            }
                        %>

                </form>
            </div></div>
    </body>
</html>
