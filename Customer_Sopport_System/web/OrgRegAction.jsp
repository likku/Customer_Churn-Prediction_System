<%-- 
    Document   : OrgRegAction
    Created on : 3 Mar, 2014, 11:23:01 AM
    Author     : Bharath
--%>

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

        <style type="text/css">
            body{
                width: 900px;
                margin: 0 auto;
                margin-top: 50px;
                font:bold 14px arial;
            }
            .product{
                float: left;
                margin-right: 10px;
                border: 1px solid #cecece;
                padding: 10px;
                margin-right: 20px;
            }
            .price{
                text-align: right;
            }
            .btn{
                text-align: center;
            }
        </style>

        <%


            try {
                String suc = null, err = null;
                suc = "Organization inserted successfully";
                err = "Error";
                //int packid=Integer.parseInt(request.getParameter("packid"));
                //if(packid!=0)
                //                     {


                if (request.getParameter("btn") != null) {
                    String password = null, emailid = null, name = null, hname = null, phno = null, orgloc = null, gender = null, qualification = null, address = null;
                    password = request.getParameter("password");
                    emailid = request.getParameter("email");
                    name = request.getParameter("name");
                    hname = request.getParameter("hname");
                    phno = request.getParameter("phno");
                    orgloc = request.getParameter("orgloc");




                    int duration = Integer.parseInt(request.getParameter("duration"));





                    int packId;
                    String organizationId = emailid;

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

                        address = request.getParameter("address");






                        String ins = reg.Organization.addOrganixarionDetails(emailid, name, password, phno, address, hname, orgloc);
                        if ("ok".equals(ins)) {

                            String op = pack.Packages.add_Org__Pack_Details(packId, organizationId, selectDate, startDate, endDate, status);


                            String email = emailid;
                            String subj = "Work Flow Management System Registration Conform Mail";
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
                            content += emailid;
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
                            /* RequestDispatcher rd = request.getRequestDispatcher("orgreg.jsp");
                            request.setAttribute("msg", suc);
                            rd.forward(request, response);*/
                        } else {
                            RequestDispatcher rd = request.getRequestDispatcher("orgreg.jsp");
                            request.setAttribute("msg", ins + err + "1");
                            rd.forward(request, response);
                        }
                    } else {
                        out.println("vlaues is not there1");
                    }
                }
            } //   }
            catch (Exception ex) {
                out.print(ex);
            }

        %>


        <%

            String paypal_url = "https://www.sandbox.paypal.com/cgi-bin/webscr";
            String paypal_id = "test.sattvaq@inbox.com";  // sriniv_1293527277_biz@inbox.com 



            ArrayList list = new ArrayList();

            if (request.getParameter("packid") != null) {
                int packId = Integer.parseInt(request.getParameter("packid"));
                list = pack.Packages.get_SINGLE_PackagesData(packId);
                if (list.size() > 0) {

                    Iterator it = list.iterator();
        %>

        <table  id="ver-zebra" >
            <tr>
                <td colspan="3">
                    <a>Your Package Details</a>
                </td>
            </tr>
            <%



                while (it.hasNext()) {
                    tl.PackagesData sp = (tl.PackagesData) it.next();
                    String name;
                    int noOfEmployees, noOfTasks, cost, duration;
                    name = sp.getName();
                    noOfEmployees = sp.getNoOfEmployees();
                    noOfTasks = sp.getNoOfTasks();
                    cost = sp.getCost();
                    duration = sp.getDuration();
            %>
            <tr>
                <th>Package Title</th>
                <td><%=name%></td>
                <th rowspan="4">
                    <input type="hidden" name="packid" value="<%=sp.getPackId()%>" />
                    <input type="hidden" name="duration" value="<%=duration%>" />
                    <a href="Packages.jsp" class="button">Change Package</a>
                </th>
            </tr>
            <tr>
                <th>Employees</th><td><%=noOfEmployees%></td>
            </tr>
            <tr>
                <th>Tasks</th><td><%=noOfTasks%></td>
            </tr>
            <tr>
                <th>Cost</th>
                <td><%= cost%></td>
            </tr>
            <tr>
                <th>Limit Days</th><td><%=duration%></td>
            </tr>


            <div class="name">
                <%=name%>
            </div>
            <div class="price">
                Price: <%= cost%>$
            </div>
            <tr><td>
                    <div class="btn">
                        <form action="<%=paypal_url%>" method='post' name='frmPayPal1'>
                            <input type='hidden' name='business' value="<%=paypal_id%>">
                            <input type='hidden' name='cmd' value='_xclick'>
                            <input type='hidden' name='item_number' value="<%=sp.getPackId()%>">
                            <input type='hidden' name='amount' value="<%= cost%>">
                            <input type='hidden' name='no_shipping' value='1'>
                            <input type='hidden' name='transactionid' value='1'>
                            <input type='hidden' name='currency_code' value="">
                            <input type='hidden' name='handling' value='0'>
                            <input type='hidden' name='cancel_return' value='http://localhost:8084/ECS/cancel.jsp'>
                            <input type='hidden' name='return' value='http://localhost:8084/ECS/success.jsp?&packid=<%=sp.getPackId()%>'>
                            <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                            <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
                        </form> 
                    </div>  






                </td></tr>  







            <tr>
                <td colspan="3">
                    <hr color="red"/>
                </td>
            </tr>

            <%
                }
            %>    </table><%
            } else {

            %>

        <h2>
            <a href=""> No Packages Are Available </a>
        </h2>


        <%    }

            }

        %>









    </body>
</html>
