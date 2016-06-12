<%-- 
    Document   : HospitalHead_RegAction
    Created on : 26 Feb, 2014, 8:15:59 PM
    Author     : Bharath
--%>

<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
        String hospheademail=null,hospitalname=null,location=null, hospitalheadname=null,password=null,gender=null, dob=null,designition=null,qualification=null,address=null,mobilenumber=null;
             String dateofregistration=null; 
              String planid=request.getParameter("planid");
        
        
              hospheademail=request.getParameter("email");
              hospitalname=request.getParameter("hospname");
             location =request.getParameter("loc");
             hospitalheadname =request.getParameter("headname");
             password =request.getParameter("password");
             gender =request.getParameter("gender");
              dob=request.getParameter("dob");
              designition=request.getParameter("design");
              qualification=request.getParameter("qual");
              address=request.getParameter("address");
             mobilenumber =request.getParameter("mob");
             
             
             Date d=new java.util.Date();
             
              dateofregistration=d.toString();
              
              boolean Check_Email=DAO.MyDao.checkHospitalheademailavailability(hospheademail);
              
              if(Check_Email){
                  out.print("This Email already Exist");
              }else{
              
              
              String mthd=DAO.MyDao.registerHospitalhead(hospheademail, hospitalname, location, hospitalheadname, password, gender, dob, designition, qualification, address, mobilenumber, dateofregistration, planid);
              
              //out.print(mthd);
              
              
              
              
              if(mthd.equals("")){
                  out.print("Not Registered");
              }else{
                  out.print("Registered");
                  
                  response.sendRedirect("index.jsp");
                  
                  
                  
                  
              }
              
              
                           }
              
              
              
              
              
        
        
        
        
        %>
    </body>
</html>
