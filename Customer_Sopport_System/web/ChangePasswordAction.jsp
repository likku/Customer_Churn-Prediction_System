<%

   // try {
        String suc = null, err = null, err1 = null;
        suc = "Password Updated successfully";

        err = "Old Password is Wrong !";
        err1 = "Please Enter same passswords";
        //if (request.getParameter("btn") != null) {
            String oldpassword = null, newpassword = null, repassword = null, emailid = null, tou;


            emailid = request.getParameter("email");
            tou = request.getParameter("tou");
            oldpassword = request.getParameter("oldpassword");
            newpassword = request.getParameter("newpassword");
            repassword = request.getParameter("repassword");

            String psw_check = "";

            if (tou.equals("admin")) {
                psw_check = admin.Login.getPasswordAvailable(emailid, oldpassword);
            } else if (tou.equals("productmanager")) {
                psw_check = pm.Login.getPasswordAvailable(emailid, oldpassword,tou);
            } else if (tou.equals("user")) {
                psw_check = user.Login.getPasswordAvailable(emailid, oldpassword);
            }


            


            Integer jj = Integer.parseInt(psw_check);
            int jjj = jj;
            if (jjj > 0) {
                if (newpassword.equals(repassword)) {

                    String update_check = admin.Login.change_Password(emailid, repassword, tou);

out.print(update_check); 



/*
 * 
                    Integer pp = Integer.parseInt(update_check);
                    int ppp = pp;
                    if (ppp > 0) {
                        RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
                        request.setAttribute("msg", suc);
                        rd.forward(request, response);
                    } else {
                        RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
                        request.setAttribute("msg", err1);
                        rd.forward(request, response);
                    }
                } else {

                    RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
                    request.setAttribute("msg", err1);
                    rd.forward(request, response);

                }

            } else {
                RequestDispatcher rd = request.getRequestDispatcher("ChangePassword.jsp");
                request.setAttribute("msg", err);
                rd.forward(request, response);
            }

*/
                }

                }else{
                    
                }
        //}
  

%>