
<%@include file="header.jsp"%>


<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  if( user != null) {
	
	%>

<h2>
	<%= user.getEmail() %>
</h2>


<%} %>



<%@include file="footer.jsp"%>
