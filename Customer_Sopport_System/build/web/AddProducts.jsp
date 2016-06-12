
<jsp:include page="inc/head.jsp"/>
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->

        <script src="./js/jquery-1.9.1.min.js"></script>
        <script src="./js/jquery.validate.js"></script>
        <script src="./js/additional-methods.js"></script>
        <style>

            input { border: 1px solid black; margin-bottom: .5em;  }
            input.error { border: 1px solid red; margin-bottom: .5em; }
            label.error {
                background: url('images/unchecked.gif') no-repeat;
                padding-left: 16px;
                margin-left: .3em;
            }

            label.valid {
                background: url('images/checked.gif') no-repeat;
                display: block;
                width: 16px;
                height: 16px;
            }
        </style>

        <form id="contactForm" action="AddProducts" enctype="multipart/form-data" method="post">
            <h2>Adding Product</h2>
            <table  summary="Most Favorite Movies">
                <tr><td colspan="2">

                        <%
                            if (request.getAttribute("msg") != null) {
                                String msg = request.getAttribute("msg").toString();
                        %>
                        <font color="blue">
                        <%=msg%>
                        </font>

                        <%
                            }

                        %>

                    </td></tr>
                <tbody>
                <tbody>
                    <tr>
                        <td> Product Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Product Image</td>
                        <td><input type="file" name="pimage" value="" /></td>
                    </tr>
                    <tr>
                        <td>Cost</td>
                        <td><input type="text" name="cost" value="" /></td>
                    </tr>
                    <tr>
                        <td>
                            Description
                        </td>
                        <td>
                            <textarea name="description" rows="4" cols="20"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="btn" value="Add Product" /></td>
                    </tr>
                    
                </tbody>
            </table>
        </form>

    </div>
</div>


<script>
   

    $( "#contactForm" ).validate({
        
        rules:{
            name:{
                required: true
               
            },pimage:{
                required: true
                
            },cost:{
                required:true  
            },
            description:{
                required: true
                       
        
            }
            
                   
        }
		
                
    });
               
    jQuery.validator.addMethod("alpha", function(value, element) {
        return this.optional(element) || value == value.match(/^[0-9a-zA-Z ]+$/);
    },"Only Characters Allowed.");    
           
</script>
<jsp:include page="inc/foot.jsp"/>