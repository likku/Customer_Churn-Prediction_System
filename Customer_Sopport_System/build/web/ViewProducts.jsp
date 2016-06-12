
<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">




        <%
            String pmid = "";
            if (session.getAttribute("emailid") != null) {
                pmid = session.getAttribute("emailid").toString();
            } else {
                pmid = session.getAttribute("semail").toString();
            }

            //  String pmid = session.getAttribute("emailid").toString();


            ArrayList l = new ArrayList();
            l = pro.Products.get_PM_Products(pmid);
            //out.print(l); 
            if (l.size() > 0) {

                Iterator i = l.iterator();
        %>



        <h1>Uploaded Products by you .....!</h1>
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
            </tr>
            <tr>
                <td>


                    <%
                        for (StringTokenizer stringTokenizer = new StringTokenizer(details, "\n"); stringTokenizer.hasMoreTokens();) {
                            String token = stringTokenizer.nextToken();
                            out.print(token + "<br/>");
                        }


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



        <h1>No Product Available..! Uploaded by you ?</h1>

        <%            }







        %>



    </div>
</div>
<jsp:include page="inc/foot.jsp"/>