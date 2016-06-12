


<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%

    if (request.getParameter("fid") != null && request.getParameter("choicevalue") != null && request.getParameter("pid") != null && request.getParameter("userid") != null) {
        int questionid = Integer.parseInt(request.getParameter("fid"));
        int value = Integer.parseInt(request.getParameter("choicevalue"));
        int productid = Integer.parseInt(request.getParameter("pid"));
        String toid = request.getParameter("userid");
        String answerdesc = request.getParameter("answer");
        String uploadfile = request.getParameter("uploadfile");


        out.print(questionid);
        out.print(value);
        out.print(productid);
        out.print(toid);
        out.print(answerdesc);
        out.print(uploadfile);



        String fname = null, fileurl = null, typeoffile = null;
        String status = "ACTIVE";

        if (value == 1) {
            String semail = session.getAttribute("semail").toString();
            String comp_id = j.ClassName.get_compid(semail);
            String done = pro.Products.add_Answer_Details_by_employee(productid + "", questionid + "", "", "", answerdesc, semail, toid, status, comp_id);
            //  String done = pro.Products.add_Answer_Details_by_employee(productid, questionid, "SattvaQ", "SattvaQ", answerdesc, semail, toid, status);
            //   String done = pro.Products.add_Answer_Details_by_employee(productid, questionid, "SattvaQ", "SattvaQ", answerdesc, session.getAttribute("semail").toString(), toid, status);


            if (done.equals("ok")) {
                out.print(done);

                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                request.setAttribute("msg", "you hava answered successfully");
                rd.forward(request, response);
            } else {
                //    RequestDispatcher rd=request.getRequestDispatcher("GiveFeedback.jsp");
                //  request.setAttribute("msg", "try again");
                //  rd.forward(request, response);
            }

        } else if (value == 2) {
        } else if (value == 3) {
        }




    } else {
        out.print("sadfaslfasklsadfs");
    }




%>