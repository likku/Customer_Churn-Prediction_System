<!DOCTYPE HTML>
<html>

    <head>
        <title>Customer Chrun Prediction</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <!-- modernizr enables HTML5 elements and feature detects -->
        <script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    </head>

    <body>

        <div id="main">
            <div id="top_container">
                <header>
                    <div id="logo"><h1><a href="index.jsp">Customer Chrun Prediction</a> </h1></div>
                    <nav>
                        <ul class="lavaLampWithImage" id="lava_menu">

                            <%
                                if (session.getAttribute("tou") != null) {
                                    String tou = session.getAttribute("tou").toString();
                                    if (tou.equals("admin")) {
                            %>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="createpackage.jsp">Create Package</a></li>
                            <li><a href="Companies.jsp">Companies</a></li>


                            <li><a href="logout.jsp">Logout</a></li>
                            <%                        } else if (tou.equals("chead")) {
                            %>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="PMreg.jsp?tou=productmanager">Product Manager Reg</a></li>
                            <li><a href="PMreg.jsp?tou=employee">Employee Registration</a></li>
                            <%-- --%> <li><a target="_blank" href="picchart_1.jsp">Chart Anylasys</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                            <%                        } else if (tou.equals("productmanager")) {
                            %>
                            <li><a href="index.jsp">Home</a></li>
                            <li><a href="AddProducts.jsp">Add Products</a> </li>
                            <li><a href="ViewProducts.jsp">View Products</a> </li>
                            <li><a href="ProfileDetails.jsp">Profile Details</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                            <%                        } else if (tou.equals("employee")) {

                            %>
                            <li><a href="index.jsp">Employee Home</a></li>
                            <%--  <li><a href="ViewProducts.jsp">View Products</a> </li>--%>
                            <li><a href="ProfileDetails.jsp">Profile Details</a></li>



                            <li><a href="logout.jsp">Logout</a></li>





                            <%                        } else if (tou.equals("user")) {
                            %>
                            <li><a href="index.jsp">Home</a></li>
                            <%--  <li><a href="View_answer_by_employee.jsp">View Answer</a></li>--%>
                            <li><a href="ProfileDetails.jsp">Profile Details</a></li>
                            <li><a href="logout.jsp">Logout</a></li>
                            <%                            }

                            } else {

                            %>
                            <li><a href="adminlogin_1.jsp">Admin</a></li>
                            <li><a href="adminlogin.jsp">Company</a></li>
                            <li><a href="Packages.jsp">Reg company</a></li>
                            <li><a href="pmlogin.jsp?tou=productmanager">PM Login</a></li>
                            <li><a href="pmlogin.jsp?tou=employee">Employee</a></li>
                            <li><a href="userlogin.jsp">User Login</a></li>
                            <li><a href="userreg.jsp">User</a></li>

                            <% }%>
                        </ul>
                    </nav>
                </header>


                <div class="strapline_container">	  
                    <div class="strapline">
                        <h2><% if (session.getAttribute("tou") != null) {
                                String tou = session.getAttribute("tou").toString();
                                out.print(tou);
                                if (tou.equals("admin")) {
                            %>
                            Admin  Panel
                            <%                        } else if (tou.equals("productmanager")) {
                            %>
                            Product Manager   Panel
                            <%                        } else if (tou.equals("user")) {
                            %>
                            User  Panel
                            <%                            }
                            } else {

                            %>
                            Home Page
                            <%             }%></h2>
                    </div>
                </div>











































                </h1>
            </div>
        </div>
        <div id="menubar">
            <ul id="menu">
                <!-- put class="selected" in the li tag for the selected page - to highlight which page you're on -->

            </ul>
        </div>
    </div>