package newpackage;

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SARALA
 */
public class UserRegAction extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String suc = null, err = null;
            suc = "User inserted successfully";
            err = "Error";
            if (request.getParameter("btn") != null) {
                String password = null, emailid = null, name = null, phno = null, designation = null, gender = null, qualification = null, address = null;
                password = request.getParameter("password");
                emailid = request.getParameter("email");
                name = request.getParameter("name");
                phno = request.getParameter("phno");

                address = request.getParameter("address");

                
                
                
                
                 
                String email = emailid;
                String subj = "FeedbackSystem Registration Conform Mail";
                String content = "";

                content += "<style>table,th,td{border:1px solid black;}</style>";
                content += "<h1>FeedbackSystem Login Details</h1>";
                content += "<h2>Press This <a href='http://localhost:8080/FeedbackSystem/userlogin.jsp'>Link</a> to Login Page !</h2>";
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

                    user.Login ur = new user.Login();

                String ins = ur.addUserDetails(name, emailid, password, phno, address);
                if (ins == "ok") {


                    RequestDispatcher rd = request.getRequestDispatcher("userreg.jsp");
                    request.setAttribute("msg", suc);
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("userreg.jsp");
                    request.setAttribute("msg", err + "1");
                    rd.forward(request, response);
                }

                } catch (MessagingException e) {
                    throw new RuntimeException(e);
                }
                
                
                
                
                
                
                
                
               
            }
        } catch (Exception ex) {
            out.print(ex);
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
