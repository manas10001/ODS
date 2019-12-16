<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="db.Dbconn"%>
<%@include file="sessioncheck.jsp"%>
<%@include file="nav.jsp" %>
<%@include file="links.jsp"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" type="text/css" href="css/structure.css">
         <title>Change Password</title>
    </head>
    <body style="background-color: #B0E2FF">
        <br><br><br><br><br><br><br><br>
    <center><h3>Change Password</h3>
     <div class="row background space20"><br><br>  
        <form class="box login" action="" method="post">
            <fieldset class="boxBody">
                <span class=" label label-info">Previous Password</span>
                <input type="password" tabindex="1" placeholder="Enter Old Password" name="oldpass">
                <span class=" label label-info">New Password</span>
                <input type="password" tabindex="2" placeholder="Enter New Password" name="newpass">
                <span class=" label label-info">New Password</span>
                <input type="password" tabindex="2" placeholder="Enter New Password Again" name="confirmpass">
            </fieldset>
            <center>            
                <input type="submit" class="btnLogin" value="Change Password" tabindex="3"></center>
                <%@include file="flash.jsp" %>
        </form>
     </div>
    </center>
              
    <%
    try {
//CONNECTING DATABASE
                    Dbconn db=new Dbconn();
                    Connection con =Dbconn.connect();
                    //out.println(con);
                    Statement st = con.createStatement();
                    String UT=(String) session.getAttribute("UserType");
                    System.out.println("user type="+UT);
                    if(UT.equals("allow") || UT.equals("disallow") || UT.equals(null)){
                        UT=(String) session.getAttribute("dept");
                        UT=UT.replace(" ","_");
                        System.out.println("a"+UT);
                    }
                    if(session.getAttribute("hod")!=null){
                        if(session.getAttribute("hod")!=""){
                            System.out.println(session.getAttribute("hod"));
                            UT="dept";
                        }
                    }
                    String UN=(String) session.getAttribute("username");
                    String oldpass =request.getParameter("oldpass");
                    
                    System.out.println("oldpass "+oldpass);
                    ResultSet RS = st.executeQuery("SELECT * FROM "+UT+"_users where username='" +UN+ "' AND password='" +oldpass+ "';");
                    
                    System.out.println("final ut "+UT);
                    if(RS.next()){
                    System.out.println("password correct");
                    String newpass =(String) request.getParameter("newpass");
                    System.out.println("newpass="+newpass);
                    String confirmpass =(String) request.getParameter("confirmpass");
                    if(newpass.equals(confirmpass)){
                    String sql1 = "UPDATE "+UT+"_users set password ='"+newpass+"' WHERE username ='"+UN+"';";
                    //Statement st = con.createStatement();
                    int rs=st.executeUpdate(sql1);
                    if(rs!=0){
                    System.out.println("password changed");
                    session.setAttribute("flash_message", "Password Changed");
                    session.setAttribute("flash_type", "success");
                    %><br><br><br><br><br><br><br><br>
                    <div class="container"><br><br>
                        <div class="alert alert-success">
                               <button class="close" data-dismiss="alert"></button>
                                <strong>Password changed!</strong> 
                        </div>
                    </div>
                    <%
                    //response.sendRedirect("ChangePass.jsp");
                //System.out.println("sql"+sql1);
                    } 
                    }
                    else{
                session.setAttribute("flash_message", "Passwords Don't Match");
                session.setAttribute("flash_type", "warning");
                //response.sendRedirect("ChangePass.jsp");
                    %><br><br><br><br><br><br><br><br>
                    <div class="container"><br><br>
                        <div class="alert alert-warning">
                               <button class="close" data-dismiss="alert"></button>
                                <strong>Old and new passwords dont match!</strong> 
                        </div>
                    </div>
                    <%
                    }
                     }else{
                        //flash for wrong password
                 session.setAttribute("flash_message", "Wrong Password");
                 session.setAttribute("flash_type", "warning");
                 //response.sendRedirect("ChangePass.jsp");
                    %><br><br><br><br><br><br><br><br>
                    <div class="container"><br><br>
                        <div class="alert alert-danger">
                               <button class="close" data-dismiss="alert"></button>
                                <strong>Old password is incorrect!</strong> 
                        </div>
                    </div>
                    <%
                    }
                    }
                catch (Exception e) {
                //e.printStackTrace();
                System.out.println("ex occured:      "+e);
            }
                    finally{
               out.close();
            }
    %>
   
</body>
</html>