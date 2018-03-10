<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="includes.Connection, details.User"%>

<jsp:useBean id="server" class="details.Server" scope="application"></jsp:useBean>
<% 
	server.setServer(request);
	ServletContext context = request.getServletContext();
	context.setAttribute("server", server);	
	
	String SERVER = "" + server.getServerProtocol() + "://"
			+ server.getServerName() + ":"
			+ server.getServerPort() + ""
			+ server.getContextPath() + "";
	
	 
%>


 