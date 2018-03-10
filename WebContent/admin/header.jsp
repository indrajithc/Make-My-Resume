<%@page import="details.User"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="includes.Connection, details.User"%>

 
<% 
	HttpSession httpSession = request.getSession();
	User user = (User)  httpSession.getAttribute("user");
	
	if(user == null) {
		response.sendRedirect( controller.Controller.returnPath (request)  + "/adminloginpage?referrer="+request.getRequestURL() );
		
	} 
	
%>




	<%
	String userName = "";
	String userImage = "";
	String userEmail = "";
	String userMobile = "";
	
	if(user != null)   {
		 userName = user.getName();
		 userImage = "admin/images_/"+user.getImage();
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



	<link rel="stylesheet prefetch" href="<%out.print(controller.Controller.returnPath (request));%>/assets/theme/css/AdminLTE.css">
	<link rel="stylesheet prefetch" href="<%out.print(controller.Controller.returnPath (request));%>/assets/theme/css/skin-black-light.css">
	
	
	<link rel="stylesheet prefetch" href="<%out.print(controller.Controller.returnPath (request));%>/assets/theme/css/animate.min.css">



	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/css/lobibox.min.css">


	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/bootstrap/css/bootstrap.min.css" >
	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome-animation.min.css">
					  <!--   faa-wrench animated  faa-wrench animated-hover  faa-wrench  // fa-spin //-->

 

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/bootstrap-sortable.css">

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/cropper.min.css">

	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/datepicker.css" >
	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/select2.min.css">
 


	<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/css/style_001.css">




	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery-1.11.3.min.js"></script>
</head>







<body class="skin-black-light sidebar-mini" style="height: auto;">


<div class="wrapper" style="height: auto;">
    <header class="main-header">


        <a href="#" class="logo">
            <span class="logo-mini"><b>t</b>TH</span>
            <span class="logo-lg"><b>Tech</b>TEACH</span>
        </a>

        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <li class="dropdown messages-menu">
                        <a href="#" class="dropdown-toggle subicon-animated" data-toggle="dropdown">
                            <i class="fa fa-envelope-o"></i>
                            <span class="label label-success">4</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 4 messages</li>
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <div class="pull-left">
                                                <img  src="<% out.print(userImage); %>"  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/img/user001.png'"  class="img-circle" id="loged_in_image" alt="User Image">
                                            </div>
                                            <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                                            <p>Why not buy a new awesome theme?</p>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">See All Messages</a></li>
                        </ul>
                    </li>

                    <li class="dropdown notifications-menu">
                        <a href="#" class="dropdown-toggle subicon-animated" data-toggle="dropdown">
                            <i class="fa fa-bell-o"></i>
                            <span class="label label-warning">10</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 10 notifications</li>
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <i class="fa fa-users text-aqua"></i> 5 new members joined today
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer"><a href="#">View all</a></li>
                        </ul>
                    </li>
                    <li class="dropdown tasks-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <i class="fa fa-flag-o"></i>
                            <span class="label label-danger">9</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="header">You have 9 tasks</li>
                            <li>
                                <ul class="menu">
                                    <li>
                                        <a href="#">
                                            <h3>
						                        Design some buttons
						                        <small class="pull-right">20%</small>
						                      </h3>
                                            <div class="progress xs">
                                                <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                    <span class="sr-only">20% Complete</span>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <li class="footer">
                                <a href="#">View all tasks</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
<img src="<% out.print(userImage); %>"  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/img/user001.png'" class="user-image" alt="User Image">
                            <span class="hidden-xs"><% out.print(userName); %></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-header">
                                <img src="<% out.print(userImage); %>"  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/img/user001.png'"  class="img-circle" alt="User Image">
                                <p>
                                    <% out.print(userName); %>
                                    <small><% out.print(userEmail); %></small>
                                </p>
                            </li>
                            <li class="user-body">
<!--                                 <div class="col-xs-4 text-center"> -->
<!--                                     <a href="#">Followers</a> -->
<!--                                 </div> -->
<!--                                 <div class="col-xs-4 text-center"> -->
<!--                                     <a href="#">Sales</a> -->
<!--                                 </div> -->
<!--                                 <div class="col-xs-4 text-center"> -->
<!--                                     <a href="#">Friends</a> -->
<!--                                 </div> -->
                            </li>
                            <li class="user-footer">
                                <div class="pull-left">
                                    <a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=profile"  class="btn btn-default btn-flat">Profile</a>
                                </div>
                                <div class="pull-right">
                                    <a href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=quit" class="btn btn-default btn-flat quit-me-h">Sign out</a>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>





    <aside class="main-sidebar">
        <section class="sidebar">

            <div class="user-panel">
                <div class="pull-left image">
                    <img src="<% out.print(userImage); %>"  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/img/user001.png'"  class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p><% out.print(userName); %></p>
                    <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
                </div>
            </div>

            <form action="#" method="get" class="sidebar-form">
                <div class="input-group">
                    <input name="q" class="form-control" placeholder="Search..." type="text">
                    <span class="input-group-btn">
            <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i></button>
          </span>
                </div>
            </form>





            <ul class="sidebar-menu my-menu">
                <li class="header">HEADER</li>

                <li class="active"> 
                	<a href=" <%= controller.Controller.returnPath (request) + "/" %>controller?page=dashboard" title="Admin Dashboard">
                        <i class="fa fa-tv"></i>
                        <span>Dashboard</span>
                     </a>
                </li>
                
                <li class=" ">
                	<a href=" <%= controller.Controller.returnPath (request) + "/" %>controller?page=department" title="department">
                        <i class="fa fa-braille" aria-hidden="true"></i>
                        <span class="text-capitalize">department</span>
                     </a>
                </li>


                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>Job</span> <span class="fa fa-angle-left pull-right"></span></a>
                    <ul class="treeview-menu">
                        <li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=job-category">Category</a></li>
                        <li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=job">Job</a></li>
                    </ul>
                </li>                
                

                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>language</span> <span class="fa fa-angle-left pull-right"></span></a>
                    <ul class="treeview-menu">
                        <li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=language-category">Category</a></li>
                        <li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=language">language</a></li>
                    </ul>
                </li>                
                
                <li class="treeview">
                    <a href="#"><i class="fa fa-link"></i> <span>employer</span> <span class="fa fa-angle-left pull-right"></span></a>
                    <ul class="treeview-menu">
                        <li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=employer">Employer</a></li>
                        <li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=skills">Skills</a></li>
                    	<li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=competencies">Competencies</a></li>
                    	<li><a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=education">Education</a></li>
                    </ul>
                </li>                
                
                
                
<!--                 <li class=""> -->
<%--                 	<a href=" <%= controller.Controller.returnPath (request) + "/" %>controller?page=about" title="Admin About"> --%>
<!--                         <i class="fa fa-info"></i> -->
<!--                         <span>About</span> -->
<!--                      </a> -->
<!--                 </li> -->
                
                 
<!--                 <li class=" "> -->
<%--                 	<a href=" <%= controller.Controller.returnPath (request) + "/" %>controller?page=form" title="Form"> --%>
<!--                         <i class="fa fa-fort-awesome" aria-hidden="true"></i> -->
<!--                         <span>From</span> -->
<!--                      </a> -->
<!--                 </li> -->
                
<!--                 <li class=" "> -->
<%--                 	<a href=" <%= controller.Controller.returnPath (request) + "/" %>controller?page=category" title="category"> --%>
<!--                         <i class="fa fa-braille" aria-hidden="true"></i> -->
<!--                         <span>Category</span> -->
<!--                      </a> -->
<!--                 </li> -->
                
                 
<!--                 <li><a href="#"><i class="fa fa-link"></i> <span>Another Link</span></a></li> -->
<!--                 <li class="treeview"> -->
<!--                     <a href="#"><i class="fa fa-link"></i> <span>Multilevel</span> <span class="fa fa-angle-left pull-right"></span></a> -->
<!--                     <ul class="treeview-menu"> -->
<!--                         <li><a href="#">Link in level 2</a></li> -->
<!--                         <li><a href="#">Link in level 2</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->
                
                
                
                
                
                
                
                
                
                
                
            </ul>




 

        </section>
    </aside>




        <div class="content-wrapper" style="min-height: 300px;">
        
        
        


<!--   <h1 class="animated infinite bounce">Example</h1> -->


