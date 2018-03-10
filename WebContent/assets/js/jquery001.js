$(document).ready ( function () { 
	console.log(" om on ! ha hhaa ;) ");
	
	
	
	
	

	/*=========================================================================================================*/
	/*=========================================================================================================*/
  
  
	// for x o function
	$.validator.setDefaults({
	    highlight: function(element) {
	        $(element).closest('.form-group').addClass('has-error');
	        $(element).parent('div').children('.glyphicon.glyphicon-remove.form-control-feedback').css('display', 'block');
	        form_status (   element,   3,   null); //----------->
	    },
	    unhighlight: function(element) {
	        $(element).closest('.form-group').removeClass('has-error');
	        $(element).parent('div').children('.glyphicon.glyphicon-remove.form-control-feedback').css('display', 'none');
	        form_status (   element,   1,   null);//----------->
	    }, 
	    errorElement: 'span',
	    errorClass: 'help-block',
	    errorPlacement: function(error, element) {
	    	
	        if(element.parent('.input-group').length) {
	            error.insertAfter(element.parent()); $(element).parent('div').prepend($('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'));
	        } else {
	            error.insertAfter(element);
	            $(element).parent('div').prepend($('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'));
	        }
	        form_status (   element,   3,   null);//----------->
	    }
	});
	
	// for x o function >> form_status (   this,   1,   "success");	
	  function form_status ( diz,   clazz1,   mzg) {
		   console.log(  clazz1,   mzg);
		    var parent_ = $(diz).parent('div');
		    var parent_base = $(parent_).closest('.form-group');
		    var msg = null;
		    msg = $(parent_).children('.help-block-new')[0];

		    if(msg == null)
		    	$(parent_).append(' <span id="'+ new Date().getTime()+'" class="help-block-new"></span>');
		    msg = $(parent_).children('.help-block-new');
		    
		    if(mzg != null) 
		    	$(msg).text(mzg);
		    else
		    	$(msg).text('');
		    
		    if(clazz1 ==0) {
		    	$('.form-group').attr('class', 'form-group has-feedback  '); 
		    	$('.form-group').find('span').each(function(){ $(this).remove();});
		    	
		      return;
		    } else if(clazz1 ==1) {
		    	parent_base.attr('class', 'form-group has-success has-feedback  '); 
		    	$(parent_).find('.glyphicon.form-control-feedback').each(function(){ $(this).remove();});
		    	$(parent_).prepend($('<span class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>'));
		    	 
		      return;
		    } else if(clazz1 ==2) {
		    	parent_base.attr('class', 'form-group has-warning has-feedback  '); 
		    	$(parent_).find('.glyphicon.form-control-feedback').each(function(){ $(this).remove();});
		    	$(parent_).prepend($('<span class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>'));
		      return;
		    }else if(clazz1 ==3) {
		    	parent_base.attr('class', 'form-group has-error has-feedback  '); 
		    	$(parent_).find('.glyphicon.form-control-feedback').each(function(){ $(this).remove();});
		    	$(parent_).prepend($('<span class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>'));
		      return;
		    } 

	  } 

	  
	  // validate date format
	  $.validator.addMethod(
	      "australianDate",
	      function(value, element) {
	          // put your own logic here, this is just a (crappy) example
	          return value.match(/^\d\d?\-\d\d?\-\d\d\d\d$/);
	      },
	      "Please enter a date in the format dd-mm-yyyy."
	  );
	  
	  
		/*=========================================================================================================*/
		/*=========================================================================================================*/
	  

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
//		urlExists(url, function(exists){
//		  //do more stuff based on the boolean value of exists
//		});

		
	function setImage($this, $url, $rec, $trg, $mask) {
		if($mask)
			$('body').append($('<div id="mask" class="modal-backdrop fade in"><div class=" pagination-centered"><div class="center loader"></div></div></div>'));
		  url= window.location.href;  
		  url = url.substring(0, url.lastIndexOf('/'));
		  url = url.substring(0, url.lastIndexOf('/'));
		  $string_trturn = url+"/assets/images/default.png";
		  $.ajax({
		    url:$url,
		    type:'HEAD',
		    error: function(){
		      $($this).attr("src",$string_trturn);
		      if($rec > 0)
		    	  setTimeout(function() { setImage($this, $url, --$rec, $trg, false); }, 2000);	
		      else{
		    	  $('#mask').remove();
		    	  console.log("error");
		      }
		    },
		    success: function() { 
		      $($this).attr("src",$url);
		      if($trg !=null)
		    	  $($trg).click();
		      $('#mask').remove();
		    }
		  });

		}

		/*=======================================================================================================*/
		/*=======================================================================================================*/
		
	  
	  
	  
	  
	  
	  
	  
	  
	  
	  


	    $('#join_date').datepicker({
	        format: 'dd-mm-yyyy',
	        endDate: '1d',
	        startDate: '-10d'
	    });

	  

        
	
	$("#validate_me").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
			}, 
			email: {
				required: true,
				email: true
			},
			 mobile:{
		 		required: true,
				 number: true,
			  	minlength: 10,
		  		maxlength: 10
			 },
			url: {
				required: true,
				url: true
			},
			comment:{
				required: true
			},
			cpassword: {
				required: true,
      			equalTo: "#password"
			},
			check: {
				 required: true
			},
			join_date: {
				australianDate: true
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
			//form_status (   this,   1,   "success");
			
//			$(this).find(':input[type="submit"]').prop('disabled', true);
//			$.post('controller',{action:'login',email:email, password: password},function(response){
//				console.log(response); 
//				if (response.success == -1) {
//					if (!response.authentication) 
//						window.location.replace(response.page+"?referrer="+response.to);
//				} else if (response.success == 1) {
//					// success code
//					window.location.replace(response.url);
//				}else if (response.success == 0) {
//					// success code
//					alert(response.error);
//				} else {
//					// anything elz
//				}
//			$(this).find(':input[type="submit"]').prop('disabled', false);
//		
//			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
	
	
	
	
	
	
/*==================================================================================================================*/	
	
	
        
	
	$("#update-admin").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
				},
				email: {
					required: true,
					email: true
					},
					mobile: {
						required: true,
						number: true,
						minlength:10,
						maxlength:10
						},
						landline: {
							number: true
						}
			},
		submitHandler: function(form, event){
			name = $('#name').val(); 
			email = $('#email').val(); 
			mobile = $('#mobile').val(); 
			landline = $('#l_no').val(); 
			image = $('.get-selected-imgg').val(); 

			
			
			console.log(name, email, mobile, landline, image);
			
			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'update-admin',
				name:name, 
				email:email, 
				mobile:mobile, 
				landline:landline, 
				image:image
				},function(response){
				
				
				
				console.log(response); 
				
				
				
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					
					

			 		Lobibox.notify('success', {
											size: 'mini',
											showClass: 'zoomInLeft',
											hideClass: 'zoomOutRight',
											msg: 'successfully updated' ,
											img: $("#loged_in_image").attr("src")
									});
					
					
					$("#update-admin").find('input[type=text], input[type=number], input[type=email], textarea').val("");
					$('#prev_image_here_n').attr('src', 'null');
					form_status (   this, 0,  null);
					
					$('.quit-me-h').click();
					
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
				
				
				
				
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
/*=================================================================================================================*/	
	

	
	
	
	
	
	

	/*=================================================================================================================
	 * =============================================Department=====================================================
	 * =================================================================================================================*/	


	
	$("#add-department").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			name: {
				required: "Please enter a department",
				minlength: "Category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){ 
			 
			var toServerValues = {};
			toServerValues['action'] = 'add-department';

			$("#add-department").find('input, textarea ').each(function() {
				if($(this).attr('type') != "submit") {
					toServerValues[$(this).attr('id')+''] = $(this).val()+'';
				}
			}); 
			
 			console.log(toServerValues);
			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					$("#add-department").find("input[type=text], input[type=password], input[type=email] , textarea").val("");
					data = "<tr class='animated bounceInDown' >"+
						"<td>" +  toServerValues.name  + " </td>"+
						"<td>" +  toServerValues.description  + " </td>"+
						"<td><button class='btn btn-info btn-xs for-edit-department' data-id='" +  name + "'>edit</button> </td>"+
					"</tr>";
					$('#added_department>tbody').prepend(data);
					
					form_status (   this, 0,  null);

			 		Lobibox.notify('success', {
											size: 'mini',
											showClass: 'zoomInLeft',
											hideClass: 'zoomOutRight',
											msg: 'successfully updated' ,
											img: $("#loged_in_image").attr("src")
									});
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	$(document).on( "click", '.for-edit-department', function() {    
        try {
        	base = $(this).closest('tr');
	   		 name = base.find("td:nth-child(1)").text();
	   		 description = base.find("td:nth-child(2)").text();
	   		 $('#edit-department').find('#edit-name').val(name);
	   		 $('#edit-department').find('#edit-description').val(description);
   	        $("#add-department").hide(1000);
   	        $("#edit-department").show(1000); 
        }
        catch(err) {
   	        $("#add-department").show(1000);
   	        $("#edit-department").hide(1000); 
        }
	});	
	
	
	
	
	
	

	$("#edit-department").validate({
		rules: {
			editname: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			editname: {
				required: "Please enter a department",
				minlength: "Category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#edit-name').val();
			description = $('#edit-description').val();
			
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'edit-department',name:name, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					$('#added_department>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.find("td:nth-child(1)").text() == name){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(2)").text(description);
						}
					});
					
					form_status (   this, 0,  null);

		   	        $("#add-department").show(1000);
		   	        $("#edit-department").hide(1000); 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
	
$('#delete_this_department').click(function () {
		
		name = $('#edit-name').val();

		if(name == null ){
			form_status (   $('#edit-name'), 3,  "Please enter a description");			
			return;
		}
		if(name.length <2){
			form_status (   $('#edit-name'), 3,  "description must be at least 2 characters long");
			return;
		}
		
		console.log(name +""); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-department',name:name},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_department>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.find("td:nth-child(1)").text() == name)
						$deleted = $this;
				});
				//$deleted.remove();
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        $("#add-department").show(1000);
	   	        $("#edit-department").hide(1000); 
	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	











	
	
	
	/*=================================================================================================================
	 * ==============================================Department end================================================
	 * =================================================================================================================*/	
		

	 
		

		

	
	
	

	/*=================================================================================================================
	 * =============================================job-category=====================================================
	 * =================================================================================================================*/	


	
	$("#add-job-category").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			name: {
				required: "Please enter a department",
				minlength: "Category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){ 
			 
			var toServerValues = {};
			toServerValues['action'] = 'add-job-category';

			$("#add-job-category").find('input, textarea ').each(function() {
				if($(this).attr('type') != "submit") {
					toServerValues[$(this).attr('id')+''] = $(this).val()+'';
				}
			}); 
			
 			console.log(toServerValues);
			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					$("#add-job-category").find("input[type=text], input[type=password], input[type=email] , textarea").val("");
					data = "<tr class='animated bounceInDown' >"+
						"<td>" +  toServerValues.name  + " </td>"+
						"<td>" +  toServerValues.description  + " </td>"+
						"<td><button class='btn btn-info btn-xs for-edit-job-category' data-id='" +  name + "'>edit</button> </td>"+
					"</tr>";
					$('#added_job-category>tbody').prepend(data);
					
					form_status (   this, 0,  null);
			 		Lobibox.notify('success', {
						size: 'mini',
						showClass: 'zoomInLeft',
						hideClass: 'zoomOutRight',
						msg: 'successfully added' ,
						img: $("#loged_in_image").attr("src")
				});
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	

	$(document).on( "click", '.for-edit-job-category', function() {   
		console.log('fffff');
        try {
        	base = $(this).closest('tr');
	   		 name = base.find("td:nth-child(1)").text();
	   		 description = base.find("td:nth-child(2)").text();
	   		 $('#edit-job-category').find('#edit-name').val(name);
	   		 $('#edit-job-category').find('#edit-description').val(description); 
   	        activaTab('menu2');
        }
        catch(err) {
   	        activaTab('home'); 
        }
	});	
	
	
	
	
	
	

	$("#edit-job-category").validate({
		rules: {
			editname: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			editname: {
				required: "Please enter a job category",
				minlength: "job category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#edit-name').val();
			description = $('#edit-description').val();
			
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'edit-job-category',name:name, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code

		   	        activaTab('home');
		   	        
					$('#added_job-category>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.find("td:nth-child(1)").text() == name){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(2)").text(description);
						}
					});
					
					form_status (   this, 0,  null);
 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	$('#delete_this_job-category').click(function () {
		
		name = $('#edit-name').val();

		if(name == null ){
			form_status (   $('#edit-name'), 3,  "Please enter a category");			
			return;
		}
		if(name.length <2){
			form_status (   $('#edit-name'), 3,  "Category must be at least 2 characters long");
			return;
		}
		
		console.log(name +""); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-job-category',name:name},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_job-category>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.find("td:nth-child(1)").text() == name)
						$deleted = $this;
				});
				//$deleted.remove();

	   	        activaTab('home'); 
	   	        
	   	        
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	
	
	
	/*=================================================================================================================
	 * ==============================================job-category end================================================
	 * =================================================================================================================*/	
		

	 
		

	/*=================================================================================================================
	 * =============================================job=====================================================
	 * =================================================================================================================*/	


	
	$("#add-job").validate({
		rules: { 
			category: {
				required: true
				},
				title: {
					required: true,
					minlength: 2
					},
					department: {
						required: true
						},
						purpose: {
							required: true,
							minlength: 5
							}
			},
		messages: { 
			title: {
				required: "Please enter a title",
				minlength: "job must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){ 
			 
			var toServerValues = {};
			toServerValues['action'] = 'add-job';

			$("#add-job").find('input, textarea, select ').each(function() {
				if($(this).attr('type') != "submit") {
					toServerValues[$(this).attr('id')+''] = $(this).val()+'';
				}
			}); 

			dcategory = $('#category').find('option:selected').text();
			ddepartment = $('#department').find('option:selected').text();

			
 			console.log(toServerValues);
			
			$(this).find('input[type="submit"]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					
					data = "<tr class='animated bounceInDown' >"+
					"<td value='" +  $('#category').val() + "'>" +  dcategory + " </td>"+
					"<td>" +  toServerValues.title  + " </td>"+
					"<td value='" +  $('#department').val() + "'>" +  ddepartment + " </td>"+
					"<td>" +  toServerValues.purpose  + " </td>"+
					"<td>" +  toServerValues.description  + " </td>"+ 
						"<td><button class='btn btn-info btn-xs for-edit-job' data-id='" +  name + "'>edit</button> </td>"+
					"</tr>";
					$('#added_job>tbody').prepend(data);
					
					$("#add-job").find("input[type=text], input[type=password], input[type=email] , textarea").val("");
					
					
					form_status (   this, 0,  null);

			 		Lobibox.notify('success', {
											size: 'mini',
											showClass: 'zoomInLeft',
											hideClass: 'zoomOutRight',
											msg: 'successfully added' ,
											img: $("#loged_in_image").attr("src")
									});
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find('input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	

	$(document).on( "click", '.for-edit-job', function() {   
		console.log('fffff');
        try {
        	base = $(this).closest('tr'); 
        	$('tr').removeAttr('edit');
        	base.attr('edit', 'true');
	   		 $('#edit-job').find('#edit-category').val(base.find("td:nth-child(1)").attr('value'));
	   		 $('#edit-job').find('#edit-title').val(base.find("td:nth-child(2)").text());
	   		 $('#edit-job').find('#edit-department').val(base.find("td:nth-child(3)").attr('value'));
	   		 $('#edit-job').find('#edit-purpose').val(base.find("td:nth-child(4)").text());  	   		 
	   		 $('#edit-job').find('#edit-description').val(base.find("td:nth-child(5)").text()); 
   	        activaTab('menu2');
        }
        catch(err) {
   	        activaTab('home'); 
        }
	});	
	
	
	
	$("#edit-job").validate({
		rules: { 
			category: {
				required: true
				},
				title: {
					required: true,
					minlength: 2
					},
					department: {
						required: true
						},
						purpose: {
							required: true,
							minlength: 5
							}
			},
		messages: { 
			title: {
				required: "Please enter a title",
				minlength: "job must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			 
			var toServerValues = {};
			toServerValues['action'] = 'edit-job';

			$("#edit-job").find('input, textarea, select ').each(function() {
				if($(this).attr('type') != "submit") {
					var parts = ($(this).attr('id')+'').split("-");
					toServerValues[parts[1]+''] = $(this).val()+'';
				}
			}); 

			dcategory = $('#category').find('option:selected').attr("name");
			ddepartment = $('#department').find('option:selected').attr("name");

			
 			console.log(toServerValues);
			
			$(this).find('input[type="submit"]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code

		   	        activaTab('home'); 
					$('#added_job>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.attr('edit') == 'true'){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(1)").text(dcategory);
							$this.find("td:nth-child(2)").text($('#edit-title').val());
							$this.find("td:nth-child(3)").text(ddepartment);
							$this.find("td:nth-child(4)").text($('#edit-purpose').val());  	   		 
							$this.find("td:nth-child(5)").text($('#edit-description').val()); 
					   		 
					   		 
					   		  
						}
					});
					$("#edit-job").find("input[type=text], input[type=password], input[type=email] , textarea").val("");
					
					form_status (   this, 0,  null);
 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
	$('#delete_this_job').click(function () {

		category = $('#edit-category').val();
		title = $('#edit-title').val();

		if(category == null ){
			form_status (   $('#edit-category'), 3,  "Please select a category");			
			return;
		}
		if(category.length <1){
			form_status (   $('#edit-category'), 3,  "Category must be at least 2 characters long");
			return;
		}

		if(title == null ){
			form_status (   $('#edit-title'), 3,  "Please add a title");			
			return;
		}
		if(title.length <2){
			form_status (   $('#edit-title'), 3,  "title must be at least 2 characters long");
			return;
		}
		
		console.log(title +""); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-job',category:category, title:title},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_job>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.attr('edit') == 'true')
						$deleted = $this;
				});
				//$deleted.remove();

	   	        activaTab('home'); 
	   	        
	   	        
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	
	/*=================================================================================================================
	 * ==============================================job end================================================
	 * =================================================================================================================*/	
		

	 
		
	
	
	
	
	
	
	
	
	
	

	/*=================================================================================================================
	 * =============================================language-category=====================================================
	 * =================================================================================================================*/	


	
	$("#add-language-category").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			name: {
				required: "Please enter a name",
				minlength: "name must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){ 
			 
			var toServerValues = {};
			toServerValues['action'] = 'add-language-category';

			$("#add-language-category").find('input, textarea ').each(function() {
				if($(this).attr('type') != "submit") {
					toServerValues[$(this).attr('id')+''] = $(this).val()+'';
				}
			}); 
			
 			console.log(toServerValues);
			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					$("#add-language-category").find("input[type=text], input[type=password], input[type=email] , textarea").val("");
					data = "<tr class='animated bounceInDown' >"+
						"<td>" +  toServerValues.name  + " </td>"+
						"<td>" +  toServerValues.description  + " </td>"+
						"<td><button class='btn btn-info btn-xs for-edit-language-category' data-id='" +  name + "'>edit</button> </td>"+
					"</tr>";
					$('#added_language-category>tbody').prepend(data);
					

		   	        activaTab('home');
		   	        
		   	        
					form_status (   this, 0,  null);
			 		Lobibox.notify('success', {
						size: 'mini',
						showClass: 'zoomInLeft',
						hideClass: 'zoomOutRight',
						msg: 'successfully added' ,
						img: $("#loged_in_image").attr("src")
				});
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
	
	
	
	
	
	


	$(document).on( "click", '.for-edit-language-category', function() {   
		console.log('fffff');
        try {
        	base = $(this).closest('tr');
	   		 name = base.find("td:nth-child(1)").text();
	   		 description = base.find("td:nth-child(2)").text();
	   		 $('#edit-language-category').find('#edit-name').val(name);
	   		 $('#edit-language-category').find('#edit-description').val(description); 
   	        activaTab('menu2');
        }
        catch(err) {
   	        activaTab('home'); 
        }
	});	
	
	
	
	
	
	

	$("#edit-language-category").validate({
		rules: {
			editname: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			editname: {
				required: "Please enter a language category",
				minlength: "language category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#edit-name').val();
			description = $('#edit-description').val();
			
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'edit-language-category',name:name, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code

		   	        activaTab('home');
		   	        
					$('#added_language-category>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.find("td:nth-child(1)").text() == name){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(2)").text(description);
						}
					});
					
					form_status (   this, 0,  null);
 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	$('#delete_this_language-category').click(function () {
		
		name = $('#edit-name').val();

		if(name == null ){
			form_status (   $('#edit-name'), 3,  "Please enter a language");			
			return;
		}
		if(name.length <2){
			form_status (   $('#edit-name'), 3,  "language must be at least 2 characters long");
			return;
		}
		
		console.log(name +""); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-language-category',name:name},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_language-category>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.find("td:nth-child(1)").text() == name)
						$deleted = $this;
				});
				//$deleted.remove();

	   	        activaTab('home'); 
	   	        
	   	        
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	
	
	/*=================================================================================================================
	 * ==============================================language-category end================================================
	 * =================================================================================================================*/	
		

	
	
	
	

	

	/*=================================================================================================================
	 * =============================================language=====================================================
	 * =================================================================================================================*/	


	
	$("#add-language").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			name: {
				required: "Please enter a name",
				minlength: "name must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){ 
			 
			var toServerValues = {};
			toServerValues['action'] = 'add-language';

			$("#add-language").find('input, textarea , select').each(function() {
				if($(this).attr('type') != "submit") {
					toServerValues[$(this).attr('id')+''] = $(this).val()+'';
				}
			}); 
			
 			console.log(toServerValues);

			ncategory = $('#edit-category').find('option:selected').text();
			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					$("#add-language").find("input[type=text], input[type=password], input[type=email] , textarea").val("");
					data = "<tr class='animated bounceInDown' >"+
						"<td>" +  toServerValues.name  + "</td>"+
						"<td value='" +  toServerValues.category  + "'>" +  ncategory  + " </td>"+
						"<td>" +  toServerValues.description  + " </td>"+
						"<td><button class='btn btn-info btn-xs for-edit-language' data-id='" +  name + "'>edit</button> </td>"+
					"</tr>";
					$('#added_language>tbody').prepend(data);
					

		   	        activaTab('home');
		   	        
		   	        
					form_status (   this, 0,  null);
			 		Lobibox.notify('success', {
						size: 'mini',
						showClass: 'zoomInLeft',
						hideClass: 'zoomOutRight',
						msg: 'successfully added' ,
						img: $("#loged_in_image").attr("src")
				});
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
	
	
	
	
	
	


	$(document).on( "click", '.for-edit-language', function() {   
		console.log('fffff');
        try {
        	base = $(this).closest('tr');
	   		 name = base.find("td:nth-child(1)").text();
	   		 description = base.find("td:nth-child(3)").text();
	   		 $('#edit-language').find('#edit-name').val(name);
	   		 $('#edit-language').find('#edit-category').val(base.find("td:nth-child(2)").attr('value'));
	   		 $('#edit-language').find('#edit-description').val(description); 
   	        activaTab('menu2');
        }
        catch(err) {
   	        activaTab('home'); 
        }
	});	
	
	
	
	
	
	

	$("#edit-language").validate({
		rules: {
			editname: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			editname: {
				required: "Please enter a language",
				minlength: "language must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#edit-name').val();
			category = $('#edit-category').val();
			description = $('#edit-description').val();
			
			ncategory = $('#edit-category').find('option:selected').attr("name");
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'edit-language',name:name, category:category, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code

		   	        activaTab('home');
		   	        
					$('#added_language>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.find("td:nth-child(1)").text() == name && $this.find("td:nth-child(2)").attr('value') == category  ){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(2)").text(category);
							$this.find("td:nth-child(3)").text(description);
						}
					});
					
					form_status (   this, 0,  null);
 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	$('#delete_this_language').click(function () {
		
		name = $('#edit-name').val();
		category = $('#edit-category').val();
		
		if(name == null ){
			form_status (   $('#edit-name'), 3,  "Please enter a language");			
			return;
		}
		if(name.length <2){
			form_status (   $('#edit-name'), 3,  "language must be at least 2 characters long");
			return;
		}
		
		console.log(name +"--"+category); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-language',name:name, category:category},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_language>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.find("td:nth-child(1)").text() == name && $this.find("td:nth-child(2)").attr('value') == category)
						$deleted = $this;
				});
				//$deleted.remove();

	   	        activaTab('home'); 
	   	        
	   	        
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	
	
	/*=================================================================================================================
	 * ==============================================language end================================================
	 * =================================================================================================================*/	
		

	
	
	
	/*=================================================================================================================
	 * ==============================================employer starts================================================
	 * =================================================================================================================*/	
 var globButt = null;
	$('.for-edit-employer').click( function(){
		$('#get-employer').find('input, textarea').val("");
		
		globButt = $(this);
		var id = $(this).attr('data-id');
		console.log(id);
		$.post('controller',{action:'get-employer',id:id},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code

	   	        console.log("success");
	   	        
	   	     $.each(response,function (key, data) { 
			   	      $('#get-employer').find('#'+key).val(data);
			   	});
	   	     
	   	  if (response.login == 1)
	   		 $('#action-button').html('<button type="button" id="prevLogin" data-id="'+id+'" class="btn btn-danger btn-xs ">false</button>');
			 else 
	   		 $('#action-button').html('<button type="button" id="activLogin" data-id="'+id+'" class="btn btn-success btn-xs ">true</button>');
			
	   	    			
				$('#showONeDetails').css('display', 'block');
				$('#showALlDetails').css('display', 'none');
			}else if (response.success == 0) {

			}   
		});	 
		
	});
	
	
	$('#backAll').click(function() { 
		$('#showONeDetails').css('display', 'none');
		$('#showALlDetails').css('display', 'block');
	});
	
	
	
	$(document).on('click', '#prevLogin', function() {
		var id = $(this).attr('data-id');
		console.log(id);
		$.post('controller',{action:'active-employer',id:id, data:'0'},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code

	   	        console.log("success");
	   	     $('#backAll').click();
	   	     

	   	        console.log(globButt.closest('tr').find("td:nth-child(7)"));
				globButt.closest('tr').find("td:nth-child(7)").text("false");
				globButt.closest('tr').find("td:nth-child(7)").removeClass("text-success");
				globButt.closest('tr').find("td:nth-child(7)").addClass("text-danger");
				
	   	     
	   	     
	   	     
		 		Lobibox.notify('success', {
					size: 'mini',
					showClass: 'zoomInLeft',
					hideClass: 'zoomOutRight',
					msg: 'successfully updated' ,
					img: $("#loged_in_image").attr("src")
			});
	 
			}else if (response.success == 0) {

			}   
		});	
		
	});
	
	$(document).on('click', '#activLogin', function() {
		var id = $(this).attr('data-id');
		console.log(id);
		
		$.post('controller',{action:'active-employer',id:id, data:'1'},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code

	   	        console.log("success");

				$(globButt).closest('tr').find("td:nth-child(7)").text("true");
				globButt.closest('tr').find("td:nth-child(7)").removeClass("text-danger");
				globButt.closest('tr').find("td:nth-child(7)").addClass("text-success");
				
				
	   	     
	   	     $('#backAll').click();
		 		Lobibox.notify('success', {
					size: 'mini',
					showClass: 'zoomInLeft',
					hideClass: 'zoomOutRight',
					msg: 'successfully updated' ,
					img: $("#loged_in_image").attr("src")
			});
	 
			}else if (response.success == 0) {

			}   
		});	
		
	});
	
	
	
	
	
	
	/*=================================================================================================================
	 * ==============================================employer end================================================
	 * =================================================================================================================*/	
		

	


	/*=================================================================================================================
	 * =============================================skills=====================================================
	 * =================================================================================================================*/	
 

	$(document).on( "click", '.for-edit-skills', function() {   
		console.log('fffff');
        try {
        	base = $(this).closest('tr');
	   		 name = base.find("td:nth-child(1)").text();
	   		 description = base.find("td:nth-child(2)").text();
	   		 $('#edit-skills').find('#edit-name').val(name);
	   		 $('#edit-skills').find('#edit-description').val(description); 
   	        activaTab('menu2');
        }
        catch(err) {
   	        activaTab('home'); 
        }
	});	
	
	
	
	
	
	

	$("#edit-skills").validate({
		rules: {
			editname: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			editname: {
				required: "Please enter a language category",
				minlength: "language category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#edit-name').val();
			description = $('#edit-description').val();
			
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'edit-admin-skills',name:name, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code

		   	        activaTab('home');
		   	        
					$('#added_skills>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.find("td:nth-child(1)").text() == name){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(2)").text(description);
						}
					});
					
					form_status (   this, 0,  null);
 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	$('#delete_this_skills').click(function () {
		
		name = $('#edit-name').val();

		if(name == null ){
			form_status (   $('#edit-name'), 3,  "Please enter a language");			
			return;
		}
		if(name.length <2){
			form_status (   $('#edit-name'), 3,  "language must be at least 2 characters long");
			return;
		}
		
		console.log(name +""); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-admin-skills',name:name},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_skills>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.find("td:nth-child(1)").text() == name)
						$deleted = $this;
				});
				//$deleted.remove();

	   	        activaTab('home'); 
	   	        
	   	        
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	
	
	/*=================================================================================================================
	 * ==============================================skills end================================================
	 * =================================================================================================================*/	
		

	
	

	/*=================================================================================================================
	 * =============================================competencies=====================================================
	 * =================================================================================================================*/	

 
	
	
	
	
	
	
	


	$(document).on( "click", '.for-edit-competencies', function() {   
		console.log('fffff');
        try {
        	base = $(this).closest('tr');
	   		 name = base.find("td:nth-child(1)").text();
	   		 description = base.find("td:nth-child(2)").text();
	   		 $('#edit-competencies').find('#edit-name').val(name);
	   		 $('#edit-competencies').find('#edit-description').val(description); 
   	        activaTab('menu2');
        }
        catch(err) {
   	        activaTab('home'); 
        }
	});	
	
	
	
	
	
	

	$("#edit-competencies").validate({
		rules: {
			editname: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			editname: {
				required: "Please enter a language category",
				minlength: "language category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#edit-name').val();
			description = $('#edit-description').val();
			
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'edit-admin-competencies',name:name, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code

		   	        activaTab('home');
		   	        
					$('#added_competencies>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.find("td:nth-child(1)").text() == name){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(2)").text(description);
						}
					});
					
					form_status (   this, 0,  null);
 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	$('#delete_this_competencies').click(function () {
		
		name = $('#edit-name').val();

		if(name == null ){
			form_status (   $('#edit-name'), 3,  "Please enter a language");			
			return;
		}
		if(name.length <2){
			form_status (   $('#edit-name'), 3,  "language must be at least 2 characters long");
			return;
		}
		
		console.log(name +""); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-admin-competencies',name:name},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_competencies>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.find("td:nth-child(1)").text() == name)
						$deleted = $this;
				});
				//$deleted.remove();

	   	        activaTab('home'); 
	   	        
	   	        
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	
	
	/*=================================================================================================================
	 * ==============================================competencies end================================================
	 * =================================================================================================================*/	
		

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

        
	
	$("#add-category").validate({
		rules: {
			name: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			name: {
				required: "Please enter a category",
				minlength: "Category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#name').val();
			description = $('#description').val();
			
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'add-category',name:name, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					$("#add-category").find("input[type=text], input[type=password], input[type=email] , textarea").val("");
					data = "<tr class='animated bounceInDown' >"+
						"<td>" +  name  + " </td>"+
						"<td>" +  description  + " </td>"+
						"<td><button class='btn btn-info btn-xs for-edit-category' data-id='" +  name + "'>edit</button> </td>"+
					"</tr>";
					$('#added_category>tbody').prepend(data);
					
					form_status (   this, 0,  null);
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	$(document).on( "click", '.for-edit-category', function() {       
        try {
        	base = $(this).closest('tr');
	   		 name = base.find("td:nth-child(1)").text();
	   		 description = base.find("td:nth-child(2)").text();
	   		 $('#edit-category').find('#edit-name').val(name);
	   		 $('#edit-category').find('#edit-description').val(description);
   	        $("#add-category").hide(1000);
   	        $("#edit-category").show(1000); 
        }
        catch(err) {
   	        $("#add-category").show(1000);
   	        $("#edit-category").hide(1000); 
        }
	});

	$("#edit-category").validate({
		rules: {
			editname: {
				required: true,
				minlength: 2
				}
			},
		messages: { 
			editname: {
				required: "Please enter a category",
				minlength: "Category must be at least 2 characters long"
			}
		},
		submitHandler: function(form, event){
			name = $('#edit-name').val();
			description = $('#edit-description').val();
			
			
			console.log(name +""+ description); 

			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',{action:'edit-category',name:name, description: description},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {
					// success code
					$('#added_category>tbody').find('tr').each( function() {
						$this = $(this);
						if($this.find("td:nth-child(1)").text() == name){
							$this.addClass('animated flipInX');
							$this.find("td:nth-child(2)").text(description);
						}
					});
					
					form_status (   this, 0,  null);

		   	        $("#add-category").show(1000);
		   	        $("#edit-category").hide(1000); 
		   	        console.log("success");
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#name',   2,   response.message);
				}
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	$('#delete_this_category').click(function () {
		
		name = $('#edit-name').val();

		if(name == null ){
			form_status (   $('#edit-name'), 3,  "Please enter a category");			
			return;
		}
		if(name.length <2){
			form_status (   $('#edit-name'), 3,  "Category must be at least 2 characters long");
			return;
		}
		
		console.log(name +""); 

		
		ds_button = $(this).prop('disabled', true);
		
		$.post('controller',{action:'delete-category',name:name},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				// success code
				$deleted = null;
				$('#added_category>tbody').find('tr').each( function() {
					$this = $(this);
					if($this.find("td:nth-child(1)").text() == name)
						$deleted = $this;
				});
				//$deleted.remove();
				$deleted.addClass('animated bounceOutUp');
				setTimeout(function() { $deleted.remove(); }, 1500);	
				
				form_status (   this, 0,  null);

	   	        $("#add-category").show(1000);
	   	        $("#edit-category").hide(1000); 
	   	        console.log("success");
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			}
			ds_button.prop('disabled', false);
	
		});	 
		
		
		
	});
	
	
	
	
	
	
	
	
	
	
	//==========================================alllaasrr
	
	function activaTab(tab){
		  $('.nav-tabs a[href="#' + tab + '"]').tab('show');
		};

	/* ========================================== image start ===================================================*/	
	// button test
	
	$('#select-file').click( function () {
		$('#select-upload-me').children('input[type=file]').click();
	});
	
	$('#select-upload-me>input[type=file]').change(function() {
		$this = $('#image-up');
		parent = $($this).parent("div");	
		$('#modal').attr("to_this", "image-up");
    	$('.progress-no-my').remove();
		
		$("#select-upload-me").ajaxForm({

		        beforeSend : function() {
		        	console.log("before");
		        	insert = '<div class="progress-no-my">'+
		    		'<div class="progress-bar progress-bar-success" id="progress-bar-now" role="progressbar" aria-valuenow="2" '+
		    		'aria-valuemin="0" aria-valuemax="100" style="min-width: 1em; width: 1%;">'+
		    		'1%</div></div>';		    		
		    		//progress-bar-now
		    		$(parent).append(insert);
			    },
			    uploadProgress : function(event, position, total, percentComplete) { 
		        	$('#progress-bar-now').css('width', percentComplete+"%");
		        	$('#progress-bar-now').text( percentComplete);  
			    },
			    success: function(response,statusText) {
			    	console.log('successs'); 
			    	if (response.success == -1) {
						if (!response.authentication) 
							window.location.replace(response.page+"?referrer="+response.to);
					} else if (response.success == 1) {
				    	//$('#image-up>input[type=text]').val(response.name); 
						console.log(response.directory);
					    setImage('#image',response.directory, 9, $('#show_image_to_crop'), true );
					}


				},
			    complete : function(response) {
			    	$('#progress-bar-now').parent('.progress-no-my').text('100%');
			    	console.log('complete');
			    	//console.log(response);
			    },
			    error : function() {
			    	$('#progress-bar-now').parent('.progress-no-my').text('0%');
			    }
			}).submit();
	});



	var cropBoxData;
	var cropBoxData;
	var canvasData;
	var cropper;


	function updateCoords(e) {
	  $('#x').val(e.detail.x);
	  $('#y').val(e.detail.y);
	  $('#w').val(e.detail.width);
	  $('#h').val(e.detail.height);

	  $('#r').val(e.detail.rotate);
	  $('#sx').val(e.detail.scaleX);
	  $('#sy').val(e.detail.scaleY);


	}
	
	$('#modal').on('shown.bs.modal', function () {
	  cropper = new Cropper(document.getElementById('image'), { 
	    autoCropArea: 0.5,
	    aspectRatio: 16 / 16,
	    guides: true,
	    minContainerWidth :350,
	    minContainerHeight : 350,
	    ready: function () {

	            // Strict mode: set crop box data first
	            cropper.setCropBoxData(cropBoxData).setCanvasData(canvasData);
	            
	          }, crop: function(e) {
	            updateCoords(e);

	          }
	        });
	}).on('hidden.bs.modal', function () {
	  
	  cropBoxData = cropper.getCropBoxData();
	  canvasData = cropper.getCanvasData();
	  cropper.destroy();


	  var x_ = $('#x').val();
	  var y_ = $('#y').val();
	  var w_ = $('#w').val();
	  var h_ = $('#h').val();
	  var TARGET_W = 300;
	  var TARGET_H = 300;

	  var r = $('#r').val();
	  var sx = $('#sx').val();
	  var sy = $('#sy').val();
 
	  
	  var photo_url_ = $('#image').attr('src');
	  photo_url_ = photo_url_.substr(3);
	  

	  photo_url_ = photo_url_.replace(/^.*[\\\/]/, '');  
	   
	  $sest_utl_p_ =  '/admin/images_';
	 

	  
	  $.post("crop", {
	   x:x_, 
	   y:y_, 
	   w:w_, 
	   h:h_, 

	   r:r, 
	   sx:sx, 
	   sy:sy, 
	   
	   photo_url:photo_url_, 
	   targ_w:TARGET_W, 
	   targ_h:TARGET_H, 
	   sest_utl_p_:$sest_utl_p_ },
	   function(response){ 
//		   console.log(response);
		   if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} 
		   
	      if(response.success == 1 ) {   
	    	  insert = '<div style="width:100%;text-align: center;">'+
	    		'<img src="" class="img-rounded" id="prev_image_here_n" width="250" height="250"> </div>';		 
		        $to_image = $('#modal').attr("to_this");
				parent = $('#'+$to_image).parent("div");
		        $(parent).append($(insert));
		        $('#'+$to_image+">input[type=text]").val(response.name);
			    setImage('#prev_image_here_n',response.directory, 9, null, false );
			    
	        }

	    }); 
	});
	
	
	$('.action_crop').click(function() {
	    if (!cropper) {
	      return;
	    }
	    
		data_method = $(this).attr('data-method');
		data_option = $(this).attr('data-option');		 
		 
		switch (data_method) {

		case 'rotate' :
			 cropper.rotate(data_option);
			break;
		case 'zoom' :
			 cropper.zoom(data_option);
			break;
		case 'move' :
			data_second_option = $(this).attr('data-second-option');
			 cropper.move(data_option, data_second_option);
			break;
		case 'scaleX' :
			 cropper.scaleX(data_option);
			 $(this).attr('data-option', data_option*-1);
			break;
		case 'scaleY' :
			 cropper.scaleY(data_option);
			 $(this).attr('data-option', data_option*-1);
			break;
		case 'clear' :
			 cropper.clear();
			break;
		case 'reset' :
			 cropper.reset();
			break;
			
			
		}
	});

/* ========================================== image end ===================================================*/
	
	
});