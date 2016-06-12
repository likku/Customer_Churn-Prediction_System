<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@include  file="inc/head.jsp" %>
</head>
	<body>
		<div class="container">
                    
                    <%@include  file="inc/menubeforelogin.jsp" %>
                    
			<div class="row">
                            <%@include  file="inc/leftmenubeforelogin.jsp" %>
				<div class="span9">
					<h1>
						Dashboard
					</h1>
					<div class="hero-unit">
					
                                            
      




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

    <h2>Organization Registration here..!</h2>

    <div class="entry">

        <form id="contactForm" action="OrgRegAction.jsp" method="post">
            <div class="form setting">
            <%

                ArrayList list = new ArrayList();

                if (request.getParameter("packid") != null) {
                    int packId = Integer.parseInt(request.getParameter("packid"));
                    list = pack.Packages.get_SINGLE_PackagesData(packId);
                    if (list.size() > 0) {

                        Iterator it = list.iterator();
            %>

            <table  id="ver-zebra" >
                <tr>
                    <td colspan="3">
                        <a>Your Package Details</a>
                    </td>
                </tr>
                <%
                    while (it.hasNext()) {
                        tl.PackagesData sp = (tl.PackagesData) it.next();
                        String name;
                        int noOfEmployees, noOfTasks, cost, duration;
                        name = sp.getName();
                        noOfEmployees = sp.getNoOfEmployees();
                        noOfTasks = sp.getNoOfTasks();
                        cost = sp.getCost();
                        duration = sp.getDuration();
                %>



                <tr>
                    <th>Package Title</th>
                    <td><%=name%></td>
                    <th rowspan="4">
                        <input type="hidden" name="packid" value="<%=sp.getPackId()%>" />
                        <input type="hidden" name="duration" value="<%=duration%>" />
                        <a href="Packages.jsp" class="button">Change Package</a>
                    </th>
                </tr>
                <tr>
                    <th>Employees</th><td><%=noOfEmployees%></td>
                </tr>
                <tr>
                    <th>Tasks</th><td><%=noOfTasks%></td>
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

                }

            %>



<div class="form_settings">
            <table id="ver-zebra" summary="Most Favorite Movies">
                <tr><th colspan="2">

                        <%
                            if (request.getAttribute("msg") != null) {
                                String msg = request.getAttribute("msg").toString();
                        %>
                        <font color="green">
                        <%=msg%>
                        </font>

                        <%
                            }

                        %>

                    </th></tr>
                <tbody>
                <tbody>

                    <tr>
                        <td>Org Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Head Name</td>
                        <td><input type="text" name="hname" value="" /></td>
                    </tr>
                    <tr>
                        <td> Login ID</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" name="password" value="" /></td>
                    </tr>

                    <tr>
                        <td>Org Location</td>
                        <td><select name="orgloc">
                                <option value="">Select Location</option>
                                <option>Hyderabad</option>
                                <option>Chenni</option>
                                <option>Bangalore</option>
                                <option>Mumbai</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td> Mobile</td>
                        <td><input type="text" name="phno" value="" /></td>
                    </tr>
                    <tr>
                        <td> Address</td>
                        <td><textarea name="address" rows="4" cols="20"></textarea></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" name="btn" value="Register Me !" /></td>
                    </tr>
                </tbody>
            </table>
            </div>
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
            
            email:{
                required: true,
                email: true,
                remote: { url: "./validateEmail_2.jsp", async: false }
                       
        
            }, orgloc:{
                required:true  
            },address:{
                required:true  
            },
            name:{
                required: true
            },hname:{
                required: true,
                alpha: true
            },
            phno:{
                required: true,
                number: true,
                minlength:10,
                maxlength:10
            },
            password:{
                required: true,
                minlength:3,
                maxlength:100
            }
                   
        },
        messages:{
            
            email:{
                required: "Email ID is Required",
                email: "ex: xyz@domain.com",
                remote: "Already in Use"
            },
            password:{
                required: "Password is Required",
                minlength: "Atleast 3 Characters",
                maxlength: "100 Characters Only"
            }
        }
		
                
    });
            
    jQuery.validator.addMethod("alpha", function(value, element) {
        return this.optional(element) || value == value.match(/^[a-zA-Z ]+$/);
    },"Only Characters Allowed.");     
    
    
     
           
</script>

</div>
					<div class="well summary">
						<ul>
							<li>
								<a href="#"><span class="count">3</span> Projects</a>
							</li>
							<li>
								<a href="#"><span class="count">27</span> Tasks</a>
							</li>
							<li>
								<a href="#"><span class="count">7</span> Messages</a>
							</li>
							<li class="last">
								<a href="#"><span class="count">5</span> Files</a>
							</li>
						</ul>
					</div>
					<!--<h2>
						Recent Activity
					</h2>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>
									Project
								</th>
								<th>
									Client
								</th>
								<th>
									Type
								</th>
								<th>
									Date
								</th>
								<th>
									View
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									Nike.com Redesign
								</td>
								<td>
									Monsters Inc
								</td>
								<td>
									New Task
								</td>
								<td>
									4 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
							<tr>
								<td>
									Nike.com Redesign
								</td>
								<td>
									Monsters Inc
								</td>
								<td>
									New Message
								</td>
								<td>
									5 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
							<tr>
								<td>
									Nike.com Redesign
								</td>
								<td>
									Monsters Inc
								</td>
								<td>
									New Project
								</td>
								<td>
									5 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
							<tr>
								<td>
									Twitter Server Consulting
								</td>
								<td>
									Bad Robot
								</td>
								<td>
									New Task
								</td>
								<td>
									6 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
							<tr>
								<td>
									Childrens Book Illustration
								</td>
								<td>
									Evil Genius
								</td>
								<td>
									New Message
								</td>
								<td>
									9 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
							<tr>
								<td>
									Twitter Server Consulting
								</td>
								<td>
									Bad Robot
								</td>
								<td>
									New Task
								</td>
								<td>
									16 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
							<tr>
								<td>
									Twitter Server Consulting
								</td>
								<td>
									Bad Robot
								</td>
								<td>
									New Project
								</td>
								<td>
									16 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
							<tr>
								<td>
									Twitter Server Proposal
								</td>
								<td>
									Bad Robot
								</td>
								<td>
									Completed Project
								</td>
								<td>
									20 days ago
								</td>
								<td>
									<a href="#" class="view-link">View</a>
								</td>
							</tr>
						</tbody>
					</table>-->
					<ul class="pager">
						<li class="next">
							<a href="activity.htm">More &rarr;</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
                    <%@include  file="inc/footer.jsp"%>
	</body>
</html>





















