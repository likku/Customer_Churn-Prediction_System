<%


    try {
        String suc = null, err = null;
        suc = "Updated successfully";
        err = "Error";
        if (request.getParameter("btn") != null) {
            String password = null, name = null, hname = null, phno = null, orgloc = null, gender = null, qualification = null, address = null;



            String emailid = session.getAttribute("emailid").toString();
            String tou = session.getAttribute("tou").toString();

            String ins = null;

            if (tou.equals("productmanager")) {

                name = request.getParameter("name");
               // hname = request.getParameter("hname");
                phno = request.getParameter("phno");
              //  orgloc = request.getParameter("orgloc");

                address = request.getParameter("address");
                ins = reg.Organization.update_Organixarion_Details(emailid, name, phno, address, hname, orgloc);
            } else if (tou.equals("user")) {
                name = request.getParameter("name");

                phno = request.getParameter("phno");


                address = request.getParameter("address");
                ins = reg.Organization.update_TL_Details(emailid, name, phno, address);
            } 




            if (ins == "ok") {
                RequestDispatcher rd = request.getRequestDispatcher("OrganizationProfile.jsp");
                request.setAttribute("msg", suc);
                rd.forward(request, response);
            } else {
                RequestDispatcher rd = request.getRequestDispatcher("OrganizationProfile.jsp");
                request.setAttribute("msg", ins + err + "1");
                rd.forward(request, response);
            }
        }
    } catch (Exception ex) {
        out.print(ex);
    } finally {
        out.close();
    }


%>
