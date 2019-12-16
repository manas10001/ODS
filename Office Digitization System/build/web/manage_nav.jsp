<ul class="nav navbar-nav navbar-right">
    <%
        //Getting User Type Set In Sesssion
        String userType = (String) session.getAttribute("UserType");
        String cat=null; 
        if(session.getAttribute("catagory")!="" && session.getAttribute("catagory")!=null){
        cat = (String) session.getAttribute("catagory");}
        System.out.println("userType: " + userType);
      
        String hod1="something";
        if(session.getAttribute("hod")!="" && session.getAttribute("hod")!=null){
        hod1 = (String) session.getAttribute("hod");
        }
        
        if (userType == null) {
    %>
    <!--DEFAULT NAVBAR-->
    <li><a href="Devlogin.jsp" >Developer Login</a></li>
    <li><select onChange="window.location.href = this.value" style="font: bold" class="btn btn-default">
            <option value="#" selected> Select Login Type </option>
            <option value="loginpane.jsp"> Office[Admin] </option>
            <option value="deptlogin.jsp"> Office[Department] </option>
            <option value="ulogin.jsp"> User Login</option>                      
        </select>
    </li>
    <% } else {
        if (userType.equals("admin")) {%>
        <!--ADMIN NAVBAR-->
        <li><a href="Add_dept.jsp" style="color: #FCFCFC">Add Department</a></li>
        <!--li><a href="Man_dept.jsp" style="color: #FCFCFC">Manage Departments</a></li-->
        <li><a href="Add_inward.jsp" style="color: #FCFCFC">ADD Inward</a></li>
        <!--li><a href="Add_outwrd.jsp" style="color: #FCFCFC">ADD Outward</a></li-->
        <li><a href="Add_cat.jsp" style="color: #FCFCFC">Add Document Category</a></li>        
        <!--li><a href="#" style="color: #FCFCFC">Special Access</a></li-->
        <li><a href="ChangePass.jsp" style="color: #FCFCFC">Change Password</a></li>  
        <li><a href="viewTrash.jsp" style="color: #FCFCFC">Manage Trash</a></li>  
        <lable style="color: #FCFCFC;font-style: normal">Search</lable>
        <select name="srch" style="font: bold" onChange="window.location.href = this.value" class="btn btn-default">
        <option value="#">Select</option>
        <option value="bysub.jsp">By Subject</option>
        <option value="byinwardno.jsp">By Inward No</option>
        <option value="byfname.jsp">By File Name</option>
        <option value="viewAll.jsp">View All</option>
    </select> 
    <li><a href="logout.jsp" style="color: #FCFCFC">Logout [<%= session.getAttribute("UserType") %>]</a></li>
    <%
    }
    else if(userType.equals("allow")) {
    %>
    <!--NAVBAR OF USERS THAT ARE ALLOWED TO INPUT DATA-->
    <%
         if(session.getAttribute("catagory")!=null){
        String s=(String)session.getAttribute("catagory");
        if(cat.equals("on")){
        %>
        <li><a href="addUser.jsp" style="color: #FCFCFC">ADD User</a></li>
        <!--li><a href="manUser.jsp" style="color: #FCFCFC">MANAGE User</a></li-->
        <%
        }}
    %>
    <li><a href="Add_inward.jsp" style="color: #FCFCFC">ADD Inward</a></li>
    <!--li><a href="Add_outward.jsp" style="color: #FCFCFC">ADD Outward</a></li-->
     <li><a href="ChangePass.jsp" style="color: #FCFCFC">Change Password</a></li>
    <lable style="color: #FCFCFC;font-style: normal">Search</lable>
    <%
    if(hod1.equals("hod")){
    %>
        <li><a href="viewTrash.jsp" style="color: #FCFCFC">Manage Trash</a></li>
    <%    
    }
    %>
    <select name="srch" style="font: bold" onChange="window.location.href = this.value" class="btn btn-default">
        <option value="#">Select</option>
        <!--option value="by_da te.jsp">By Date</option-->
        <option value="bysub.jsp">By Subject</option>
        <option value="byinwardno.jsp">By Inward No</option>
        <!--option value="byletterno.jsp">By Document No</option-->
        <!--option value="byautho.jsp">By Department</option-->
        <option value="byfname.jsp">By File Name</option>
        <!--option value="byType.jsp">By Type</option-->
        <option value="viewAll.jsp">View All</option>
    </select>
   
    <li><a href="logout.jsp" style="color: #FCFCFC;font-style: normal">Logout [<%= session.getAttribute("UserType") %>]</a></li>
    
    <% 
        }
        else if(userType.equals("disallow")) { 
    %>
    <!--NAVBAR OF USERS THAT CAN ONLY SEARCH-->
    <%
        if(session.getAttribute("catagory")!=null){
        String s=(String)session.getAttribute("catagory");
        if(cat.equals("on")){
        %>
        <li><a href="addUser.jsp" style="color: #FCFCFC">ADD User</a></li>
        <!--li><a href="manUser.jsp" style="color: #FCFCFC">MANAGE User</a></li-->
        <%
        }}
    %>
    <li><a href="ChangePass.jsp" style="color: #FCFCFC">Change Password</a></li>
    <lable style="color: #FCFCFC;font-style: normal">Search</lable>
    <select name="srch" style="font: bold" onChange="window.location.href = this.value" class="btn btn-default">
        <option value="#">Select</option>
        <option value="bysub.jsp">By Subject</option>
        <option value="byinwardno.jsp">By Inward No</option>
        <option value="byfname.jsp">By File Name</option>
        <option value="viewAll.jsp">View All</option>
    </select>
    <li><a href="logout.jsp" style="color: #FCFCFC;font-style: normal">Logout [<%= session.getAttribute("UserType") %>]</a></li>
    
    <% 
      //  }
      //  else if(userType.equals("Clerk")) { 
    %>
    <!--Not using this option-->
    <!--NAVBAR OF USERS THAT ARE ALLOWED TO ENTER DATA-->
    <!--li><a href="Add_inword.jsp" style="color: #5F9EA0">ADD Inward</a></li-->
    <!--li><a href="Add_outward.jsp" style="color: #BFEFFF">ADD Outward</a></li-->
    <!--<li><a href="working_page.jsp">Search</a>-->
    <!--lable style="color: #FCFCFC;font-style: normal">Search</lable>
    <select name="srch" style="font: bold" onChange="window.location.href = this.value" class="btn btn-default">
        <option value="#">Select</option>
        <option value="by_date.jsp">By Date</option>
        <option value="bysub.jsp">By Subject</option>
        <option value="byinwardno.jsp">By Inward No</option>
        <option value="byletterno.jsp">By Document No</option>
        <option value="byautho.jsp">By Department</option>
        <option value="byfname.jsp">By File Name</option>
        <option value="byType.jsp">By Type</option>
        <option value="viewAll.jsp">View All</option>
    </select>
    
    <li><a href="logout.jsp"style="color: #FCFCFC">Logout [<%//= session.getAttribute("UserType") %>]</a></li-->
     
    <% 
        }
        else if(userType.equals("devlop")) { 
    %>
    <!--DEVELOPER NAVBAR-->
    <li><a href="Add_Admin.jsp" style="color: #FCFCFC">Add Office Admin</a></li>
    <li><a href="logout.jsp"style="color: #DADCFF">Logout [<%= session.getAttribute("UserType") %>]</a></li>
    <%
        }
        else{

    }}%>
</ul>