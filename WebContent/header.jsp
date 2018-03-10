<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="includes.Connection, details.User"%>

<%@include file="starup.jsp" %>
 

 





<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%= Connection.DISPLAYNAME %></title>

	<link rel="icon" type="image/png"   href="<%out.print(controller.Controller.returnPath (request));%>/assets/img/favicon-32x32.png">
	
	
	<link rel="stylesheet" type="text/css" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/style_000.css">
	
</head>
<body>

