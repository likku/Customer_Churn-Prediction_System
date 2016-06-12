<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->


    <body>
        <form action="Company_HeadRegAction.jsp" method="POST">
            <table cellpadding="10" cellspacing="10">
                
                <input type="hidden" name="packid" value="<%=request.getParameter("packid")%>" />
                <input type="hidden" name="noofemplpyees" value="<%=request.getParameter("noofemplpyees")%>" />
                <input type="hidden" name="noofproducts" value="<%=request.getParameter("noofproducts")%>" />
                <input type="hidden" name="cost" value="<%=request.getParameter("cost")%>" />
                <input type="hidden" name="duration" value="<%=request.getParameter("duration")%>" />
                <input type="hidden" name="packname" value="<%=request.getParameter("packname")%>" />
                <tbody>
                    <tr>
                        <td>Company Name</td>
                        <td><input type="text" name="cname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Logo</td>
                        <td><input type="text" name="logo" value="" /></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td><input type="text" name="location" value="" /></td>
                    </tr>
                    <tr>
                        <td>Head Name</td>
                        <td><input type="text" name="headname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Head Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <input type="radio" name="gender" value="male" />Male
                            <input type="radio" name="gender" value="female" />Female
                        </td>
                    </tr>
                    <tr>
                        <td>DOB</td>
                        <td><input type="date" name="dob" value="" /></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Register" /></td>
                    </tr>
                </tbody>
            </table>

            
        </form>
    </body>

<jsp:include page="inc/foot.jsp"/>
