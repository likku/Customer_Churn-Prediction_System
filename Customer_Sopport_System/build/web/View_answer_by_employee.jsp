<%-- 
    Document   : View_answer_by_employee
    Created on : 19 Mar, 2014, 12:27:39 AM
    Author     : Bharath
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            int rating = 0, question_id = 0;

            question_id = Integer.parseInt(request.getParameter("product_id"));
            rating = Integer.parseInt(request.getParameter("choicevalue"));

            //out.print(question_id);



            ArrayList l = new ArrayList();


            l = DAO.MyDao.view_answer_by_Question(question_id);
            
            java.util.Iterator ital=l.iterator();
            
            
            String ansdesc=null,image=null,video=null;
            
            
            while(ital.hasNext()){
                
                fs.Answersdata fa=(fs.Answersdata)ital.next();
                ansdesc=fa.getAnswerdesc();
                image=fa.getImgurl();
                video=fa.getVideourl();
                
                
          
            

            //out.print(l);
            if (rating == 1) {
                
                %>
        
                
                <%=ansdesc%>
            
        <%
            } else if (rating == 2) {
                
                
               %>
               
               <img src="http://localhost:8084/Customer_Sopport_System<%=image%>"/>

               
               <%
                
            } else if (rating == 3) {
                
                
                %>
                
                
                
                <video width="320" height="240" controls=""  name="media"><source src=".<%=video%>" type="video/mp4"></video>
                
                <%
                
                
                
                
            }



  }




















        %>
    </body>
</html>
