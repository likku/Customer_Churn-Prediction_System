<%-- 
    Document   : giveanswerImage
    Created on : 18 Mar, 2014, 10:28:51 PM
    Author     : Bharath
--%>

<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        
          
        if(request.getParameter("msg")!=null){
            %>
        
            <font color="red"><h1><%= request.getParameter("msg") %></h1></font>
        
        <%
        }
        
        
        
        
        
        
        

            String UPLOAD_DIRECTORY = "C:/Users/likitha/Favorites/Desktop/MainProjectCode/Customer_Sopport_System/web/uploads";

            if (ServletFileUpload.isMultipartContent(request)) {
                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                Iterator<FileItem> it = multiparts.iterator();
                String name = null;
                int i = 1;
                String questionid = "";
                String value;
                String productid = "";
                String toid = "";

                String answerdesc = "";
                String status = "Active";
                // String uploadfile = request.getParameter("uploadfile");
                String fname = null, fileurl = null, typeoffile = null;

                while (it.hasNext()) {

                    FileItem fileItem = it.next();
                    boolean isFormField = fileItem.isFormField();
                    if (isFormField) {

                        if (fileItem.getFieldName().equals("fid")) {
                            questionid = fileItem.getString();
                        } else if (fileItem.getFieldName().equals("choicevalue")) {
                            value = fileItem.toString();
                        } else if (fileItem.getFieldName().equals("pid")) {
                            productid = fileItem.getString();
                        } else if (fileItem.getFieldName().equals("userid")) {
                            toid = fileItem.getString();
                        } else if (fileItem.getFieldName().equals("answer")) {
                            toid = fileItem.getString();
                        }
                    } else {



                        String exte = "";
                        String filename = new File(fileItem.getName()).getName();
                        i = filename.lastIndexOf('.');
                        if (i > 0) {
                            exte = filename.substring(i );
                        }
                     //   if ("jpeg".equals(exte) || "jpg".equals(exte)) {


                            name = new File(fileItem.getName()).getName();
                            fileItem.write(new File(UPLOAD_DIRECTORY + File.separator + name));
                            fileurl = "/uploads/" + name;




                       // } else {                            i = 2;                       }
                    }




                }

           //     if (i == 1) {
                    String done = pro.Products.add_Answer_Details_by_employee(Integer.parseInt(productid), Integer.parseInt(questionid), fileurl, "SattvaQ", answerdesc, session.getAttribute("semail").toString(), toid, status);
                             if (done.equals("ok")) {
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    request.setAttribute("msg", "you hava answered successfully");
                    rd.forward(request, response);
                } else {

                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                    request.setAttribute("msg", "try again");
                    rd.forward(request, response);
                }
                } /*else {

                    RequestDispatcher rd = request.getRequestDispatcher("GiveFeedback.jsp?product_id=" + productid);
                    request.setAttribute("msg", "Only jpeg or jpg");
                    rd.forward(request, response);
                }(*/

            
                       





        %>
    </body>
</html>
