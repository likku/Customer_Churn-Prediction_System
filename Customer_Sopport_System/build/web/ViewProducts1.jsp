
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
       
        
        
        
        <%
        


 String pmid = session.getAttribute("emailid").toString();
 
 
 ArrayList<String> l = new ArrayList<String>();
     l=pro.Products.get_PM_Products(pmid);
     
     for(Iterator i = l.iterator(); i.hasNext();)
             {
     
     out.print(i.next());
     }
             
 
 
 

%>
        
        
        
    </div>
</div>
<jsp:include page="inc/foot.jsp"/>