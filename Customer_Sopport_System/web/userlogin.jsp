
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->

        <script src="./js/jquery-1.9.1.min.js"></script>
        <script src="./js/jquery.validate.js"></script>
        <script src="./js/additional-methods.js"></script>
        <style>

            input { border: 1px solid black; margin-bottom: .5em;  }
            input.error { border: 1px solid red; margin-bottom: .5em; }
            label.error {
                background: url('images/unchecked.gif') no-repeat;
                padding-left: 16px;
                margin-left: .3em;
            }

            label.valid {
                background: url('images/checked.gif') no-repeat;
                display: block;
                width: 16px;
                height: 16px;
            }
        </style>

        <style>
            #ver-zebra {
                font-family: "Lucida Sans Unicode", "Lucida Grande", Sans-Serif;
                font-size: 22px;
                width: 380px;
                text-align: left;
                border-collapse: collapse;
                margin: 0 20px 20px 20px;
            }
            input{
                border: 0;
                padding: 5px;
                font-size: 1em;
                font-family: Arial, sans-serif;
                color: #aaa;
                border: solid 2px #ccc;
                margin: 0 0 20px;
                width: 300px;
            }
            }
        </style>
        <form id="contactForm" action="UserLoginAction" method="post">
             <h2>User Login Page</h2>
             <table  summary="Most Favorite Movies">
                <tr><td colspan="2">

                        <%
                            if (request.getAttribute("msg") != null) {
                                String msg = request.getAttribute("msg").toString();
                        %>
                        <font color="red">
                        <%=msg%>
                        </font>

                        <%
                            }

                        %>

                    </td></tr>
                <tbody>
                <tbody>
                    <tr>
                        <td> Login ID</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>

                    <tr>
                        <td><a href="userreg.jsp">User Regisistration</a></td>
                        <td><input type="submit" name="btn" value="Log Me !" /></td>
                    </tr>
                </tbody>
            </table>
        </form>

    </div>
</div>


<script>
   

    $( "#contactForm" ).validate({
        
        rules:{
            
            email:{
                required: true,
                email: true
                
                       
        
            },
            password:{
                required: true,
                minlength:3,
                maxlength:100
            }
                   
        },
        messages:{
            
            email:{
                required: "Email ID is Required",
                email: "ex: xyz@domain.com",
                remote: "Email ID Not Valid"
            },
            password:{
                required: "Password is Required",
                minlength: "Atleast 3 Characters",
                maxlength: "100 Characters Only"
            }
        }
		
                
    });
            
           
</script>
<jsp:include page="inc/foot.jsp"/>