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
			
			$(this).find(':input[type="submit"]').prop('disabled', true);
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
		

				
				
			

			$(this).find(':input[type="submit"]').prop('disabled', false);
		
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
	
//	var exists = urlExists(url);
//	
//	urlExists(url, function(exists){
//	  //do more stuff based on the boolean value of exists
//	});

	/*=======================================================================================================*/
	/*=======================================================================================================*/
	
});