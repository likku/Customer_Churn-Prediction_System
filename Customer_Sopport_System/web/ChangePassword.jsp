
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



    <div class="entry">
       
        <form id="contactForm" action="ChangePasswordAction.jsp" method="post">
            <table id="ver-zebra" summary="Most Favorite Movies">
                <tr><th colspan="2">

                        <%
                            if (request.getAttribute("msg") != null) {
                                String msg = request.getAttribute("msg").toString();
                        %>
                        <font color="red">
                        <%=msg%>
                        </font>

                        <%
                            }



                            String emailid = session.getAttribute("semail").toString();
                            String tou = session.getAttribute("tou").toString();



                        %>
                <h2><% if (tou.equals("productmanager")) {
                out.print("Product Manager ");
            } else if (tou.equals("admin")) {
                out.print("Admin ");
            } else if (tou.equals("user")) {
                out.print("User ");
            }%> Change Password here..!</h2>
                </th></tr>
                <tbody>
                <tbody>
                    <tr>
                        <td> Login ID</td>
                        <td><input type="text" name="email" value="<%=emailid%>" readonly="" />
                            <input type="hidden" name="tou" value="<%=tou%>" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="oldpassword" value="" /></td>
                    </tr>
                    <tr>
                        <td> New Password</td>
                        <td><input type="password" name="newpassword" value="" /></td>
                    </tr>
                    <tr>
                        <td> Re-Password</td>
                        <td><input type="password" name="repassword" value="" /></td>
                    </tr>


                    <tr>
                        <td></td>
                        <td><input type="submit" name="btn" value="Change Password" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
</div>

<br />
<br />

</body>
</html>

<script>
   

    $( "#contactForm" ).validate({
        
        rules:{
            
            
            oldpassword:{
                required: true,
                minlength:3,
                maxlength:100
            },
            newpassword:{
                required: true,
                minlength:3,
                maxlength:100
            },
            repassword:{
                required: true,
                minlength:3,
                maxlength:100
            }
            
                   
        }
                
    });
            
           
</script>


    </div>
</div>
<jsp:include page="inc/foot.jsp"/>