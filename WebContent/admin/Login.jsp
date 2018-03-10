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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
<meta name="description"
	content="Robust admin is super flexible, powerful, clean &amp; modern responsive bootstrap 4 admin template with unlimited possibilities.">
<meta name="keywords"
	content="admin template, robust admin template, dashboard template, flat admin template, responsive admin template, web app">
<meta name="author" content="UIT2017">

<title><%= Connection.DISPLAYNAME %></title>


<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-touch-fullscreen" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="default">


<link rel="icon" type="image/png" sizes="32x32"
	href="<%out.print(controller.Controller.returnPath (request));%>/assets/img/favicon.png">





<link rel="stylesheet" href="<%out.print(controller.Controller.returnPath (request));%>/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%out.print(controller.Controller.returnPath (request));%>/assets/font-awesome/css/font-awesome-animation.min.css">
<!--   faa-wrench animated  faa-wrench animated-hover  faa-wrench  // fa-spin //-->



<style type="text/css">
body {
	background: rgba(234, 234, 234, 0.33);
}

#logbox {
	padding: 10px;
	margin: 50px auto;
	width: 340px;
	background-color: #fff;
	-webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	-moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	box-shadow: 0 1px 5px rgba(0, 0, 0, 0.25);
	border-top: 5px solid #33cccc;
}

h1 {
	text-align: center;
	font-size: 175%;
	color: #757575;
	font-weight: 300;
}

h1, input {
	font-family: "Open Sans", Helvetica, sans-serif;
}

.input {
	width: 85%;
	height: 50px;
	display: block;
	margin: 0 auto 5px;
	padding: 0 6px;
	border: none;
	border-bottom: 2px solid #ebebeb;
}

.input:focus {
	outline: none;
	border-bottom-color: #3CC !important;
}

.input:hover {
	border-bottom-color: #dcdcdc;
}

.input:invalid {
	box-shadow: none;
}

.pass:-webkit-autofill {
	-webkit-box-shadow: 0 0 0 1000px white inset;
}

.navbar-brand {
	font-size: xx-large;
	font-weight: bold;
	font-family: cursive;
}

.inputButton {
	position: relative;
	width: 85%;
	height: 40px;
	display: block;
	margin: 30px auto 30px;
	color: white;
	background-color: #3CC;
	border: none;
	-webkit-box-shadow: 0 5px 0 #2CADAD;
	-moz-box-shadow: 0 5px 0 #2CADAD;
	box-shadow: 0 5px 0 #2CADAD;
	border-radius: 0px !important;
}

.inputButton:hover {
	top: 2px;
	-webkit-box-shadow: 0 3px 0 #2CADAD;
	-moz-box-shadow: 0 3px 0 #2CADAD;
	box-shadow: 0 3px 0 #2CADAD;
}

.inputButton:active {
	top: 5px;
	box-shadow: none;
}

.inputButton:focus {
	outline: none;
}
</style>


<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery-1.11.3.min.js"></script>
</head>
<body>





	<div>
		<div class="container">
			<div class="row">
				<div class="col-md-offset-3 col-md-6">
					<div id="logbox">
						<form id="login-form" method="post" class="form-horizontal"
							<%= destination %>>
							<h1>Login</h1>
							<input type="email" name="email" id="email"
								placeholder="Email address" class="input pass" /> <input
								type="password" name="password" id="password"
								placeholder="Your password" class="input pass" /> <input
								type="submit" value="Login" class="btn btn- inputButton" />

						</form>
					</div>
				</div>
				<!--col-md-6-->

			</div>


		</div>
	</div>






	<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery.form.js"></script>




	<script type="text/javascript"
		src="<%out.print(controller.Controller.returnPath (request));%>/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery.validate.js"></script>

	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/js/lobibox.min.js"></script>

  
	
	 
	<script type="text/javascript" >
	$(document).ready ( function () {
		
		console.log ("jquery starts ");
		
		
		
		$("#login-form").validate({
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

				$("#login-form").find('input[type="submit"]').prop('disabled', true);
				
				$("#login-form").find('input[type="submit"]').css('cursor', 'waiting');
				
				$.post('controller',{action:'login',email:email, password: password},function(response){
					console.log(response); 
					if (response.success == -1) {
						if (!response.authentication) 
							window.location.replace(response.page+"?referrer="+response.to);
					} else if (response.success == 1) {
						// success code
						destination = $('#login-form').attr('destination');
						
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
			

					
					
				

					$("#login-form").find('input[type="submit"]').css('cursor', 'default');
					
					$("#login-form").find('input[type="submit"]').prop('disabled', false);
			
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

