<%@page import="org.apache.catalina.core.ApplicationContext"%>

<%@include file="header.jsp" %>

	
	 <%
 
	 	 

		RequestDispatcher dispatcher = request.getRequestDispatcher("loginpage");
		dispatcher.forward(request, response);
	

	
	%>



<%@include file="footer.jsp"%> 	