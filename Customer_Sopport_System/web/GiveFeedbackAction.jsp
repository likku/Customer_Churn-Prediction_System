<%@page import="java.util.Calendar"%>
<%

    int rating = 0, product_id = 0;



    product_id = Integer.parseInt(request.getParameter("product_id"));
    rating = Integer.parseInt(request.getParameter("choicevalue"));
    String feedbackdata = null;

    feedbackdata = request.getParameter("feedbackdata");

    Calendar lCDateTime = Calendar.getInstance();
    String dateTime = "" + lCDateTime.getTimeInMillis();

    String emailid = session.getAttribute("emailid").toString();

    String ins = fb.FeedBack.add_feedback_details(product_id, dateTime, feedbackdata, rating, emailid);
    if ("ok".equals(ins)) {
       
        //out.print("question sent successfully"); 
        
        
        
         RequestDispatcher rd = request.getRequestDispatcher("GiveFeedback.jsp?product_id=" + product_id);
     request.setAttribute("msg", "Feedback Added Success");
     rd.forward(request, response);
    } else {
      
   //out.print("question not sent successfully");



      RequestDispatcher rd = request.getRequestDispatcher("GiveFeedback.jsp?product_id=" + product_id);
   request.setAttribute("msg", ins+"Check");
   rd.forward(request, response);
    }



%>