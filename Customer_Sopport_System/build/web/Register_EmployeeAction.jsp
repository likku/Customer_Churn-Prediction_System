<%-- 
    Document   : Register_EmployeeAction
    Created on : 8 Mar, 2014, 12:47:57 AM
    Author     : Bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       String companyheademail=session.getAttribute("semail").toString();
       
      String empemail=null, name=null, password=null, designition=null, gender=null, dob=null, mobile=null, address=null, status="Active"; 
       
      empemail =request.getParameter("email");
      name =request.getParameter("name");
       password=request.getParameter("password");
      designition =request.getParameter("desigantion");
       gender=request.getParameter("gender");
       dob=request.getParameter("dob");
       mobile=request.getParameter("mobile");
       address=request.getParameter("address");
    
      
      
      
      
       
       String regemployee=DAO.MyDao.registerEmployee(empemail, name, password, designition, companyheademail, gender, dob, mobile, address, status);
       
       if(regemployee.equals("")){
           out.print("Not registered");
           
       }else{
           out.print("registered");
       }
       
       
       
       
       %>
    </body>
</html>
