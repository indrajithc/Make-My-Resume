<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	HttpSession authentication = request.getSession();
	authentication.invalidate();  
	response.sendRedirect( ""+controller.Controller.returnPath (request)+ "/employeeloginpage");

%>