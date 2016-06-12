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

    <h2>Add Packages here..!</h2>
    <div class="entry">

        <form id="contactForm" action="CreatePackage" method="post">
            <table id="ver-zebra" summary="Most Favorite Movies"> 



                <tbody>
                    <tr>
                        <td>Package Title</td>
                        <td><input type="text" name="title" value="" /></td>
                    </tr>
                    <tr>
                        <td>Features One</td>
                        <td><input type="text" name="featuresone" value="" placeholder="Enter Number of Employees!" />
                        </td>
                    </tr>
                    <tr>
                        <td>Features Two</td>
                        <td><input type="text" name="featurestwo" value="" placeholder="Enter Number of products" />
                        </td>
                    </tr>

                    <tr>
                        <td>Cost</td>
                        <td><input type="text" name="cost" value="" /></td>
                    </tr>
                    <tr>
                        <td>Limit Days</td>
                        <td><input type="text" name="days" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="" value="Add Pachage" /></td>
                    </tr>
                </tbody>
            </table>


        </form>

        </form>
    </div>
</div>

<br />
<br />

</body>
</html>

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

<%
    if (request.getAttribute("corrmsg") != null) {
        String h = request.getAttribute("corrmsg").toString();
        out.print(h);
    }
    if (request.getAttribute("wrongmsg") != null) {
        String h = request.getAttribute("wrongmsg").toString();
        out.print(h);
    }



    ArrayList list = new ArrayList();


    list = pack.Packages.getPackagesData();
    if (list.size() > 0) {

        Iterator it = list.iterator();
%>

<table  id="ver-zebra" >
    <thead>
        <tr>
            <th>Package Title</th>
            <th>Employees</th>
            <th>Products</th>
            <th>Cost</th>
            <th>Limit Days</th>
        </tr>
    </thead>
    <tbody>
        <%
            while (it.hasNext()) {
                fs.PackagesData sp = (fs.PackagesData) it.next();
                String title;
                int featurestwo, featuresone;
                int cost, days;
                title = sp.getName();
                featuresone = sp.getNoOfEmployees();
                featurestwo = sp.getNoOfTasks();
                cost = sp.getCost();
                days = sp.getDuration();
        %>

        <tr>
            <td><%= title%></td>
            <td><%=featuresone%></td>
            <td><%=featurestwo%></td>
            <td><%= cost%></td>
            <td><%= days%></td>

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