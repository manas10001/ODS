<% 
  String filename = request.getParameter("filename"); 
  System.out.println("filename"+filename);
  String path = getServletContext().getRealPath("/" )+"data/";
  // path=path+"data/";
  //path=path.replace("build/web/","data/");
  //String filepath = "/home/manas/NetBeansProjects/hirarchy/build/web/";   
  response.setContentType("APPLICATION/OCTET-STREAM");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
   
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(path + filename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%>  