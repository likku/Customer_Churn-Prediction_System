<%@page import="java.util.StringTokenizer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<jsp:include page="inc/head.jsp"/>



 <div id="site_content">
     
      <div id="content">
       
    
<div id="site_content">
    <!--  right here  -->
    <div id="content">
        <!-- insert the page content here -->
        
        
        
         <h2>Available Packages here..!</h2>
        
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





        .button {
            display: inline-block;
            vertical-align: top;
            position: relative;
            padding: 0 15px 0 15px;
            line-height: 35px;
            font-size: 12px;
            font-weight: bold;
            color: white;
            text-align: center;
            text-transform: uppercase;
            text-decoration: none;
            text-shadow: 0 -1px rgba(0, 0, 0, 0.5);
            background: #576DCE;
            background-clip: padding-box;
            border: 1px solid;
            border-color: #374FBB #344CB3 #2B3E94;
            border-radius: 2px;
            -webkit-font-smoothing: antialiased;
        }


    </style>




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
<center>
<table  id="ver-zebra" >

    <%
        while (it.hasNext()) {
            fs.PackagesData sp = (fs.PackagesData) it.next();
            String name;
            int noOfEmployees, noOfproducts, cost, duration;
            name = sp.getName();
            noOfEmployees = sp.getNoOfEmployees();
            noOfproducts = sp.getNoOfTasks();
            cost = sp.getCost();
            duration = sp.getDuration();
    %>


   
    <tr>
        <th>Package Title</th>
        <td><%=name%></td>
       
        <th rowspan="4"> <%
    
  String paypal_url = "https://www.sandbox.paypal.com/cgi-bin/webscr";
            String paypal_id = "test.sattvaq@inbox.com";  // sriniv_1293527277_biz@inbox.com 


%>
    
    
                    <div class="btn">
                        <form action="<%=paypal_url%>" method='post' name='frmPayPal1'>
                            <input type='hidden' name='business' value="<%=paypal_id%>">
                            <input type='hidden' name='cmd' value='_xclick'>
                            <input type='hidden' name='item_number' value="<%=sp.getPackId()%>">
                            <input type='hidden' name='amount' value="<%= cost%>">
                            <input type='hidden' name='no_shipping' value='1'>
                            <input type='hidden' name='transactionid' value='1'>
                            <input type='hidden' name='currency_code' value="">
                            <input type='hidden' name='handling' value='0'>
                            <input type='hidden' name='cancel_return' value='http://localhost:8084/Customer_Chrun_Prediction/cancel.jsp'>
                            <input type='hidden' name='return' value='http://localhost:8084/Customer_Chrun_Prediction/Company_HeadRegJS.jsp?&packid=<%=sp.getPackId()%>&noofemplpyees=<%=noOfEmployees%>&noofproducts=<%=noOfproducts%>&cost=<%=cost%>&duration=<%=duration%>&packname=<%=name%>'>
                            <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
                            <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1">
                        </form> 
                    </div>  

        </th>
    </tr>
    <tr>
        <th>Employees</th><td><%=noOfEmployees%></td>
    </tr>
    <tr>
        <th>Tasks</th><td><%=noOfproducts%></td>
    </tr>
    <tr>
        <th>Cost</th>
        <td><%= cost%></td>
    </tr>
    <tr>
        <th>Limit Days</th><td><%=duration%></td>
    </tr>



    <tr>
        <td colspan="3">
            <hr color="red"/>
        </td>
    </tr>



   


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    



    <%
        }
    %>    </table><%
    } else {

    %>

<h2>
    <a href=""> No Packages Are Available </a>
</h2>


<%    }
%>


</center>
<jsp:include page="inc/foot.jsp"/>