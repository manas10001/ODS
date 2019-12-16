<!--NAVIGATION BAR-->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
           
            <%
        String userTypex = (String) session.getAttribute("UserType");
        if (userTypex == null) {
    %>
            <a class="navbar-brand" href="index.jsp">Office Digitization System <sub>(A Contribution To Digital India)</sub></a>
            <%
            }
        else{
            %>
<a class="navbar-brand" href="index.jsp">Office Digitization System <sub>(A Contribution To Digital India)</sub></a>
<%  }
%>
            <div class="nav-collapse collapse-out">
                <%@include file="manage_nav.jsp"%>
            </div><!--/.nav-collapse -->
        </div><!-- /.navbar-inner -->
    </div><!-- /.navbar -->

</div> <!-- /.container -->
            <!--NAVBAR END-->
