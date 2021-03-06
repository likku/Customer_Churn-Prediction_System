<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Flot Pie Charts</title>
        <link href="examples.css" rel="stylesheet" type="text/css">
        <style type="text/css">

            .demo-container {
                position: relative;
                height: 400px;
            }

            #placeholder {
                width: 550px;
            }

            #menu {
                position: absolute;
                top: 20px;
                left: 625px;
                bottom: 20px;
                right: 20px;
                width: 200px;
            }

            #menu button {
                display: inline-block;
                width: 200px;
                padding: 3px 0 2px 0;
                margin-bottom: 4px;
                background: #eee;
                border: 1px solid #999;
                border-radius: 2px;
                font-size: 16px;
                -o-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
                -ms-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
                -moz-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
                -webkit-box-shadow: 0 1px 2px rgba(0,0,0,0.15);
                box-shadow: 0 1px 2px rgba(0,0,0,0.15);
                cursor: pointer;
            }

            #description {
                margin: 15px 10px 20px 10px;
            }

            #code {
                display: block;
                width: 870px;
                padding: 15px;
                margin: 10px auto;
                border: 1px dashed #999;
                background-color: #f8f8f8;
                font-size: 16px;
                line-height: 20px;
                color: #666;
            }

            ul {
                font-size: 10pt;
            }

            ul li {
                margin-bottom: 0.5em;
            }

            ul.options li {
                list-style: none;
                margin-bottom: 1em;
            }

            ul li i {
                color: #999;
            }

        </style>
        <!--[if lte IE 8]><script language="javascript" type="text/javascript" src="../../excanvas.min.js"></script><![endif]-->
        <script language="javascript" type="text/javascript" src="jquery.js"></script>
        <script language="javascript" type="text/javascript" src="jquery.flot.js"></script>
        <script language="javascript" type="text/javascript" src="jquery.flot.pie.js"></script>
        <script type="text/javascript">
            <%

                String orghead = request.getParameter("id");

                ArrayList<String> emp_names = new ArrayList<String>();
                ArrayList<Integer> emp_counts = new ArrayList<Integer>();

                ResultSet totalusers = j.ClassName.get_TOTAL_CUSTOMERS(orghead);
                while (totalusers.next()) {
                    emp_names.add(totalusers.getString(8));
                    emp_counts.add(j.ClassName.get_TOTAL_CUSTOMERS1(orghead,totalusers.getString(8)));
                }
                out.print(emp_counts);






                String data1 = null, series1, label1;
                int i = 0;


            %>

                $(function() {
                    var data = [];
                
            <%
                int k = 0;
                while (k < emp_names.size()) {
                    data1 = emp_names.get(k);
                    series1 = emp_names.get(k);
                    label1 = "" + emp_counts.get(k);

            %>
                    data[<%=k%>] ={label:"<%=data1%>", data:"<%=label1%>"};   
            <%
                    k++;
                }

            %>
        
        
     


	

                    var placeholder = $("#placeholder");

                    $("#example-1").click(function() {

                        placeholder.unbind();

                        $("#title").text("Default pie chart");
                        $("#description").text("The default pie chart with no options set.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true
                                }
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true",
                            "        }",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-2").click(function() {

                        placeholder.unbind();

                        $("#title").text("Default without legend");
                        $("#description").text("The default pie chart when the legend is disabled. Since the labels would normally be outside the container, the chart is resized to fit.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-3").click(function() {

                        placeholder.unbind();

                        $("#title").text("Custom Label Formatter");
                        $("#description").text("Added a semi-transparent background to the labels and a custom labelFormatter function.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    radius: 1,
                                    label: {
                                        show: true,
                                        radius: 1,
                                        formatter: labelFormatter,
                                        background: {
                                            opacity: 0.8
                                        }
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true,",
                            "            radius: 1,",
                            "            label: {",
                            "                show: true,",
                            "                radius: 1,",
                            "                formatter: labelFormatter,",
                            "                background: {",
                            "                    opacity: 0.8",
                            "                }",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-4").click(function() {

                        placeholder.unbind();

                        $("#title").text("Label Radius");
                        $("#description").text("Slightly more transparent label backgrounds and adjusted the radius values to place them within the pie.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    radius: 1,
                                    label: {
                                        show: true,
                                        radius: 3/4,
                                        formatter: labelFormatter,
                                        background: {
                                            opacity: 0.5
                                        }
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true,",
                            "            radius: 1,",
                            "            label: {",
                            "                show: true,",
                            "                radius: 3/4,",
                            "                formatter: labelFormatter,",
                            "                background: {",
                            "                    opacity: 0.5",
                            "                }",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-5").click(function() {

                        placeholder.unbind();

                        $("#title").text("Label Styles #1");
                        $("#description").text("Semi-transparent, black-colored label background.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    radius: 1,
                                    label: {
                                        show: true,
                                        radius: 3/4,
                                        formatter: labelFormatter,
                                        background: { 
                                            opacity: 0.5,
                                            color: "#000"
                                        }
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: { ",
                            "            show: true,",
                            "            radius: 1,",
                            "            label: {",
                            "                show: true,",
                            "                radius: 3/4,",
                            "                formatter: labelFormatter,",
                            "                background: { ",
                            "                    opacity: 0.5,",
                            "                    color: '#000'",
                            "                }",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-6").click(function() {

                        placeholder.unbind();

                        $("#title").text("Label Styles #2");
                        $("#description").text("Semi-transparent, black-colored label background placed at pie edge.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    radius: 3/4,
                                    label: {
                                        show: true,
                                        radius: 3/4,
                                        formatter: labelFormatter,
                                        background: { 
                                            opacity: 0.5,
                                            color: "#000"
                                        }
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true,",
                            "            radius: 3/4,",
                            "            label: {",
                            "                show: true,",
                            "                radius: 3/4,",
                            "                formatter: labelFormatter,",
                            "                background: {",
                            "                    opacity: 0.5,",
                            "                    color: '#000'",
                            "                }",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-7").click(function() {

                        placeholder.unbind();

                        $("#title").text("Hidden Labels");
                        $("#description").text("Labels can be hidden if the slice is less than a given percentage of the pie (10% in this case).");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    radius: 1,
                                    label: {
                                        show: true,
                                        radius: 2/3,
                                        formatter: labelFormatter,
                                        threshold: 0.1
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true,",
                            "            radius: 1,",
                            "            label: {",
                            "                show: true,",
                            "                radius: 2/3,",
                            "                formatter: labelFormatter,",
                            "                threshold: 0.1",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-8").click(function() {

                        placeholder.unbind();

                        $("#title").text("Combined Slice");
                        $("#description").text("Multiple slices less than a given percentage (5% in this case) of the pie can be combined into a single, larger slice.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    combine: {
                                        color: "#999",
                                        threshold: 0.05
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true,",
                            "            combine: {",
                            "                color: '#999',",
                            "                threshold: 0.1",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-9").click(function() {

                        placeholder.unbind();

                        $("#title").text("Rectangular Pie");
                        $("#description").text("The radius can also be set to a specific size (even larger than the container itself).");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    radius: 500,
                                    label: {
                                        show: true,
                                        formatter: labelFormatter,
                                        threshold: 0.1
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true,",
                            "            radius: 500,",
                            "            label: {",
                            "                show: true,",
                            "                formatter: labelFormatter,",
                            "                threshold: 0.1",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-10").click(function() {

                        placeholder.unbind();

                        $("#title").text("Tilted Pie");
                        $("#description").text("The pie can be tilted at an angle.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true,
                                    radius: 1,
                                    tilt: 0.5,
                                    label: {
                                        show: true,
                                        radius: 1,
                                        formatter: labelFormatter,
                                        background: {
                                            opacity: 0.8
                                        }
                                    },
                                    combine: {
                                        color: "#999",
                                        threshold: 0.1
                                    }
                                }
                            },
                            legend: {
                                show: false
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true,",
                            "            radius: 1,",
                            "            tilt: 0.5,",
                            "            label: {",
                            "                show: true,",
                            "                radius: 1,",
                            "                formatter: labelFormatter,",
                            "                background: {",
                            "                    opacity: 0.8",
                            "                }",
                            "            },",
                            "            combine: {",
                            "                color: '#999',",
                            "                threshold: 0.1",
                            "            }",
                            "        }",
                            "    },",
                            "    legend: {",
                            "        show: false",
                            "    }",
                            "});",
                        ]);
                    });

                    $("#example-11").click(function() {

                        placeholder.unbind();

                        $("#title").text("Donut Hole");
                        $("#description").text("A donut hole can be added.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    innerRadius: 0.5,
                                    show: true
                                }
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            innerRadius: 0.5,",
                            "            show: true",
                            "        }",
                            "    }",
                            "});"
                        ]);
                    });

                    $("#example-12").click(function() {

                        placeholder.unbind();

                        $("#title").text("Interactivity");
                        $("#description").text("The pie can be made interactive with hover and click events.");

                        $.plot(placeholder, data, {
                            series: {
                                pie: { 
                                    show: true
                                }
                            },
                            grid: {
                                hoverable: true,
                                clickable: true
                            }
                        });

                        setCode([
                            "$.plot('#placeholder', data, {",
                            "    series: {",
                            "        pie: {",
                            "            show: true",
                            "        }",
                            "    },",
                            "    grid: {",
                            "        hoverable: true,",
                            "        clickable: true",
                            "    }",
                            "});"
                        ]);

                        placeholder.bind("plothover", function(event, pos, obj) {

                            if (!obj) {
                                return;
                            }

                            var percent = parseFloat(obj.series.percent).toFixed(2);
                            $("#hover").html("<span style='font-weight:bold; color:" + obj.series.color + "'>" + obj.series.label + " (" + percent + "%)</span>");
                        });

                        placeholder.bind("plotclick", function(event, pos, obj) {

                            if (!obj) {
                                return;
                            }

                            percent = parseFloat(obj.series.percent).toFixed(2);
                            alert(""  + obj.series.label + ": " + percent + "%");
                        });
                    });

                    // Show the initial default chart

                    $("#example-1").click();

                    // Add the Flot version string to the footer

                    $("#footer").prepend("Flot " + $.plot.version + " &ndash; ");
                });
                    
  

                // A custom label formatter used by several of the plots

                function labelFormatter(label, series) {
                    return "<div style='font-size:8pt; text-align:center; padding:2px; color:white;'>" + label + "<br/>" + Math.round(series.percent) + "%</div>";
                }

                //

                function setCode(lines) {
                    $("#code").text(lines.join("\n"));
                }

        </script>
    </head>
    <body>

        <div id="header">
            <h2>Chart For Tasks</h2>
        </div>

        <div id="content">

            <h3 id="title"></h3>
            <div class="demo-container">
                <div id="placeholder" class="demo-placeholder"></div>
                <div id="menu">
                    <button id="example-1">Default Options</button>
                    <button id="example-2">Without Legend</button>
                    <button id="example-3">Label Formatter</button>
                    <button id="example-4">Label Radius</button>
                    <button id="example-5">Label Styles #1</button>
                    <button id="example-6">Label Styles #2</button>
                    <button id="example-7">Hidden Labels</button>
                    <button id="example-8">Combined Slice</button>
                    <button id="example-9">Rectangular Pie</button>
                    <button id="example-10">Tilted Pie</button>
                    <button id="example-11">Donut Hole</button>
                    <button id="example-12">Interactivity</button>
                </div>
            </div>


        </div>


    </body>
</html>
