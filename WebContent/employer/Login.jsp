<%@page import="includes.Connection"%>
<%@include file="../starup.jsp" %>


<% 
	HttpSession httpSession = request.getSession();
	details.User user = (details.User)  httpSession.getAttribute("user");
	 
	if(user != null) {
		String type =  user.getType();
		response.sendRedirect( controller.Controller.returnPath (request) + "/" + type + "/" );
		return;
	}
	
%>


<%
	String destination = request.getParameter("referrer");
	if(destination ==null || destination.equals(""))
		destination = "";
	else 
		destination = "destination='" + request.getParameter("referrer") + "'";
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
<body id="login">
  <div class="login-logo">
    <a href="index.html"><img src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/images/logo.png" alt=""/></a>
  </div>
  <h2 class="form-heading">login</h2>
  <div class="app-cam">
	  <form id="employer-login" 
							<%= destination %>>
		<input name="email" id="email" type="text" class="text" value="E-mail address" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'E-mail address';}">
		<input name="password" id="password" type="password" value="Password" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Password';}">
		<div class="submit"><input type="submit"   value="Login"></div>
		 
		<ul class="new">
			<li class="new_left"><p><a href="#">Forgot Password ?</a></p></li>
			<li class="new_right"><p class="sign">New here ?<a href="employerRegisterpage"> Sign Up</a></p></li>
			<div class="clearfix"></div>
		</ul>
	</form>
  </div>
   <div class="copy_layout login">
      <p>Copyright &copy; 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
   </div>
    
	<script  src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery.form.js"></script>

	<script  src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/moment.min.js"></script>



    <script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a1/js/bootstrap.min.js"></script>
 



<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/select2.full.min.js"></script> 

 
    
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/bootstrap-sortable.js"></script>

    


    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/js/messageboxes.min.js"></script>
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/js/notifications.min.js"></script>
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/js/lobibox.min.js"></script>

    
	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/bootstrap-datepicker.min.js"></script>
    <script  src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/cropper.min.js"></script>
      
    
  

 
	
	 
	<script type="text/javascript" >
	$(document).ready ( function () {
		
		console.log ("jquery starts ");
		
		
		
		$("#employer-login").validate({
			rules: {
				password: {
					required: true,
					minlength: 5
				}, 
				email: {
					required: true,
					email: true
				}
			},
			messages: { 
				password: {
					required: "Please provide a password",
					minlength: "Your password must be at least 5 characters long"
				},
				email: "Please enter a valid email address"
			},
			submitHandler: function(form, event){
				email = $('#email').val();
				password = $('#password').val();
				
				
				console.log(email +""+ password); 

				$("#employer-login").find('input[type="submit"]').prop('disabled', true);
				
				$("#employer-login").find('input[type="submit"]').css('cursor', 'waiting');
				
				$.post('controller',{action:'employer-login',email:email, password: password},function(response){
					console.log(response); 
					if (response.success == -1) {
						if (!response.authentication) 
							window.location.replace(response.page+"?referrer="+response.to);
					} else if (response.success == 1) {
						// success code
						destination = $('#employer-login').attr('destination');
						
						urlExists(destination, function(exists){
							if(exists && destination !=null)
								window.location.replace(destination);
							else
								window.location.replace(response.url);
							})
							
							
						 
						
					}else if (response.success == 0) {
						// success code
						
						
						alert(response.error);
						
						
						
					} else {
						// anything elz
					}
			

					
					
				

					$("#employer-login").find('input[type="submit"]').css('cursor', 'default');
					
					$("#employer-login").find('input[type="submit"]').prop('disabled', false);
			
				});	 
				
				 return false;
				
			}
				
		});
		
		
		
		
		
		
		
		
		

		/*=======================================================================================================*/
		/*=======================================================================================================*/
		function urlExists(url, callback){
			  $.ajax({
			    type: 'HEAD',
			    url: url,
			    success: function(){
			      callback(true);
			    },
			    error: function() {
			      callback(false);
			    }
			  });
			}
		
//		var exists = urlExists(url);
	//	
//		urlExists(url, function(exists){
//		  //do more stuff based on the boolean value of exists
//		});

		/*=======================================================================================================*/
		/*=======================================================================================================*/
		
	});
	</script>

</body>
</html>

