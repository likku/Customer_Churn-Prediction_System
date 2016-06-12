/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bharath
 */
@WebServlet(name = "UserLoginAction", urlPatterns = {"/UserLoginAction"})
public class UserLoginAction extends HttpServlet {

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
           HttpSession session = request.getSession();
            String suc = null, err = null;
            suc = "you're logged in successfully";
            err = "Wrong email or password";
            if (request.getParameter("btn") != null) {
                String password = null, emailid = null;
                password = request.getParameter("password");
                emailid = request.getParameter("email");


                String email_check = user.Login.getEmailAvailable(emailid);
                if (email_check == "ok") {

                    String psw_check = user.Login.getPasswordAvailable(emailid, password);
                    if (psw_check == "ok") {

                        session.setAttribute("emailid", emailid);
                        session.setAttribute("tou", "user");
                        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                        request.setAttribute("msg", suc);
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                        request.setAttribute("msg", err);
                        rd.forward(request, response);
                    }

                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                    request.setAttribute("msg", err);
                    rd.forward(request, response);
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
