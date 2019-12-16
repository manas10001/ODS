<%@include file="sessioncheck.jsp"%>
<%@include file="links.jsp"%>
<%@include file="nav.jsp" %>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/structure.css">
        <title>Add Department  </title>
    </head>
    <body style="background-color: #B0E2FF">
        <div class="container"><br><br><br><br><br><br>
            <div><center>
<!--A FORM WHICH WILL REDIRECT ON THE SAME PAGE WITH THE NUMBER OF DEPARTMENTS TO BE ADDED.-->
                    <form class="box login" action="" method="get">         
                        <fieldset class="boxBody">
                            <label class=" label label-success">Add no of departments to be added:</label><br><br>
                            <input type="number" tabindex="1" placeholder="Enter No" class="btn btn-default" required name="no">
                        </fieldset>
                        <center>            
                            <input type="submit" class="btnLogin" value="Submit" tabindex="3"></center>
                            <%@include file="flash.jsp" %>            
                    </form><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

                </center>
            </div>
            <div class="panel panel-default">
                <form action="Add_dept" method="post" class="login">
                    <%      try {
//ACCEPTING THE VALUE OF TOTAL DEPARTMENTS TO BE ADDED AND STORING IT AS A SESSION VARIABLE TO BE USED.
                            String s = request.getParameter("no");
                            int h = Integer.parseInt(s);
                            if(h<=10){
//MORE THAN 10 DEPARTMENTS CANNOT BE ADDED AT A TIME.
                            session.setAttribute("no", h);
                            //session.setAttribute("UserType", "admin");
                            int i = 1;
//THIS WHILE LOOP WILL CREATE THE n NUMBER OF INPUT FIELD SETS FOR n DEPARTMENTS TO BE ADDED.
                            while (i <= h) {
                    %>    

                    <div class="panel-heading">
                        <h4 class="panel-title">
                            <center>
                                <a class="btn btn-default" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=i%>">
                                    Enter details of Department <%=i%>
                                </a>
                            </center>
                        </h4>
                    </div>
                    <div id="collapse<%=i%>" class= "panel-collapse collapse">
                        <div class="panel-body boxBody"><center>

                                <label >Department Name:</label>
                                <input type="text" id="deptname" name="dept<%=i%>" placeholder="Department Name" required class="btn btn-default"required="required"><br><br>
                                <label >Username:</label>&ensp;&ensp;&emsp;&emsp;
                                <input type="text" name="name<%=i%>" placeholder="User Name" required class="btn btn-default"required="required"><br><br>
                                <label >Password:</label>&ensp;&ensp;&emsp;&emsp;
                                <input type="password" name="pass<%=i%>" placeholder="Password" required class="btn btn-default"required="required"  maxlength="30" minlength="8"><br><br>
                                <input type="checkbox" name="cuser<%=i%>" checked ><label>&emsp;Allowed To Create User</label><br>
                                <label >Department admin is by default allowed to add data</label>
                            </center>
                        </div>
                    </div>
                                <script type="text/javascript" language="javascript">
                                /*function e()
                                {
                                   var x = document.getElementById("deptname");
                                       if(x.which===32){
                                           return false;
                                           
                                       }  
                                       alert("hello");
                                       
                                }
                                $(function(){
                                    $('#deptname').on('OnMouseOut',function(e){
                                       if(e.which==32){
                                         return false;
                                         alert("hello");
                                        } 
                                    });
                                });*/                         
                                </script>
                    <hr>
                    <%
//WHEN THE REQUIRED n NUMBER OF DEPARTMENTS INPUTS ARE DISPLAYED WE USE A COMMON BUTTON WHICH WILL SUBMIT ALL THE DATA TOGETHER.
                        if (i == h) {
                    %>
                    <center><input type="submit" value="Submit" class="btn btn-success"></center>
                        <%
                                    }
                                    i++;
                                }
                              }else{
                                   %><div class="alert alert-danger">You cannonot add more than 10 departments at a time.</div><%
                                   }
                            } catch (Exception e) {
                            }
                        %>

                </form>
            </div></div>
    </body>
</html>
