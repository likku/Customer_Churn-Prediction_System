<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<% //get an instance of the email validator
    if (request.getParameter("email") == null) {
        out.print("false");
    } else {
        String email = request.getParameter("email");
        email = email.trim();


        String email_check = pm.Login.getEmailAvailable(email);
        if (email_check == "ok") {
            out.print("false");
        } else {
            out.print("true");
        }
    }
%>