
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.StringTokenizer"%>
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->
        <%



            if (request.getAttribute("msg") != null) {
                String err = request.getAttribute("msg").toString();

        %>
        <font color="green">
        <%=err%>
        </font>

        <%                    }
        %>




        <%
            int product_id = 0;
            ArrayList l = new ArrayList();

            product_id = Integer.parseInt(request.getParameter("product_id"));


            l = pro.Products.get_Products_by_product_id(product_id);

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



            <%
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


                    dateTime = fp.getDateTime();



            %>


            <tr>

                <td>
                    <b><%=proName%></b> <br/>

                    <b>Cost : <%=cost%></b> <br/>
                    <img src="<%=image%>" style="width: 391px;height: 222px;"/>

                </td>
                   <%
                 if (session.getAttribute("tou") != null) {
                            String tou = session.getAttribute("tou").toString();

                            if (tou.equals("user")) {
                    %>
                <td>
                    <h2>Ask Query</h2>
                    <form action="GiveFeedbackAction.jsp" method="POST">
                        <input type="hidden" name="product_id" value="<%=product_id%>" />
                        <textarea style="margin: 0px; width: 424px; height: 116px;" name="feedbackdata" rows="4" cols="20"></textarea> 
                        <br/><br>
                        <select name="choicevalue">
                            <option value="">Select YOur Choice</option>
                            <option value="1">Text Based</option>
                            <option value="2">Image Based</option>
                            <option value="3">Video Based</option>
                        </select><br><br>

                        <input type="submit" value="submit" />
                    </form>


                </td>
            </tr>    <%
                    }}

                    %>      <tr>
                <td colspan="2">


                    <%
                        for (StringTokenizer stringTokenizer = new StringTokenizer(details, "\n"); stringTokenizer.hasMoreTokens();) {
                            String token = stringTokenizer.nextToken();
                            out.print(token + "<br/>");
                        }

                    %>


                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <hr color=""/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <h2>Questions Data</h2>  
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%

                        String emailid = session.getAttribute("emailid").toString();
                        ArrayList ll = new ArrayList();




                        ll = pro.Products.get_Product_fb_data_by_product_id(product_id, emailid);
                        if (ll.size() > 0) {
                    %>

                    <table>
                        <%

                            Iterator it = ll.iterator();
                            while (it.hasNext()) {

                                fs.FeedbackData ji =
                                        (fs.FeedbackData) it.next();


                                long dateTime_1 = Long.parseLong(ji.getDateTime());
                                String feedbackData = ji.getFeedbackData();
                                int rating = ji.getRating();


                                DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");
                                Calendar lCDateTime = Calendar.getInstance();
                                lCDateTime.setTimeInMillis(dateTime_1);
                        %>

                        <tr>
                            <td>
                                <%=feedbackData%>
                                BY <%=ji.getGivenby()%>
                                <p style="float: right;"> <b><%=formatter.format(lCDateTime.getTime())%></b></p>
                                <br/>


                                <h3>


                                    <%

                                        for (int ii = 1; ii <= rating; ii++) {



                                            if (rating == 1) {
                                                
                                                %>Text Based Query<%
                                            }else if(rating==2)
                                                                                               {
                                                %>Image Based Query<%
                                            }else if(rating==3)
                                                                                               {
                                                %>Video Based Query<%
                                            }

                                    %>





                                    <%   }
                                    %>
                               
                                    <a href="giveanswer.jsp?fid=<%=ji.getFId()%>&choicevalue=<%=ji.getRating()%>&pid=<%=ji.getProdictId()%>&userid=<%=ji.getGivenby()%>"></a>
                                
                                </h3>
                                <hr color="red"/>
                            </td>
                        </tr>



                        <%

                            }

                        %>
                    </table>
                    <%



                    } else {
                    %>



                    <h1>No Queries are Available by you..! </h1>

                    <%            }
                    %>
                </td>
            </tr>

            <%
                }
            %>

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