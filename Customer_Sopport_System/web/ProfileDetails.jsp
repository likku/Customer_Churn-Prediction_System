
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <h2><% String tou = session.getAttribute("tou").toString();
            if (tou.equals("productmanager")) {
                out.print("Product Manager ");
            } else if (tou.equals("admin")) {
                out.print("Admin ");
            } else if (tou.equals("user")) {
                out.print("User ");
            }%> Profile Details here..!</h2>
            <%
                String emailid = "";
                if (session.getAttribute("emailid") != null) {



                    emailid = session.getAttribute("emailid").toString();
                } else {
                    emailid = session.getAttribute("semail").toString();

                }

                ArrayList l = new ArrayList();



                if (tou.equals("admin")) {




                    l = admin.Login.get_admin_Data(emailid);
                    // out.print(emailid);
                    Iterator it = l.iterator();

            %>

        <table  id="ver-zebra" style="width:100%;  ">


            <%
                while (it.hasNext()) {
                    fs.AdminData tt = (fs.AdminData) it.next();




                    String password, email;



                    password = tt.getPassword();
                    email = tt.getUserId();




            %>


            <tr>  <th style="float: left;">Email id</th><td>                    <%= email%>                </td></tr>




            <%  }%>

            <tr>
                <td><a href="#">-------------></a></td>
                <td><a href="ChangePassword.jsp"></a></td>
            </tr>
        </table>
        <%





        } else if (tou.equals("productmanager") || tou.equals("employee")) {



            l = pm.Login.get_pm_Data(emailid);
            // out.print(emailid);
            Iterator it = l.iterator();

        %>

        <table  id="ver-zebra" style="width:100%;  ">


            <%
                while (it.hasNext()) {
                    fs.PmDetails tt = (fs.PmDetails) it.next();




                    String fn, password, email, mob, adr, org_lname, org_location;


                    fn = tt.getPmName();
                    password = tt.getPassword();
                    email = tt.getPmUserid();
                    mob = tt.getPhno();
                    adr = tt.getAddress();




            %>

            <tr>
                <th style="float: left;">Name</th>
                <td>                    <%= fn%>                </td></tr>
            <tr>  <th style="float: left;">Email id</th><td>                    <%= email%>                </td></tr>
            <tr> <th style="float: left;">Mobile No</th><td>                    <%= mob%>                </td></tr>
            <tr> <th style="float: left;">Address</th>       <td>                    <%= adr%>                </td></tr>


            <%  }%>

            <tr>
                <td><a href="ProfileDetailsEdit.jsp"></a></td>
                <td><a href="ChangePassword.jsp"></a></td>
            </tr>
        </table>
        <%



        } else if (tou.equals("user")) {




            l = user.Login.get_user_Data(emailid);
            // out.print(emailid);
            Iterator it = l.iterator();

        %>

        <table  id="ver-zebra" style="width:100%;  ">


            <%
                while (it.hasNext()) {
                    fs.UserDetails tt = (fs.UserDetails) it.next();




                    String fn, password, email, mob, adr, org_lname, org_location;


                    fn = tt.getUserName();
                    password = tt.getPassword();
                    email = tt.getUEmailid();
                    mob = tt.getUPhno();
                    adr = tt.getAddress();




            %>

            <tr>
                <th style="float: left;">Name</th>
                <td>                    <%= fn%>                </td></tr>
            <tr>  <th style="float: left;">Email id</th><td>                    <%= email%>                </td></tr>
            <tr> <th style="float: left;">Mobile No</th><td>                    <%= mob%>                </td></tr>
            <tr> <th style="float: left;">Address</th>       <td>                    <%= adr%>                </td></tr>













            <%  }%>

            <tr>
                <td><a href="ProfileDetailsEdit.jsp"></a></td>
                <td>
                    <a href="ChangePassword.jsp"></a></td>
            </tr>
        </table>


        <%



            }

        %>

    </div>








</div>
</div>
<jsp:include page="inc/foot.jsp"/>