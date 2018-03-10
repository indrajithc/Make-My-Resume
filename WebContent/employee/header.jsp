<%@page import="details.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="includes.Connection, details.User"%>

 
<% 
	HttpSession httpSession = request.getSession();
	User user = (User)  httpSession.getAttribute("user");
	
	if(user == null) {
		//out.print(controller.Controller.returnPath (request)  + "/employerloginpage?referrer="+request.getRequestURL());
		response.sendRedirect( controller.Controller.returnPath (request)  + "/employeeloginpage?referrer="+request.getRequestURL() );
		
	} else if(!(user.getType().equals("employee"))){
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
		 userImage = "employee/images_/"+user.getImage();
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
	<meta name="description" content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
	<meta name="keywords" content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
	<meta name="author" content="UIT2017">

	<title><%= Connection.DISPLAYNAME %></title>

	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-touch-fullscreen" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="default">
	<base href="<%out.print(controller.Controller.returnPath (request));%>/">  



	<link rel="icon" type="image/png" sizes="32x32" href="<%out.print(controller.Controller.returnPath (request));%>/assets/img/favicon.png">





<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<!-- lined-icons -->
<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->


	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/css/lobibox.min.css">

 
<%-- 	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome.min.css"> --%>
<%-- 	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome-animation.min.css"> --%>
<!-- 					    faa-wrench animated  faa-wrench animated-hover  faa-wrench  // fa-spin // -->

 

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/bootstrap-sortable.css">

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/cropper.min.css">

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/datepicker.css" >
	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/select2.min.css">
 




	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/style_003.css">



	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery-1.11.3.min.js"></script>


<!-- chart -->
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/Chart.js"></script>
<!-- //chart -->
<!--animate-->
<link href="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
<!----webfonts--->
<link href='//fonts.googleapis.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic' rel='stylesheet' type='text/css'>
<!---//webfonts---> 
 <!-- Meters graphs -->
<%-- <script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/jquery-1.10.2.min.js"></script> --%>
<!-- Placed js at the end of the document so the pages load faster -->

</head> 
   
 <body class="sticky-header left-side-collapsed"  onload=" ">
    <section>
    <!-- left side start-->
		<div class="left-side sticky-left-side">

			<!--logo and iconic logo start-->
			<div class="logo">
			</div>
			<div class="logo-icon text-center">
				<a href="."><i class="lnr lnr-home"></i> </a>
			</div>

			<!--logo and iconic logo end-->
			<div class="left-side-inner">

				<!--sidebar nav start-->
					<ul class="nav nav-pills nav-stacked custom-nav">
						<li class="active"><a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=dashboard"><i class="lnr lnr-power-switch"></i><span>Dashboard</span></a></li>
					  
						<li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=resume"><i class="lnr lnr-menu"></i> <span>Resume</span></a></li>              
						<li class="menu-list"><a href="#"><i class="lnr lnr-envelope"></i> <span>MailBox</span></a>
							<ul class="sub-menu-list">
								<li class="hidden"><a href="inbox.html">Inbox</a> </li>
								<li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=toadmin">To Admin</a></li>
							</ul>
						</li>   
						
						<li><a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=newsletter"><i class="lnr lnr-spell-check"></i> <span>Newsletter</span></a></li>    
						
						<li><a href="<%= controller.Controller.returnPath (request) + "/employee/" %>job.jsp"><i class="lnr lnr-pencil"></i> <span>Job</span></a></li>    



<!-- 						<li class="menu-list"><a href="#"><i class="lnr lnr-book"></i>  <span>Pages</span></a>  -->
<!-- 							<ul class="sub-menu-list"> -->
<!-- 								<li><a href="sign-in.html">Sign In</a> </li> -->
<!-- 								<li><a href="sign-up.html">Sign Up</a></li> -->
<!-- 								<li><a href="blank_page.html">Blank Page</a></li> -->
<!-- 							</ul> -->
<!-- 						</li> -->
					</ul>
				<!--sidebar nav end-->
			</div>
		</div>
		<!-- left side end-->
    
		<!-- main content start-->
		<div class="main-content">
			<!-- header-starts -->
			<div class="header-section">
			 
			<!--toggle button start-->
			<a class="toggle-btn  menu-collapsed"><i class="fa fa-bars"></i></a>
			<!--toggle button end-->

			<!--notification menu start -->
			<div class="menu-right">
				<div class="user-panel-top">  	
					<div class="profile_details_left">
						<ul class="nofitications-dropdown hidden">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-envelope"></i><span class="badge">3</span></a>
									
										<ul class="dropdown-menu">
											<li>
												<div class="notification_header">
													<h3>You have 3 new messages</h3>
												</div>
											</li>
											<li><a href="#">
											   <div class="user_img"><img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/images/1.png" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor sit amet</p>
												<p><span>1 hour ago</span></p>
												</div>
											   <div class="clearfix"></div>	
											 </a></li>
											 <li class="odd"><a href="#">
												<div class="user_img"><img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/images/1.png" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor sit amet </p>
												<p><span>1 hour ago</span></p>
												</div>
											  <div class="clearfix"></div>	
											 </a></li>
											<li><a href="#">
											   <div class="user_img"><img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/images/1.png" alt=""></div>
											   <div class="notification_desc">
												<p>Lorem ipsum dolor sit amet </p>
												<p><span>1 hour ago</span></p>
												</div>
											   <div class="clearfix"></div>	
											</a></li>
											<li>
												<div class="notification_bottom">
													<a href="#">See all messages</a>
												</div> 
											</li>
										</ul>
							</li>
							<li class="login_box" id="loginContainer">
									<div class="search-box">
										<div id="sb-search" class="sb-search">
											<form>
												<input class="sb-search-input" placeholder="Enter your search term..." type="search" id="search">
												<input class="sb-search-submit" type="submit" value="">
												<span class="sb-icon-search"> </span>
											</form>
										</div>
									</div>
										<!-- search-scripts -->
										<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/classie.js"></script>
										<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/uisearch.js"></script>
											<script>
												new UISearch( document.getElementById( 'sb-search' ) );
											</script>
										<!-- //search-scripts -->
							</li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell"></i><span class="badge blue">3</span></a>
									<ul class="dropdown-menu">
										<li>
											<div class="notification_header">
												<h3>You have 3 new notification</h3>
											</div>
										</li>
										<li><a href="#">
											<div class="user_img"><img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/images/1.png" alt=""></div>
										   <div class="notification_desc">
											<p>Lorem ipsum dolor sit amet</p>
											<p><span>1 hour ago</span></p>
											</div>
										  <div class="clearfix"></div>	
										 </a></li>
										 <li class="odd"><a href="#">
											<div class="user_img"><img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/images/1.png" alt=""></div>
										   <div class="notification_desc">
											<p>Lorem ipsum dolor sit amet </p>
											<p><span>1 hour ago</span></p>
											</div>
										   <div class="clearfix"></div>	
										 </a></li>
										 <li><a href="#">
											<div class="user_img"><img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/images/1.png" alt=""></div>
										   <div class="notification_desc">
											<p>Lorem ipsum dolor sit amet </p>
											<p><span>1 hour ago</span></p>
											</div>
										   <div class="clearfix"></div>	
										 </a></li>
										 <li>
											<div class="notification_bottom">
												<a href="#">See all notification</a>
											</div> 
										</li>
									</ul>
							</li>	
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-tasks"></i><span class="badge blue1">22</span></a>
									<ul class="dropdown-menu">
										<li>
											<div class="notification_header">
												<h3>You have 8 pending task</h3>
											</div>
										</li>
										<li><a href="#">
												<div class="task-info">
												<span class="task-desc">Database update</span><span class="percentage">40%</span>
												<div class="clearfix"></div>	
											   </div>
												<div class="progress progress-striped active">
												 <div class="bar yellow" style="width:40%;"></div>
											</div>
										</a></li>
										<li><a href="#">
											<div class="task-info">
												<span class="task-desc">Dashboard done</span><span class="percentage">90%</span>
											   <div class="clearfix"></div>	
											</div>
										   
											<div class="progress progress-striped active">
												 <div class="bar green" style="width:90%;"></div>
											</div>
										</a></li>
										<li><a href="#">
											<div class="task-info">
												<span class="task-desc">Mobile App</span><span class="percentage">33%</span>
												<div class="clearfix"></div>	
											</div>
										   <div class="progress progress-striped active">
												 <div class="bar red" style="width: 33%;"></div>
											</div>
										</a></li>
										<li><a href="#">
											<div class="task-info">
												<span class="task-desc">Issues fixed</span><span class="percentage">80%</span>
											   <div class="clearfix"></div>	
											</div>
											<div class="progress progress-striped active">
												 <div class="bar  blue" style="width: 80%;"></div>
											</div>
										</a></li>
										<li>
											<div class="notification_bottom">
												<a href="#">See all pending task</a>
											</div> 
										</li>
									</ul>
							</li>		   							   		
							<div class="clearfix"></div>	
						</ul>
					</div>
					<div class="profile_details">		
						<ul>
							<li class="dropdown profile_details_drop">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
									<div class="profile_img">	
										<span  id="loged_in_image"  
										  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/images/default.png'" 
	        		src="<%out.print(controller.Controller.returnPath (request));%>/<% out.print(userImage);%>" 
	        		  style="background:url('<%out.print(controller.Controller.returnPath (request));%>/<% out.print(userImage);%>') no-repeat center ;  background-size: 40px 40px;  background-repeat: no-repeat;"> </span> 
										 <div class="user-name">
											<p><% out.print(userName);%><span>Employee</span></p>
										 </div>
										 <i class="lnr lnr-chevron-down"></i>
										 <i class="lnr lnr-chevron-up"></i>
										<div class="clearfix"></div>	
									</div>	
								</a>
								<ul class="dropdown-menu drp-mnu">
									<li> <a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=basic"><i class="fa fa-cog"></i> Basic</a> </li> 
									<li> <a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=profile"><i class="fa fa-user"></i>Profile</a> </li> 
									<li> <a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=exit"><i class="fa fa-sign-out"></i> Logout</a> </li>
								</ul>
							</li>
							<div class="clearfix"> </div>
						</ul>
					</div>		
					<div class="social_icons hidden">
						<div class="col-md-4 social_icons-left">
							<a href="#" class="yui"><i class="fa fa-facebook i1"></i><span>300<sup>+</sup> Likes</span></a>
						</div>
						<div class="col-md-4 social_icons-left pinterest">
							<a href="#"><i class="fa fa-google-plus i1"></i><span>500<sup>+</sup> Shares</span></a>
						</div>
						<div class="col-md-4 social_icons-left twi">
							<a href="#"><i class="fa fa-twitter i1"></i><span>500<sup>+</sup> Tweets</span></a>
						</div>
						<div class="clearfix"> </div>
					</div>            	
					<div class="clearfix"></div>
				</div>
			  </div>
			<!--notification menu end -->
			</div>
						
		<!-- //header-ends -->
			<div id="page-wrapper">
			
			
			
			