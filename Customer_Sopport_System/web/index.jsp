
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<jsp:include page="inc/head.jsp"/>



 <div id="site_content">
     
      <div id="content">
       
    
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




        <%
            String sear = null;
            ArrayList l = new ArrayList();
            int total_count = 0;
            int start = 1;
            int maxRows = 5;
            double num_pages = 0;
            int page_num = 1;

            if (request.getParameter("pagenum") != null) {
                page_num = Integer.parseInt(request.getParameter("pagenum"));

                
            }


            if (start == 0) {
                start = 1;
            }


            if (request.getParameter("search_field") != null) {

                sear = request.getParameter("search_field").toString();
                total_count = pro.Products.get_count_Products_by_where(sear);
                num_pages = (int) Math.ceil(total_count * 1.0 / maxRows);
                l = pro.Products.get_Products_by_where(sear, (page_num - 1) * maxRows, maxRows);


        %>


        <h2>
            <%
                for (int j = 1; j <= (int) num_pages; j++) {
            %>

            <a href="index.jsp?search_field=<%=sear%>&pagenum=<%=j%>"><%=j%></a>


            <%

                }
            %> <b style="float: right;"><%=start + "_to_" + maxRows%>. . . <%=total_count%> Results</b> 
        </h2>



        <%

        } else {
            total_count = pro.Products.get_count_Products();
            //out.print(total_count1);
            num_pages = (int) Math.ceil(total_count * 1.0 / maxRows);
            l = pro.Products.get_Products((page_num - 1) * maxRows, maxRows);
        %>



        <h2>
            <%
                //  out.print(num_pages);
                for (int j = 1; j <= (int) num_pages; j++) {

                    if (j == page_num) {
            %>

            <a style="outline: none;
               text-decoration: underline;
               color: brown; background-color: tomato;  " href="index.jsp?pagenum=<%=j%>"><%=j%></a>


            <%
            } else {%>

            <a href="index.jsp?pagenum=<%=j%>"><%=j%></a>


            <%


                    }
                }
            %> <b style="float: right;"><%=start + "_to_" + maxRows%>. . . <%=total_count%> Results</b> 
        </h2>



        <%
            }


        %>





        <div style="float: center;">
            <form method="post" action="index.jsp" id="search_form">
                <p>
                    <input class="search" type="text" name="search_field" placeholder="Enter keywords....." />
                    <input name="search" type="image"  src="style/search.png" alt="Search" title="Search" />
                </p>
            </form>
        </div>


        <%


            // out.print(l); 

            // if (false) {
            if (l.size() > 0) {

                Iterator i = l.iterator();
        %>





        <table>


            <tr>
                <%
                    int row = 1;
                    while (i.hasNext()) {

                        fs.ProductDetails fp = (fs.ProductDetails) i.next();
                        String proName;
                        String image;
                        String details;
                        int cost;
                        String dateTime;
                        proName = fp.getProName();
                        image = fp.getImage();
                        details = fp.getDetails();
                        cost = fp.getCost();
                        dateTime = fp.getDateTime();%>




                <td>
                    <b><%=proName%></b> <br/>

                    <b>Cost : <%=cost%></b> <br/>
                    <img src="<%=image%>" style="width: 163px;height: 77px;"/>
                    <br/>

                    <%
                        if (session.getAttribute("tou") != null) {
                            String tou = session.getAttribute("tou").toString();

                            if (tou.equals("productmanager")) {
                    %>


                    <a href="ViewFeedback.jsp?product_id=<%=fp.getProductId()%>">View Queries</a>




                    <%
                    } else  if (tou.equals("user")) {
                    %>

                    <a href="GiveFeedback.jsp?product_id=<%=fp.getProductId()%>"></a>
                    <a href="GiveFeedback.jsp?product_id=<%=fp.getProductId()%>">ASK Queries</a>
                    
                    




                    <%
                        }else  if (tou.equals("employee")) {
                    %>

                    <a href="GiveFeedback.jsp?product_id=<%=fp.getProductId()%>"></a>
                    <a href="ViewFeedback.jsp?product_id=<%=fp.getProductId()%>">View Queries</a>
                    
                    




                    <%
                        }
                    } else {

                    %>




                    <%                        }
                    %>

                </td>



                <%
                    if (row % 4 == 0) {
                %>

            </tr>
            <tr>
                <td colspan="4">
                    <hr color=""/>
                </td>
            </tr>

            <tr>


                <%                    }



                        row++;



                    }
                %>
            </tr> 
        </table>

        <%
        } else {
        %>



        <h1>No Product Available..! </h1>

        <%            }







        %>









    </div>
</div>
        <jsp:include page="inc/foot.jsp"/>