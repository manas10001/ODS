<%
//RESETTING ALL SESSION ATTRIBUTES.
    session.setAttribute("User", null);
    session.setAttribute("dept", null);
    session.setAttribute("no", null);
    session.setAttribute("hod", null);  
    session.setAttribute("username", null);
    session.setAttribute("UserType", null);
    session.setAttribute("catagory", null);
    session.setAttribute("flash_message", "logged out successfully !!!");
    session.setAttribute("flash_type", "info");
    session.invalidate();
    response.sendRedirect("index.jsp");
%>

