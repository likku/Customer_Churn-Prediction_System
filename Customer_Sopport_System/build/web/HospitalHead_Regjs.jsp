<jsp:include page="inc/header.jsp"/>
<jsp:include page="inc/content.jsp"/>

<%
        int planid=Integer.parseInt(request.getParameter("planid"));
        java.util.ArrayList al=DAO.MyDao.viewPlansbyplanid(planid);
        java.util.Iterator ital=al.iterator();
        
        %>
        
        <table border="1" cellpadding="5">
            <tr>
                <td>Plan Name</td>
                <td>No of Branches</td>
                <td>No of Doctors</td>
                <td>No of Patients</td>
                <td>No Lab Incharges</td>
                <td>Plan Description</td>
                <td>Duration</td>
                <td>Cost</td>
            </tr>
            
        
        <%
        String pname=null,palndesc=null,duration=null;
        int nobranches=0,nofdocs=0,nopatients=0,nolabinc=0,cost=0;
        int planid1=0;
        
        while(ital.hasNext()){
            doc.PlanData pdata=(doc.PlanData)ital.next();
            pname=pdata.getPlanname();
            palndesc=pdata.getDescription();
            duration=pdata.getDuration();
            nobranches=pdata.getNoofbranches();
            nofdocs=pdata.getNoofdoctors();
            nopatients=pdata.getNoofpatients();
            nolabinc=pdata.getNooflabincharges();
            cost=pdata.getAmount();
            planid=pdata.getPlanid();
            
            %>
        
            <tr>
                <td><%=pname%></td>
                <td><%=nobranches%></td>
                <td><%=nofdocs%></td>
                <td><%=nopatients%></td>
                <td><%=nolabinc%></td>
                <td><%=palndesc%></td>
                <td><%=duration%></td>
                <td><%=cost%></td>
                
                <td><a href="view_Plans.jsp?planid=<%=planid%>"/>Change Plan</a></td>
                
            </tr>
            
            <%
        }
        
        %>
        
        </table>
        
        
        <h4>Register here
        </h4>
        
        <form action="HospitalHead_RegAction.jsp" method="POST">
            
            <input type="hidden" name="planid" value="<%=planid%>" />
            
            
            
            
            <table>
                
                <tbody>
                    <tr>
                        <td>Hospital Name</td>
                        <td><input type="text" name="hospname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Location</td>
                        <td><input type="text" name="loc" value="" /></td>
                    </tr>
                    <tr>
                        <td>Hospital HeadName</td>
                        <td><input type="text" name="headname" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <input type="radio" name="gender" value="male" />male
                            <input type="radio" name="gender" value="male" />Female</td>
                    </tr>
                    <tr>
                        <td>DOB</td>
                        <td><input type="date" name="dob" value="" /></td>
                    </tr>
                    <tr>
                        <td>Designation</td>
                        <td><input type="text" name="design" value="" /></td>
                    </tr>
                    <tr>
                        <td>Qualification</td>
                        <td><select name="qual">
                                <option value="0">Select Qualification</option>
                                <option>A</option>
                                <option>B</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="address" rows="4" cols="20">
                            </textarea></td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><input type="text" name="mob" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Register" /></td>
                    </tr>
                </tbody>
            </table>

            
        </form>
   