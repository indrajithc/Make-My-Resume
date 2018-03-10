<%@page import="details.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="includes.Connection, details.User"%>

 
<% 
	HttpSession httpSession = request.getSession();
	User user = (User)  httpSession.getAttribute("user");
	
	if(user == null) {
		//out.print(controller.Controller.returnPath (request)  + "/employerloginpage?referrer="+request.getRequestURL());
		response.sendRedirect( controller.Controller.returnPath (request)  + "/employerloginpage?referrer="+request.getRequestURL() );
		
	}  else if(!(user.getType().equals("employer"))){
		response.sendRedirect( controller.Controller.returnPath (request)  + "/"+ user.getType() );
		
	}
	
%>




	<%
	String userName = "";
	String userImage = "";
	String userEmail = "";
	String userMobile = "";
	
	if(user != null)   {
		 userName = user.getName();
		 userImage = "employer/images_/"+user.getImage();
		 userEmail = user.getEmail();
		 userMobile = user.getMobile();
	}
	

	

	%>		




<!DOCTYPE html>
<html>
<head>
 

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
	 

	<title><%= Connection.DISPLAYNAME %></title>

	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-touch-fullscreen" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="default">
	<base href="<%out.print(controller.Controller.returnPath (request));%>/">  



	<link rel="icon" type="image/png" sizes="32x32" href="<%out.print(controller.Controller.returnPath (request));%>/assets/img/favicon.png">



	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/css/lobibox.min.css">


	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome-animation.min.css">
					  <!--   faa-wrench animated  faa-wrench animated-hover  faa-wrench  // fa-spin //-->

 

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/bootstrap-sortable.css">

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/cropper.min.css">

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/datepicker.css" >
	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/select2.min.css">
 

	<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/css/lines.css" rel='stylesheet' type='text/css' />
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/js/jquery.min.js"></script>
<!----webfonts--->
<link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
<!---//webfonts--->  
<!-- Nav CSS -->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/css/custom.css" rel="stylesheet">
<!-- Metis Menu Plugin JavaScript -->
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/js/metisMenu.min.js"></script>
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/js/custom.js"></script>
<!-- Graph JavaScript -->
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/js/d3.v3.js"></script>
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/js/rickshaw.js"></script>



 



	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/style_002.css">



 


</head>
<body>
<div id="wrapper">
     <!-- Navigation -->
        <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Modern</a>
            </div>
            <!-- /.navbar-header -->
            <ul class="nav navbar-nav navbar-right">
				<li class="dropdown hidden">
	        		<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-comments-o"></i><span class="badge">4</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header">
							<strong>Messages</strong>
							<div class="progress thin">
							  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
							    <span class="sr-only">40% Complete (success)</span>
							  </div>
							</div>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/images/1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/images/2.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
								<span class="label label-info">NEW</span>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/images/3.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/images/4.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/images/5.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="avatar">
							<a href="#">
								<img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/images/pic1.png" alt=""/>
								<div>New message</div>
								<small>1 minute ago</small>
							</a>
						</li>
						<li class="dropdown-menu-footer text-center">
							<a href="#">View all messages</a>
						</li>	
	        		</ul>
	      		</li>
			    <li class="dropdown">
	        		<a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">
	        		<img  id="loged_in_image"   onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/images/default.png'" 
	        		src="<%out.print(controller.Controller.returnPath (request));%>/<% out.print(userImage);  %>">
	        		<span class="badge">9</span></a>
	        		<ul class="dropdown-menu">
						<li class="dropdown-menu-header text-center">
							<strong>Account</strong>
						</li>
						<li class="m_2 hidden"><a href="#"><i class="fa fa-bell-o"></i> Updates <span class="label label-info">42</span></a></li>
						<li class="m_2 hidden"><a href="#"><i class="fa fa-envelope-o"></i> Messages <span class="label label-success">42</span></a></li>
						<li class="m_2 hidden"><a href="#"><i class="fa fa-tasks"></i> Tasks <span class="label label-danger">42</span></a></li>
						<li class="hidden"><a href="#"><i class="fa fa-comments"></i> Comments <span class="label label-warning">42</span></a></li>
						<li class="m_2"><a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=profile"><i class="fa fa-user"></i> Profile</a></li>
						<li class="dropdown-menu-header text-center ">
							<strong>Settings</strong>
						</li>
						<li class="m_2 hidden"><a href="#"><i class="fa fa-wrench"></i> Settings</a></li>
						<li class="m_2 hidden"><a href="#"><i class="fa fa-usd"></i> Payments <span class="label label-default">42</span></a></li>
						<li class="m_2 hidden"><a href="#"><i class="fa fa-file"></i> Projects <span class="label label-primary">42</span></a></li>
						<li class="divider"></li>
						<li class="m_2 hidden"><a href="#"><i class="fa fa-shield"></i> Lock Profile</a></li>
						<li class="m_2"><a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=exit"><i class="fa fa-lock"></i> Logout</a></li>	
	        		</ul>
	      		</li>
			</ul>
			<form class="navbar-form navbar-right hidden">
              <input type="text" class="form-control" value="Search..." onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search...';}">
            </form>
            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=dashboard" ><i class="fa fa-dashboard fa-fw nav_icon"></i>Dashboard</a>
                        </li>
<!--                         <li> -->
<!--                             <a href="#"><i class="fa fa-laptop nav_icon"></i>Layouts<span class="fa arrow"></span></a> -->
<!--                             <ul class="nav nav-second-level"> -->
<!--                                 <li> -->
<!--                                     <a href="grids.html">Grid System</a> -->
<!--                                 </li> -->
<!--                             </ul> -->
<!--                             /.nav-second-level -->
<!--                         </li> -->
     <li>
         <a href="#"><i class="fa fa-indent nav_icon"></i>basic<span class="fa arrow"></span></a>
         <ul class="nav nav-second-level">
             <li>
                 <a class="text-capitalize" href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=skills">Skills</a>
             </li>
             <li>
                 <a class="text-capitalize" href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=competencies">Competencies</a>
             </li>
             <li>
                 <a class="text-capitalize" href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=education">Education</a>
             </li>
<!--              <li> -->
<!--                  <a href="typography.html">Typography</a> -->
<!--              </li> -->
         </ul>
         <!-- /.nav-second-level -->
     </li>
     
      <li>
          <a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=vacancies"><i class="fa fa-plus fa-fw nav_icon"></i>Vacancies</a>
      </li>
     
 
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        <div id="page-wrapper">
<!--   <h1 class="animated infinite bounce">Example</h1> -->


