<%-- 
    Document   : cancel
    Created on : Nov 30, 2013, 2:23:55 PM
    Author     : SattvaQ
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
 //  String mid=request.getParameter("email");   
out.print(session.getAttribute("semail").toString());
%>
welcome, <%//mid%>
<h2>Payment Canceled</h2>
    </body>
</html>
