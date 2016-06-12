
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">

        <script src="./js/jquery-1.9.1.min.js"></script>
        <script src="./js/jquery.validate.js"></script>
        <script src="./js/additional-methods.js"></script>
        <style>

            input,select { border: 1px solid black; margin-bottom: .5em;  }
            input.error { border: 1px solid red; margin-bottom: .5em; }
            select.error { border: 1px solid red; margin-bottom: .5em; }
            label.error {
                background: url('images/unchecked.gif') no-repeat;
                padding-left: 10px;
                margin-left: .3em;
            }

            label.valid {
                background: url('images/checked.gif') no-repeat;
                display: block;
                width: 16px;
                height: 16px;
            }
        </style>

        <h2><% String tou = session.getAttribute("tou").toString();
            if (tou.equals("productmanager")) {
                out.print("Product Manager ");
            } else if (tou.equals("admin")) {
                out.print("Admin ");
            } else if (tou.equals("user")) {
                out.print("User ");
            }%> Profile Details Edit here..!</h2>

        <div class="entry">

            <%
                String emailid = session.getAttribute("emailid").toString();
                tou = session.getAttribute("tou").toString();
                ArrayList l = new ArrayList();


                if (tou.equals("productmanager")) {



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
                <form id="contactForm" action="ProfileDetailsEditAction.jsp" method="post">
                    <table id="ver-zebra" summary="Most Favorite Movies">
                        <tr><th colspan="2">

                                <%
                                    if (request.getAttribute("msg") != null) {
                                        String msg = request.getAttribute("msg").toString();
                                %>
                                <font color="green">
                                <%=msg%>
                                </font>

                                <%
                                    }

                                %>

                            </th></tr>
                        <tbody>
                        <tbody>


                            <tr>
                                <td>Head Name</td>
                                <td><input type="text" name="name" value="<%=fn%>" /></td>
                            </tr>
                            <tr>
                                <td> Login ID</td>
                                <td><input type="text" name="email" value="<%= email%>" readonly="" /></td>
                            </tr>



                            <tr>
                                <td> Mobile</td>
                                <td><input type="text" name="phno" value="<%=mob%>" /></td>
                            </tr>
                            <tr>
                                <td> Address</td>
                                <td><textarea style="margin: 0px; height: 142px; width: 482px;" name="address" rows="4" cols="20"><%=adr%></textarea></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td><input type="submit" name="btn" value="Update Details  !" /></td>
                            </tr>
                        </tbody>
                    </table>
                </form><%  }%><%
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
                    <form id="contactForm" action="ProfileDetailsEditAction.jsp" method="post">
                        <table id="ver-zebra" summary="Most Favorite Movies">
                            <tr><th colspan="2">

                                    <%
                                        if (request.getAttribute("msg") != null) {
                                            String msg = request.getAttribute("msg").toString();
                                    %>
                                    <font color="green">
                                    <%=msg%>
                                    </font>

                                    <%
                                        }

                                    %>

                                </th></tr>
                            <tbody>
                            <tbody>


                                <tr>
                                    <td>TL Name</td>
                                    <td><input type="text" name="name" value="<%=fn%>"/></td>
                                </tr>
                                <tr>
                                    <td> Login ID</td>
                                    <td><input type="text" name="email" value="<%= email%>" readonly="" /></td>
                                </tr>


                                <tr>
                                    <td> Mobile</td>
                                    <td><input type="text" name="phno" value="<%=mob%>" /></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><textarea style="margin: 0px; height: 142px; width: 482px;" name="address" rows="4" cols="20"><%=adr%></textarea></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><input type="submit" name="btn" value="Update Details  !" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </form><%  }%><%

                }%>
                    </div>
                    </div>

                    <br />
                    <br />

                    </body>
                    </html>

                    <script>
   

                        $( "#contactForm" ).validate({
        
                            rules:{
            
                                orgloc:{
                                    required:true  
                                },address:{
                                    required:true  
                                },
                                name:{
                                    required: true
                                },hname:{
                                    required: true,
                                    alpha: true
                                },
                                phno:{
                                    required: true,
                                    number: true,
                                    minlength:10,
                                    maxlength:10
                                },
                                password:{
                                    required: true,
                                    minlength:3,
                                    maxlength:100
                                }
                   
                            }
		
                
                        });
            
                        jQuery.validator.addMethod("alpha", function(value, element) {
                            return this.optional(element) || value == value.match(/^[a-zA-Z ]+$/);
                        },"Only Characters Allowed.");     
           
                    </script>


                    </div>
                    </div>
                    <jsp:include page="inc/foot.jsp"/>