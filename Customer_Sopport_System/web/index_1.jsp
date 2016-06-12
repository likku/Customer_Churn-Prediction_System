
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->
        <%



            if (request.getParameter("s") != null) {
                String err = request.getParameter("s").toString();
                if (err.equals("l")) {
        %>
        <font color="green">
        Logged Out Successfully !
        </font>

        <%        }
            }
        %>









    </div>
</div>
<jsp:include page="inc/foot.jsp"/>