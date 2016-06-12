<%-- 
    Document   : Company_HeadRegAction
    Created on : 8 Mar, 2014, 12:28:11 AM
    Author     : Bharath
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
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
        String heademail=null, companyname=null, companylogo=null, location=null, companyheadname=null, password=null, gender=null, dob=null, dateofregistration;
int pid=0;
        
            heademail=request.getParameter("email");
            companyname=request.getParameter("cname");
           companylogo =request.getParameter("logo");
            location=request.getParameter("location");
            companyheadname=request.getParameter("headname");
            password=request.getParameter("password");
            gender=request.getParameter("gender");
            dob=request.getParameter("dob");
          
        
        
        
       String suc = null, err = null;
            suc = "Registered successfully";
            err = "Not Registered";
        
        
        
        Date d=new java.util.Date();
        dateofregistration=d.toString();
        
        int packid=0,noofemployee=0,noofproducts=0,cost=0,duration=0;
        String packname=null;
        
        packid=Integer.parseInt(request.getParameter("packid"));
        noofemployee=Integer.parseInt(request.getParameter("noofemplpyees"));
        noofproducts=Integer.parseInt(request.getParameter("noofproducts"));
        cost=Integer.parseInt(request.getParameter("cost"));
       duration =Integer.parseInt(request.getParameter("duration"));
       packname= request.getParameter("packname");
        
       
       pid=packid;
       
       
       
                    int packId;
                    String organizationId = heademail;

                    String status = "active";






                    Date selectDate = new Date();
                    Date startDate = new Date();

                    Date endDate = new Date();
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(endDate);
                    cal.add(Calendar.DATE, duration); // add 10 days  

                    endDate = cal.getTime();


                    if (request.getParameter("packid") != null) {



                        packId = Integer.parseInt(request.getParameter("packid"));

                    
                        String sub_pack_by_Head=DAO.MyDao.add_Package_after_Head_subscribe(packId, organizationId, selectDate, startDate, endDate, status);

               // out.print(sub_pack_by_Head);
        
        String regHead=DAO.MyDao.registerCompanyHead(heademail, companyname, companylogo, location, companyheadname, password, gender, dob, dateofregistration, pid);
        
       // out.print(regHead);
        
        
        String email = heademail;
                            String subj = "Customer churn prediction System Registration Conform Mail";
                            String content = "";

                            content += "<style>table,th,td{border:1px solid black;}</style>";
                            content += "<h1>Work Flow Management System</h1>";

                            content += "<html><body>";
                            content += "<table bgcolor='lightblue' border='3'>";

                            content += "<tr>";
                            content += "<td>";
                            content += "Your Login ID : ";
                            content += "</td>";
                            content += "<td>";
                            content += heademail;
                            content += "</td>";
                            content += "</tr>";


                            content += "<tr>";
                            content += "<td>";
                            content += "Your Login Password : ";
                            content += "</td>";
                            content += "<td>";
                            content += password;
                            content += "</td>";
                            content += "</tr>";

                            content += "</table>";
                            content += "</body></html>";

                            final String username = "testsattvaq@gmail.com";
                            final String mail_password = "www.sattvaq.com";

                            Properties props = new Properties();
                            props.put("mail.smtp.auth", "true");
                            props.put("mail.smtp.starttls.enable", "true");
                            props.put("mail.smtp.host", "smtp.gmail.com");
                            props.put("mail.smtp.port", "587");

                            Session session1 = Session.getInstance(props,
                                    new javax.mail.Authenticator() {

                                        protected PasswordAuthentication getPasswordAuthentication() {
                                            return new PasswordAuthentication(username, mail_password);
                                        }
                                    });

                            try {

                                Message message = new MimeMessage(session1);
                                message.setFrom(new InternetAddress("sattvaq.info@gmail.com"));
                                message.setRecipients(Message.RecipientType.TO,
                                        InternetAddress.parse(email));
                                message.setSubject(subj);
                                message.setContent(content, "text/html");
                                Transport.send(message);



                            } catch (MessagingException e) {
                                throw new RuntimeException(e);
                            }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
   
        
        if(regHead.equals("")){
          
           RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
              request.setAttribute("msg", err);
             rd.forward(request, response);
         
            
          
            
        }else{
              
           RequestDispatcher rd = request.getRequestDispatcher("Packages.jsp");
             request.setAttribute("msg", suc);
              rd.forward(request, response);
            
        }
        
               }
                  else{
                        
                      out.print("Not Registered");  
                        
               }
        
        
        %>
    </body>
</html>
