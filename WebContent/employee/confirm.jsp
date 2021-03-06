

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



<%
	String message = request.getParameter("confirm");
 
	if(message ==null || message.equals(""))
		message = "success";
	else if(new String("0").equals(message))
		message = "error";
	else
		message =  request.getParameter("confirm");
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
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/jquery-1.10.2.min.js"></script>
<!-- Placed js at the end of the document so the pages load faster -->
<style type="text/css">
	.error {
     padding: 0em 0px 0em 0;
}
</style>
</head> 
   
 <body class="sticky-header left-side-collapsed"  onload=" ">
    <section>
    <div id="page-wrapper" class="sign-in-wrapper">
				<div class="graphs">
					<div class="sign-up">
 <%

	if(message == "error"){
  		out.print(" <div class='alert alert-warning alert-dismissible' role='alert'>" +
				  " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>' "+
  				  " <span aria-hidden='true'>&times;</span></button> " +
  				  " <strong>Warning!</strong> Better check yourself or connect to admin, you're not looking too good." +
  				  " " +
  				  " " +
  				  " " +
  				  " " +
  				  " " +
  				  " " +
  				  "  </div>" +
  				  " " +
  				  " " +
  				  " " + 
  				  " " +
  				  " ");
  	} else if(message == "success"){
  		out.print("<div class='alert alert-success alert-dismissible' role='alert'> " +
				  " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>'" +
  				  " <span aria-hidden='true'>&times;</span></button>" +
  				  " <strong>Success!</strong> need to confirm your email address before you can login" +
  				  " " +
  				  " " +
  				  " " +
  				  " " +
  				  " " +
  				  " " +
  				  " " +
  				  "</div> " +
  				  " " + 
  				  " ");
  	} else {
  		
  		
  		includes.Connection con = new includes.Connection();
  		
  		String email = "";
  		boolean issuccess = false;
  		
  		String query = " SELECT * FROM `temp_verification` WHERE user='employee' AND delete_status = 0 AND code='" + message + "' ORDER BY date DESC ";
  		 
  	 
  				
  				try {
  					 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
  					 
  					while(rs.next()) {  
  						email =  rs.getString("email"); 
  					}
  					 


  			  		
  		con = new includes.Connection();
				
		query = " UPDATE `employee` SET `login` = ? WHERE username = ? AND delete_status = 0  ";
		
		Object[]  vo = new Object[2];
				vo[0] = "1";
				vo[1] = email; 
		
				
				try {
					int result =   con.execute(query , vo );
	 
					if(result != 0){ 
						con = new includes.Connection();
						
						query = " UPDATE `temp_verification` SET `delete_status` = ? WHERE email = ? AND delete_status = 0  ";
						
					 			 vo = new Object[2];
								vo[0] = "1";
								vo[1] = email; 
						
								
								try {
									result =   con.execute(query , vo );
					
									if(result != 0){ 
										
										if(email.length() > 0)
											issuccess = true;
										
										
										
									}
					
					
					 
								} catch (Exception e) {
									System.out.println(e.getMessage()); 
								}
				  		
						
						
					}
	
	
	 
				} catch (Exception e) {
					System.out.println(e.getMessage()); 
				}
  		
  		
					rs.close();
					con.preparedStatement.close (); 
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
				

  				
  				
  		if(issuccess) {
  			out.print("<div class='alert alert-success alert-dismissible' role='alert'> " +
  				  " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>'" +
    				  " <span aria-hidden='true'>&times;</span></button>" +
    				  " <strong>Success!</strong> email verification successful. <a href='employeeloginpage'> login here!</a>" +
    				  " " +
    				  " " +
    				  " " +
    				  " " +
    				  " " +
    				  " " +
    				  " " +
    				  "</div> " +
    				  " " + 
    				  " ");
  			
  			
  			
  			
  		} else {
  			
  			out.print(" <div class='alert alert-warning alert-dismissible' role='alert'>" +
  				  " <button type='button' class='close' data-dismiss='alert' aria-label='Close'>' "+
    				  " <span aria-hidden='true'>&times;</span></button> " +
    				  " <strong>Warning!</strong>  Timeout error shows <br/> better connect to admin, you're not looking good." +
    				  " " +
    				  " " +
    				  " " +
    				  " " +
    				  " " +
    				  " " +
    				  "  </div>" +
    				  " " +
    				  " " +
    				  " " + 
    				  " " +
    				  " ");
  			
  			
  			
  			
  		}
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  				
  		
  	}
  
  
  
  
  
  %>
  
  	<p>
  	
  	</p>
	  <form>
		

	</form>

</div>
</div>
</div>

		<!--footer section start-->
			<footer>
			   <p>&copy 2015 Easy Admin Panel. All Rights Reserved | Design by <a href="https://u.com/" target="_blank">u.</a></p>
			</footer>
        <!--footer section end-->
    
    
    
    
    
    </section>
  

 
    
	<script  src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery.form.js"></script>

	<script  src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/moment.min.js"></script>


  
<!-- Bootstrap Core JavaScript -->
 



	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/jquery.validate.js"></script>
	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/select2.full.min.js"></script> 

 
    
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/bootstrap-switch.min.js"></script>
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/bootstrap-sortable.js"></script>

    


    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/js/messageboxes.min.js"></script>
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/js/notifications.min.js"></script>
    <script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/lobibox/js/lobibox.min.js"></script>

    
	<script type="text/javascript" src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/bootstrap-datepicker.min.js"></script>
    <script  src="<%out.print(controller.Controller.returnPath (request));%>/assets/js/cropper.min.js"></script>
      
      
      
      
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/jquery.nicescroll.js"></script>
<script src="<%out.print(controller.Controller.returnPath (request));%>/assets/a2/js/scripts.js"></script>




 	 
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






















