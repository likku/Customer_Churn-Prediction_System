<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>


<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->






        <h2>Registered Companies</h2>


    </div>


</body>
</html>


<%




    ArrayList list = new ArrayList();


    list = pack.Packages.get_Companies_Data();
    if (list.size() > 0) {

        Iterator it = list.iterator();
%>

<table  id="ver-zebra" >
    <thead>
        <tr>
            <th>OrgName</th>
            <th>H Name</th>
            <th>Email ID</th>
            <th>Location</th>

        </tr>
    </thead>
    <tbody>
        <%
            while (it.hasNext()) {
                fs.CompanyheadData sp = (fs.CompanyheadData) it.next();
                String title;
                int featurestwo, featuresone;
                int cost, days;
                String cheadname = sp.getCompanyheadname();
                String cname = sp.getCompanyname();
                String clogo = sp.getCompanylogo();
                String hemail = sp.getHeademail();
                String loc = sp.getLocation();
        %>

        <tr>
            <td><%= cname%></td>
            <td><%=cheadname%></td>
            <td><%=hemail%></td>
            <td><%= loc%></td>
            <td><a target="_blank" href="picchart.jsp?id=<%=hemail%>">Chart Anylasys</a></td>


        </tr>






        <%
            }
        %>     </tbody></table><%
        } else {

        %>

<h2>
    <a href=""> No Packages Are Available </a>
</h2>


<%    }
%>


</center>
<jsp:include page="inc/foot.jsp"/>