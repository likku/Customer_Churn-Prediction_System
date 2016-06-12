
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
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
                <td>
                    <%
                        if (session.getAttribute("tou") != null) {
                            String tou = session.getAttribute("tou").toString();

                            if (tou.equals("user")) {
                    %>

                    <h2>Ask queries</h2>
                    <form action="GiveFeedbackAction.jsp" method="POST">
                        <input type="hidden" name="product_id" value="<%=product_id%>" />
                        <textarea style="margin: 0px; width: 424px; height: 116px;" name="feedbackdata" rows="4" cols="20"></textarea> 
                        <br/>
                        <h2> Rating :
                            <input type="radio" name="rating" value="1" />1
                            <input type="radio" name="rating" value="2" />2
                            <input type="radio" name="rating" value="3" />3
                            <input type="radio" name="rating" value="4" />4
                            <input type="radio" name="rating" value="5" />5
                        </h2>
                        <input type="submit" value="submit" />
                    </form>


                    <%
                        }
                    } else {

                    %>


                    <a href="userlogin.jsp"></a>
                    <a href="ViewFeedback.jsp?product_id=<%=fp.getProductId()%>">View Query</a>


                    <%

                        }
                    %>



                </td>
            </tr>         <tr>
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
                    <h2>Product Question Data</h2>  
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <%

                        String emailid = "";// session.getAttribute("emailid").toString();
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
                                emailid = ji.getGivenby();
                                int rating = ji.getRating();


                                DateFormat formatter = new SimpleDateFormat("MM/dd/yyyy hh:mm:ss a");
                                Calendar lCDateTime = Calendar.getInstance();
                                lCDateTime.setTimeInMillis(dateTime_1);
                        %>

                        <tr>
                            <td>
                                <%=feedbackData%>
                                <p style="float: right;"> <b><%=formatter.format(lCDateTime.getTime())%></b></p>
                                <br/>
                                <h5>   
                                    <%
                                        //   for (int ii = 1; ii <= rating; ii++) {




                                        ji.getFId();
                                    %>


                                    <%
                                        if (rating == 1) {

                                    %>Text Based Query<%                                                } else if (rating == 2) {
                                    %>Image Based Query<%                                                } else if (rating == 3) {
                                    %>Video Based Query<%                                                    }


                                    %>





                                    <%



                                        out.print("By:" + emailid);

                                        ArrayList l2 = new ArrayList();



                                        String sql = "SELECT * FROM `answersdata` WHERE `questionid`=" + ji.getFId() + "";
                                        Connection con = DAO.DB.DBConnection();
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery(sql);




//out.print("111111111111111111111111"+ji.getFId());
                                        // l2 = DAO.MyDao.view_answer_by_Question(ji.getFId());

                                        if (rs.next()) {
                                            // if (l2.size() > 0) {
                                    %>

                                    <a target="_blank" href="View_answer_by_employee.jsp?choicevalue=<%=ji.getRating()%>&product_id=<%=ji.getFId()%>"><font color="green">View Answer</font></a>

                                    <%
                                    } else {

                                        if (session.getAttribute("tou").equals("employee")) {

                                    %>

                                    ///
                                    <a href="giveanswer.jsp?fid=<%=ji.getFId()%>&choicevalue=<%=ji.getRating()%>&pid=<%=ji.getProdictId()%>&userid=<%=ji.getGivenby()%>">Give Answer</a>
                                    ///

                                    <%
                                    } else if (session.getAttribute("tou").equals("user")) {

                                    %>

                                    Wait For Answer


                                    <%                                        }
                                        }

                                    %>
                                </h5>
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



                    <h1>No Feedback Available by you..! </h1>

                    <%            }
                    %>
                </td>
            </tr>
            <%
                }
            %>

        </table>

        <%        } else {
        %>



        <h1>No Product Available..! </h1>

        <%            }


        %>





    </div>
</div>
<jsp:include page="inc/foot.jsp"/>