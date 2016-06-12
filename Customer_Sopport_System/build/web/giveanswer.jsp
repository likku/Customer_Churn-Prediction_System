<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>


<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->



        <script src="./js/jquery-1.9.1.min.js"></script>
        <script src="./js/jquery.validate.js"></script>
        <script src="./js/additional-methods.js"></script>
        <style>

            input,select { border: 1px solid black; margin-bottom: .5em;  }
            input.error { border: 1px solid red; margin-bottom: .5em; }
            select.error { border: 1px solid red; margin-bottom: .5em; }
            label.error {
                background: url('images/unchecked.gif') no-repeat;
                padding-left: 10px;
                margin-left: .3em;
            }

            label.valid {
                background: url('images/checked.gif') no-repeat;
                display: block;
                width: 16px;
                height: 16px;
            }
        </style>
        <%
            if (request.getParameter("choicevalue").equals("1")) {
        %><h2>Enter Text Based Answer Here!!!!</h2><%    }

            if (request.getParameter("choicevalue").equals("2")) {
        %><h2>Enter Image Based Answer Here!!!!</h2><%    }
            if (request.getParameter("choicevalue").equals("3")) {
        %><h2>Enter Video Based Answer Here!!!!</h2><%    }
        %>


        <%

            if (request.getParameter("fid") != null && request.getParameter("choicevalue") != null) {

                int fid = Integer.parseInt(request.getParameter("fid"));
                int value = Integer.parseInt(request.getParameter("choicevalue"));
                int pid = Integer.parseInt(request.getParameter("pid"));
                String userid = request.getParameter("userid");


                /*  out.print(fid);
                out.print(value);
                out.print(pid);
                out.print(userid);
                
                 */
                if (value == 1) {

        %>
        <div class="entry">

            <form id="contactForm" action="giveanswerAction.jsp" method="post">
                <table id="ver-zebra" summary="Most Favorite Movies"> 



                    <tbody>
                        <tr>
                            <td>Enter Answer:</td>
                            <td><textarea name="answer" rows="4" cols="20"style="margin: 0px; width: 635px; height: 217px;"></textarea>
                                <input type="hidden" name="fid" value="<%=request.getParameter("fid")%>"></td>
                    <input type="hidden" name="choicevalue" value="<%=request.getParameter("choicevalue")%>"></td>
                    <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>"></td>
                    <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"></td>

                    </tr>

                    <td></td>
                    <td><input type="submit" name="" value="Send Answer" /></td>
                    </tr>
                    </tbody>
                </table>


            </form>

        </div>
    </div>


    <%

    } else if (value == 2) {
    %>

    <div class="entry">

        <form id="contactForm" action="giveanswerImage.jsp" method="post" enctype="multipart/form-data">
            <table id="ver-zebra" summary="Most Favorite Movies"> 



                <tbody>
                    <tr>
                        <td>Select Image</td>
                        <td><input type="file" name="uploadfile"></input>
                            <input type="hidden" name="fid" value="<%=request.getParameter("fid")%>"></td>
                <input type="hidden" name="choicevalue" value="<%=request.getParameter("choicevalue")%>"></td>
                <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>"></td>
                <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"></td>
                </tr>

                <td></td>
                <td><input type="submit" name="" value="Send Answer" /></td>
                </tr>
                </tbody>
            </table>


        </form>

    </div>

    <%
    } else if (value == 3) {
    %>

    <div class="entry">

        <form id="contactForm" action="giveanswerImage_1.jsp" method="post" enctype="multipart/form-data">
            <table id="ver-zebra" summary="Most Favorite Movies"> 



                <tbody>
                    <tr>
                        <td>Select Video</td>
                        <td><input type="file" name="uploadfile"></input>
                            <input type="hidden" name="fid" value="<%=request.getParameter("fid")%>"></td>
                <input type="hidden" name="choicevalue" value="<%=request.getParameter("choicevalue")%>"></td>
                <input type="hidden" name="pid" value="<%=request.getParameter("pid")%>"></td>
                <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"></td>
                </tr>

                <td></td>
                <td><input type="submit" name="" value="Send Answer" /></td>
                </tr>
                </tbody>
            </table>


        </form>

        </form>
    </div>


    <%
            }


        }



    %>



    <script>
   

        $( "#contactForm" ).validate({
        
            rules:{
            
                title:{
                    required: true
                
                       
        
                },
                featuresone:{
                    required: true
               
                },featurestwo:{
                    required: true
               
                },
                cost:{
                    required:true,
                    number: true,
                    alpha: true
                
                
                },
                days:{
                    required:true ,
                    number: true
                }
            
                   
            }
		
                
        });
            
        jQuery.validator.addMethod("alpha", function(value, element) {
            return this.optional(element) || value == value.match(/^[1-9]+$/);
        },"Only 1-9 Allowed.");   
    </script>


</center>
<jsp:include page="inc/foot.jsp"/>