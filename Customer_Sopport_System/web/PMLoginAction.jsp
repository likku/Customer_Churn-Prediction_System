<%-- 
    Document   : newjsp1
    Created on : 16 Mar, 2014, 12:01:31 AM
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
         try {
           // HttpSession session = request.getSession();
            String suc = null, err = null;
            suc = "you're logged in successfully";
            err = "Wrong email or password";
            if (request.getParameter("btn") != null) {
                String password = null, emailid = null;
                password = request.getParameter("password");
                emailid = request.getParameter("email");
                
                String tou= request.getParameter("tou");
                
                
                out.print(password+emailid+tou);
                
                
                String email_check = pm.Login.getEmailAvailable(emailid,tou);
                
               // out.print(email_check) ;
                
                
               
             
                
                if (email_check == "ok") {

                    String psw_check = pm.Login.getPasswordAvailable(emailid, password,tou);
                    if (psw_check == "ok") {

                        session.setAttribute("semail", emailid);
                        session.setAttribute("tou", tou);
                        String comp_id= j.ClassName.get_compid(emailid);
                      //  session.setAttribute("compid", comp_id);
                        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                        request.setAttribute("msg", suc);
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("pmlogin.jsp");
                        request.setAttribute("msg", err + "1");
                        rd.forward(request, response);
                    }

                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("pmlogin.jsp");
                    request.setAttribute("msg", err + email_check);
                    rd.forward(request, response);
                }
                  
          
                
                
                
                
            }else{
                out.print("button not pressed");
            }
        } catch (Exception ex) {
            out.print(ex);
        } finally {
            out.close();
        }
        %>
    </body>
</html>
