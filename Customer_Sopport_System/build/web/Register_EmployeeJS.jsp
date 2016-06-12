<%-- 
    Document   : Register_EmployeeJS
    Created on : 8 Mar, 2014, 12:40:44 AM
    Author     : Bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="Register_EmployeeAction.jsp" method="POST">
            
            <table border="1">
               
                <tbody>
                    <tr>
                        <td>Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>
                    <tr>
                        <td>Designation</td>
                        <td><select name="desigantion">
                                <option value="0">Select Designation</option>
                                <option>A</option>
                                <option>B</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td>
                            <input type="radio" name="gender" value="male" />Male
                            <input type="radio" name="gender" value="female" />Female</td>
                    </tr>
                    <tr>
                        <td>DoB</td>
                        <td><input type="date" name="dob" value="" /></td>
                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><input type="text" name="mobile" value="" /></td>
                    </tr>
                    <tr>
                        <td>Address</td>
                        <td><textarea name="address" rows="4" cols="20">
                            </textarea></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Register" /></td>
                    </tr>
                </tbody>
            </table>

            
            
        </form>
        
    </body>
</html>
