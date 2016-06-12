/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Bharath
 */
@WebServlet(name = "AddProducts", urlPatterns = {"/AddProducts"})
public class AddProducts extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        //F:/New folder/Recommender system/RecomenderSystem/web/uploads
        //F:/New folder/Customer_Sopport_System/web/uploads
        
        //C:/Users/likitha/Favorites/Desktop/MainProjectCode/Customer_Sopport_System/web/uploads
        
        
        
        String UPLOAD_DIRECTORY = "C:/Users/likitha/Favorites/Desktop/MainProjectCode/Customer_Sopport_System/web/uploads";
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            String proName = null;
            String image = null;
            String details = null;
            int cost = 0;
            String dateTime;

            if (ServletFileUpload.isMultipartContent(request)) {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                Iterator<FileItem> it = multiparts.iterator();
                String name = null;
                int i = 1;

                while (it.hasNext()) {

                    FileItem fileItem = it.next();
                    boolean isFormField = fileItem.isFormField();
                    if (isFormField) {

                        if (fileItem.getFieldName().equals("name")) {
                            proName = fileItem.getString();
                        } else if (fileItem.getFieldName().equals("cost")) {
                            cost = Integer.parseInt(fileItem.getString());
                        } else if (fileItem.getFieldName().equals("description")) {
                            details = fileItem.getString();
                        }
                    } else {

                        name = new File(fileItem.getName()).getName();
                        fileItem.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                        image = request.getContextPath() + "/uploads/" + name;
                    }

                }

                HttpSession se = request.getSession();
                String pmid = se.getAttribute("semail").toString();







                Calendar lCDateTime = Calendar.getInstance();
                dateTime = "" + lCDateTime.getTimeInMillis();





                String ins = pro.Products.add_Product_Details(proName, image, details, cost, dateTime, pmid);
                if ("ok".equals(ins)) {
                    RequestDispatcher rd = request.getRequestDispatcher("AddProducts.jsp");
                    request.setAttribute("msg", "Product Added Success");
                    rd.forward(request, response);
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("AddProducts.jsp");
                    request.setAttribute("msg", "Check");
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
