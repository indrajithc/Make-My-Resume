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
//		  url = url.substring(0, url.lastIndexOf('/'));
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


    $('#start_date').datepicker({
        format: 'yyyy-mm-dd',
        endDate: '1d' 
    });


    $('#interview, #edit-interview').datepicker({
        format: 'yyyy-mm-dd', 
        startDate: '3d'
    });
    
    $("time.timeago").timeago();
//<time class="timeago" datetime="2008-07-17T09:24:17Z">July 17, 2008</time>
        
	
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
	
	
        
	
	$("#update-employee").validate({
		rules: {
			fname: {
				required: true,
				minlength: 2
				},
			lname: {
				required: true,
				minlength: 2
				},
		username: {
				required: true,
				email: true
				},
			mobile: {
				required: true,
				number: true,
				minlength:10,
				maxlength:10
				}, 
			l_no: {
				required: true,
				number: true
			}, 
				sex: {
					required: true
				}
				
		},
		submitHandler: function(form, event){
			var toServerValues = {};
			toServerValues['action'] = 'update-employee';

			$("#update-employee").find('input, textarea, select ').each(function() {
				if($(this).attr('type') != "submit") {
					var toData = $(this).val();
					if(toData.length <1)
						toData = 'NULL';
					toServerValues[$(this).attr('name')+''] = toData+'';
				}
			}); 
			
			toServerValues['sex'] = $("input[name='sex']:checked").val();
 			console.log(toServerValues);
			
			$(this).find(':input[type="submit"]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				
				
				
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
					
					
				 	form_status (   this, 0,  null);
					 
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#username',   2,   response.message);
				} else if (response.success == 3) {
					form_status (   '#mobile',   2,   response.message);
				}
				
				
				
				
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
/*=================================================================================================================*/	
	



	/*=================================================================================================================
	 * =============================================starts=====================================================
	 * =================================================================================================================*/	

	
	
		
	
	
	
	
	
	
	
	
	
	

	/*=================================================================================================================
	 * =============================================ends=====================================================
	 * =================================================================================================================*/	

	

	 
	
	/*=================================================================================================================
	 * ==============================================lang cat start================================================
	 * =================================================================================================================*/	

	$('#idoflanguage_category>li').click(function(){
		$('#idoflanguage_category>li').find('input[type=checkbox]').prop('checked', false);
		var $this = $(this).find('input[type=checkbox]');
		//if ($this.is(':checked')) {$this.prop('checked', false);} else {$this.prop('checked', true);}
		$id = $(this).attr("data-id");
		$this.prop('checked', true);

		$('#idlanguage').attr('data-id', $id);
		$('#idlanguage').empty();
		
		console.log($id);
		$.post('controller',{action:'get-language',id:$id},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {

	   	        console.log("success"); 
	   	        data = response.data; 
	   	        if(data)
	   	        $.each(data, function(i, item){ 
	   	         $('#idlanguage').append($( ' <li data-id="'+item.id+'">'+
						   	        		' <input type="checkbox"  id="language'+item.id+'" value="">'+
						   	        		' <label title="'+item.description+'" for="brand"><span></span>'+item.name+'</label>'+
						   	        		' </li>'+
						   	        		' '));
	   	        	
	   	        });
	   	     
	   	         $('#idmylangues>div').each(function(){	 
	   	        	 $('#language'+$(this).attr('data-id')).prop('checked', true);
	   	         });
				
				
			
				
			}else if (response.success == 0) {

			}  
	
		});	
		
		
		
	});
	
	
	$(document).on('click', '#idlanguage>li', function(){ 
		var $this = $(this).find('input[type=checkbox]');
		ischeck = false;
		if ($this.is(':checked')) {$this.prop('checked', false); ischeck = false;} else {$this.prop('checked', true); ischeck  = true;}
		 
		$this = $(this);
		$id = $(this).attr("data-id");
		$dl = 0;
		if(ischeck) $dl = 1; else $dl = 0;
 
		$.post('controller',{action:'set-language',id:$id, status:$dl},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {

				if(ischeck){	
					$desc = $this.find('label').attr('title');
					if ($desc  == "undefined")
						$desc  = "";
	   	         $('#idmylangues').append($( '<div class="activity-row" data-id="'+$id+'" id="myLang'+$id+'">'+
						   	        		' <div class="col-xs-9 activity-desc">'+
						   	        		'<h5><a  >'+$this.find('label').text()+'</a></h5>'+
						   	        		' <p>'+$desc +'</p>'+
						   	        		' </div>'+
						   	        		'<div class="clearfix"> </div>'+
						   	        		' </div>'+
						   	        		' '));
	   	         
	   	         

	   	        	
				} else {
					$('#myLang'+$id).remove();
					
				}
	   	     
				
				
			
				
			}else if (response.success == 0) {

			}  
	
		});	
		
		
		
		
		
		
		
		
	});
	
	
	

	
	/*=================================================================================================================
	 * ==============================================vacancies end================================================
	 * =================================================================================================================*/	

	
	/*=================================================================================================================
	 * ==============================================say to admin================================================
	 * =================================================================================================================*/	
		
       
	
	$("#sayToAdmin").validate({
		rules: {
			subject: {
				required: true,
				minlength: 5
				},
				description: {
				required: true,
				minlength: 10
				} 
				
		},
		submitHandler: function(form, event){
			var toServerValues = {};
			toServerValues['action'] = 'say-to-admin';

			$("#sayToAdmin").find('input, textarea, select ').each(function() {
				if($(this).attr('type') != "submit") {
					var toData = $(this).val();
					if(toData.length <1)
						toData = 'NULL';
					toServerValues[$(this).attr('name')+''] = toData+'';
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
					
					$("#sayToAdmin").find('input[type=text], textarea ').val("");

			 		Lobibox.notify('success', {
											size: 'mini',
											showClass: 'zoomInLeft',
											hideClass: 'zoomOutRight',
											msg: 'successfully added' ,
											img: $("#loged_in_image").attr("src")
									});
					
					data = "<li class='collection-item avatar email-unread'>"+
					"<i class='icon_4' title='waiting'>W</i>"+ 
					"<div class='avatar_left'>"+
					"<span class='email-title'>waiting</span>"+
					"<p class='truncate grey-text ultra-small'>"+toServerValues.subject+"</p>"+
					"</div>"+
					"<a href='#!' class='secondary-content'>"+ 
					"<time class='timeago blue-text ultra-small' datetime='"+getFormattedDate()+"'>now</time>"+
							
					"</a>"+
					"<div class='clearfix'> </div>"+
					"</li>"+
					""+
					"";
					

				    $("time.timeago").timeago();
			 		$('#toAdminIndexId').prepend(data);
			 		
			 		
				 	form_status (   this, 0,  null);
					 
					
					
				}else if (response.success == 0) {

				} 
				
				
				
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
	

	
	/*=================================================================================================================
	 * ==============================================say to admin end================================================
	 * =================================================================================================================*/	
		


	
	/*=================================================================================================================
	 * ==============================================resume startz================================================
	 * =================================================================================================================*/	
		

	$('#addNewRowToAcdm').click(function(){
		
		$('#addNewRowToAcdmHost>tbody').append($(''+
				'<tr>'+
				'<td><input placeholder="Eg as 10 th"   class="col-sm-12" type="text"></td>'+
				'<td><input placeholder="Eg in CGPA"   class="col-sm-12" type="number"></td>'+
				'<td><input placeholder="Eg as A+/ A1"  class="col-sm-12" type="text"></td>'+
				'<td><input class="col-sm-12" type="number"></td>'+
				'<td><textarea></textarea></td>'+
				'<td><textarea></textarea></td>'+
				'<td><textarea></textarea></td> '+
				'<td><i class="fa fa-minus-circle removeMe56" aria-hidden="true"></i></td>'+
				'</tr>'+
				''+
				''));
	});

	
	$(document).on('click', '.removeMe56', function() {			
		$(this).closest('tr').remove();
	});
	 
	
	

	$('#addNewRowToAcdm1').click(function(){
		
		$('#addNewRowToAcdmHost1>tbody').append($(''+
				'<tr>'+
				'<td><input placeholder=" "   class="col-sm-12" type="text"></td>'+
				'<td><textarea></textarea></td>'+
				'<td><input placeholder=" "   class="col-sm-12" type="number"></td>'+
				'<td><input placeholder=" "   class="col-sm-12" type="number"></td>'+
				'<td><input placeholder=" "  class="col-sm-12" type="text"></td>'+
				'<td><textarea></textarea></td>'+
				'<td><input placeholder=" "  class="col-sm-12" type="text"></td>'+
				'<td><input class="col-sm-12" type="number"></td>'+
				'<td><input placeholder=" "  class="col-sm-12" type="text"></td>'+
				'<td><textarea></textarea></td> '+
				'<td><i class="fa fa-minus-circle removeMe561" aria-hidden="true"></i></td>'+
				'</tr>'+
				''+
				''));
	});

	
	$(document).on('click', '.removeMe561', function() {			
		$(this).closest('tr').remove();
	});
	 
	var $thizRow = null;
	
	$('#addNewRowToAcdm2').click(function(){
		
		$thizRow = $(''+
				'<tr>'+
				'<td><button type="button" class="col-xs-12 btn btn-info btn-xs selectfile456">select</button></td>'+
				'<td><p>pdf</p></td>'+ 
				'<td><textarea class="col-sm-12"></textarea></td> '+
				'<td><i class="fa fa-minus-circle removeMe562" aria-hidden="true"></i></td>'+
				'</tr>'+
				''+
				'');
		$('#addNewRowToAcdmHost2>tbody').append($thizRow);
	});

	
	$(document).on('click', '.removeMe562', function() {			
		$(this).closest('tr').remove();
	});
	 
	
	
	
	$(document).on('click', '.selectfile456', function () {
		$('#select-upload-me').children('input[type=file]').click();
	});
	
	$('#select-upload-me>input[type=file]').change(function() { 
		parent = $thizRow.closest("td");	 
    	$('.progress-no-my').remove();
		
		$("#select-upload-me").ajaxForm({

		        beforeSend : function() {
		        	console.log("before");
		        	insert = '<div class="col-xs-12 progress-no-my" style="position: absolute;">'+
		    		'<div class="progress progress-striped active" id="progress-bar-now" role="progressbar" aria-valuenow="2" '+
		    		'aria-valuemin="0" aria-valuemax="100" style="height:6px; min-width: 1em; width: 1%;">'+
		    		'1%</div></div>';		    		
		    		//progress-bar-now
		    		$(parent).prepend(insert);
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
						//console.log(response); 

					    $thizRow.find("button").removeClass("selectfile456");
					    $thizRow.find("button").text(response.name);
					    $thizRow.find("p").text(response.name.split('.').pop());
					     
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
	
	//	 
	

	
	$('#butt458').click(function(){
		$("#add-employee-resume").submit();
	});

        
	
	$("#add-employee-resume").validate({
		rules: {
			hobbies: {
				required: true,
				minlength: 9
				},
				about: {
				required: true,
				minlength: 10
				},
				description: {
				required: true 
				} 
				
		},
		submitHandler: function(form, event){
			var toServerValues = {};
			toServerValues['action'] = 'add-resume';


			toServerValues['employee'] = $('#employee').val();
			toServerValues['hobbies'] = $('#hobbies').val();
			toServerValues['about'] = $('#about').val();  
			toServerValues['description'] = $('#description').val();   
			toServerValues['privacy'] = $("input[name='privacy']:checked").val();
			
 			console.log(toServerValues);
			
			$(this).find('input[type=submit]').prop('disabled', true);
			
			$.post('controller',toServerValues,function(response){
				 
				console.log(response); 
				
				
				
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {

					var id = response.id;

				 	form_status (   this, 0,  null);
				 	
				 	if(id <1)
				 		return;

				 	var isexit1 = true;
				 	var isexit2 = true;
				 	var isexit3 = true;
				 	
				 	
				 	$('#addNewRowToAcdmHost>tbody').find('tr').each(function(){
				 		
				 		var $this = $(this);
				 		
						var d991 = $(this).find("td:nth-child(1) input");
						var d992 = $(this).find("td:nth-child(2) input");
						var d993 = $(this).find("td:nth-child(3) input");
						var d994 = $(this).find("td:nth-child(4) input");
						var d995 = $(this).find("td:nth-child(5) textarea"); 
						var d996 = $(this).find("td:nth-child(6) textarea"); 
						var d997 = $(this).find("td:nth-child(7) textarea");  
						
						 if(d991.val().length <1){  form_status ( $(d991),   2, 'This field is required.'); return; isexit1 = false; }
						 if(d992.val().length <1){  form_status ( $(d992),   2, 'This field is required.'); return; isexit1 = false;  }
						 if(d993.val().length <1){  form_status ( $(d993),   2, 'This field is required.'); return; isexit1 = false;  }
						 if(d994.val().length <1){  form_status ($( d994),   2, 'This field is required.'); return;  isexit1 = false; }
						 if(d995.val().length <1){  form_status ( $(d995),   2, 'This field is required.'); return;  isexit1 = false; }
						 if(d996.val().length <1){  form_status ( $(d996),   2, 'This field is required.'); return;  isexit1 = false; }
						 if(d997.val().length <1){  form_status ( $(d997),   2, 'This field is required.'); return;  isexit1 = false; } 
						 
						 var dddd = {};
						 dddd['action'] = 'add-academic';


						 dddd['resume'] = id;
						 dddd['institution'] = d995.val();
						 dddd['address'] = d996.val();  
						 dddd['description'] = d997.val();   
						 dddd['level'] = d991.val();
						 dddd['scale'] = d992.val();
						 dddd['grade'] = d993.val();
						 dddd['l_no'] = d994.val(); 

						 console.log(dddd);
						 
						 
							
							$.post('controller',dddd,function(response){ 
								console.log(response);  
								if (response.success == -1) {
									if (!response.authentication) 
										window.location.replace(response.page+"?referrer="+response.to);
								} else if (response.success == 1) {

							 		$this.remove(); 
							 		
								}else if (response.success == 0) {

									
									Lobibox.notify('danger', {
										size: 'mini',
										showClass: 'zoomInLeft',
										hideClass: 'zoomOutRight',
										msg: 'error on this  academic' ,
										img: $("#loged_in_image").attr("src")
								});
									 isexit1 = false;
									
								} else if (response.success == 2) {
									form_status (   '#username',   2,   response.message);
								} else if (response.success == 3) {
									form_status (   '#mobile',   2,   response.message);
								}
								
								
								
								

							});	
							
							
						 
						 

				 		
				 		
				 	});
				 	
				 	
				 	$('#addNewRowToAcdmHost1>tbody').find('tr').each(function(){
				 		
				 		var $this = $(this);
				 		
						var d991 = $(this).find("td:nth-child(1) input");
						var d992 = $(this).find("td:nth-child(2) textarea");
						var d993 = $(this).find("td:nth-child(3) input");
						var d994 = $(this).find("td:nth-child(4) input");
						var d995 = $(this).find("td:nth-child(5) input"); 
						var d996 = $(this).find("td:nth-child(6) textarea"); 
						var d997 = $(this).find("td:nth-child(7) input"); 
						var d998 = $(this).find("td:nth-child(8) input"); 
						var d999 = $(this).find("td:nth-child(9) input"); 
						var d9910 = $(this).find("td:nth-child(10) textarea");  
						  
						 
						
						
						
						 if(d991.val().length <1){  form_status ( $(d991),   2, 'This field is required.'); return;  isexit2 = false; }
						 if(d992.val().length <1){  form_status ( $(d992),   2, 'This field is required.'); return;   isexit2 = false; }
						 if(d993.val().length <1){  form_status ( $(d993),   2, 'This field is required.'); return;   isexit2 = false; }
						 if(d994.val().length <1){  form_status ( $(d994),   2, 'This field is required.'); return;   isexit2 = false; }
						 if(d995.val().length <1){  form_status ( $(d995),   2, 'This field is required.'); return;   isexit2 = false; }
						 if(d996.val().length <1){  form_status ( $(d996),   2, 'This field is required.'); return;   isexit2 = false; }
						 if(d997.val().length <1){  form_status ( $(d997),   2, 'This field is required.'); return;   isexit2 = false; } 

						 if(d998.val().length <1){  form_status ( $(d998),   2, 'This field is required.'); return;   isexit2 = false; } 
						 if(d999.val().length <1){  form_status ( $(d999),   2, 'This field is required.'); return;   isexit2 = false; } 
						 if(d9910.val().length <1){  form_status ( $(d9910),   2, 'This field is required.'); return;   isexit2 = false; }  
						 
						 var dddd = {};
						 dddd['action'] = 'add-experience';


						 dddd['resume'] = id;
						 dddd['position'] = d995.val();
						 dddd['hr_contact'] = d996.val();  
						 dddd['email'] = d997.val();   
						 dddd['company'] = d991.val();
						 dddd['address'] = d992.val();
						 dddd['pin'] = d993.val();
						 dddd['l_no'] = d994.val(); 
						 dddd['years'] = d998.val();     
						 dddd['url'] = d999.val();     
						 dddd['description'] = d9910.val();      

						 console.log(dddd);
						 
						 
							
							$.post('controller',dddd,function(response){ 
								console.log(response);  
								if (response.success == -1) {
									if (!response.authentication) 
										window.location.replace(response.page+"?referrer="+response.to);
								} else if (response.success == 1) {

							 		$this.remove(); 
							 		
								}else if (response.success == 0) {

									
									Lobibox.notify('danger', {
										size: 'mini',
										showClass: 'zoomInLeft',
										hideClass: 'zoomOutRight',
										msg: 'error on this  academic' ,
										img: $("#loged_in_image").attr("src")
								});
									
									  isexit2 = false;
									
								} else if (response.success == 2) {
									form_status (   '#username',   2,   response.message);
								} else if (response.success == 3) {
									form_status (   '#mobile',   2,   response.message);
								}
								
								
								
								

							});	
							
							
						 
						 

				 		
				 		
				 	});
				 	
				 	
				 	
				 	
				 	
				 	
				 	
				 	
				 	
				 	
				 	
				 	$('#addNewRowToAcdmHost2>tbody').find('tr').each(function(){
				 		
				 		var $this = $(this);
				 		
						var d991 = $(this).find("td:nth-child(1) button");
						var d992 = $(this).find("td:nth-child(2) p");
						var d993 = $(this).find("td:nth-child(3) textarea"); 
						 
					 
						
						
						 if(d991.text().length <1){  form_status ( $(d991),   2, 'This field is required.'); return;   isexit3 = false; }
						 if(d992.text().length <1){  form_status ( $(d992),   2, 'This field is required.'); return;   isexit3 = false;  }
						 if(d993.val().length <1){  form_status ( $(d993),   2, 'This field is required.'); return;    isexit3 = false; } 
						 
						 var dddd = {};
						 dddd['action'] = 'add-attachment';


						 dddd['resume'] = id;    ;
						 dddd['attachment'] = d991.text();
						 dddd['type'] = d992.text();
						 dddd['description'] = d993.val(); 

						 console.log(dddd);
						 
						 
							
							$.post('controller',dddd,function(response){ 
								console.log(response);  
								if (response.success == -1) {
									if (!response.authentication) 
										window.location.replace(response.page+"?referrer="+response.to);
								} else if (response.success == 1) {

							 		$this.remove(); 
							 		
								}else if (response.success == 0) {

									
									Lobibox.notify('danger', {
										size: 'mini',
										showClass: 'zoomInLeft',
										hideClass: 'zoomOutRight',
										msg: 'error on this  academic' ,
										img: $("#loged_in_image").attr("src")
								});
									   isexit3 = false;
									
								} else if (response.success == 2) {
									form_status (   '#username',   2,   response.message);
								} else if (response.success == 3) {
									form_status (   '#mobile',   2,   response.message);
								}
								
								
								
								

							});	
							
							
						 
						 

				 		if(   isexit3 &&   isexit2 &&   isexit1){

							 $('#employee').val("");
							  $('#hobbies').val("");
							 $('#about').val("");  
							  $('#description').val("");   

						 		Lobibox.notify('success', {
														size: 'mini',
														showClass: 'zoomInLeft',
														hideClass: 'zoomOutRight',
														msg: 'successfully updated' ,
														img: $("#loged_in_image").attr("src")
												});
							
				 		} else {

					 		Lobibox.notify('warning', {
													size: 'mini',
													showClass: 'zoomInLeft',
													hideClass: 'zoomOutRight',
													msg: 'recheck inputs' ,
													img: $("#loged_in_image").attr("src")
											});
				 		}
				 		
				 	});
				 	
				 	
					 
					
					
				}else if (response.success == 0) {

				} else if (response.success == 2) {
					form_status (   '#username',   2,   response.message);
				} else if (response.success == 3) {
					form_status (   '#mobile',   2,   response.message);
				}
				
				
				
				
			$(this).find(':input[type="submit"]').prop('disabled', false);
		
			});	 
			
			 return false;
			
		}
			
	});
	
	
	
	
	
	console.log("varrrrr");
	
	$('#delte-thi-resu').click(function () {
		   
		
		$deleted = $(this).closest(".form-horizontal");
		 
		
		$.post('controller',{action:'delete-resume',id:$(this).attr("data-id")},function(response){
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
					msg: 'successfully deleted' ,
					img: $("#loged_in_image").attr("src")
			});
				setTimeout(function() { $deleted.remove(); }, idoflanguage_category500);	
				
				form_status (   this, 0,  null);
 
				
				
			}else if (response.success == 0) {

			} else if (response.success == 2) {
				form_status (   '#name',   2,   response.message);
			} 
	
		});	 
		
		
		
	});


	
	/*=================================================================================================================
	 * ==============================================resume endz================================================
	 * =================================================================================================================*/	
		



	
	/*=================================================================================================================
	 * ==============================================newsletters stsrz================================================
	 * =================================================================================================================*/	
		
	function doRefreshed() {
		 
		$.post('controller',{action:'get-newsletter'},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {
				$('#idmylangues').empty();
	   	        console.log("success");  
	   	          if(response.company)
		   	          if(response.company.length   > 0)
		   	          $('#idmylangues').append($( '<div class="activity-row"   >'+
			   	        		' <div class="col-xs-9 activity-desc">'+
			   	        		'<h5><a  >company</a></h5>'+
			   	        		' <p>'+response.company+'</p>'+
			   	        		' </div>'+
			   	        		'<div class="clearfix"> </div>'+
			   	        		' </div>'+
			   	        		' '));

	   	          if(response.category)
		   	          if(response.category.length  > 0)
		   	          $('#idmylangues').append($( '<div class="activity-row"   >'+
			   	        		' <div class="col-xs-9 activity-desc">'+
			   	        		'<h5><a  >category</a></h5>'+
			   	        		' <p>'+response.category+'</p>'+
			   	        		' </div>'+
			   	        		'<div class="clearfix"> </div>'+
			   	        		' </div>'+
			   	        		' '));

	   	          if(response.education)
		   	          if(response.education.length  > 0)
		   	          $('#idmylangues').append($( '<div class="activity-row"   >'+
			   	        		' <div class="col-xs-9 activity-desc">'+
			   	        		'<h5><a  >education</a></h5>'+
			   	        		' <p>'+response.education+'</p>'+
			   	        		' </div>'+
			   	        		'<div class="clearfix"> </div>'+
			   	        		' </div>'+
			   	        		' '));
  
				
			
				
			}else if (response.success == 0) {

			}  

		});	
		
		
		
	}
	
	

	$('#alot909458>li').click(function(){
		$('#alot909458>li').find('input[type=checkbox]').prop('checked', false);
		var $this = $(this).find('input[type=checkbox]');
		//if ($this.is(':checked')) {$this.prop('checked', false);} else {$this.prop('checked', true);}
		$id = $(this).attr("data-id");
		$this.prop('checked', true);

		$('#idlanguage').attr('data-id', $id);
		$('#idlanguage').empty();
		
		console.log($id);
		$.post('controller',{action:'set-employee-1',id:$id},function(response){
			console.log(response); 
			if (response.success == -1) {
				if (!response.authentication) 
					window.location.replace(response.page+"?referrer="+response.to);
			} else if (response.success == 1) {

	   	        console.log("success"); 
	   	        data = response.data; 
	   	         
	   	     doRefreshed();
	   	       
	   	        	 $('#language_1category'+$(this).attr('data-id')).prop('checked', true);
	   	         
				
				
			
				
			}else if (response.success == 0) {

			}  

		});	
	});	

		$('#alot909457>li').click(function(){
			$('#alot909457>li').find('input[type=checkbox]').prop('checked', false);
			var $this = $(this).find('input[type=checkbox]');
			//if ($this.is(':checked')) {$this.prop('checked', false);} else {$this.prop('checked', true);}
			$id = $(this).attr("data-id");
			$this.prop('checked', true);

			$('#idlanguage').attr('data-id', $id);
			$('#idlanguage').empty();
			
			console.log($id);
			$.post('controller',{action:'set-employee-2',id:$id},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {

		   	        console.log("success"); 
		   	        data = response.data; 
		   	         
		   	     doRefreshed();
		   	      	 
		   	        	 $('#language_2category'+$(this).attr('data-id')).prop('checked', true);
		   	         
					
				
					
				}else if (response.success == 0) {

				}  
		
			});	
			
		
		
	});
	
	
	

		$('#alot909456>li').click(function(){
			$('#alot909456>li').find('input[type=checkbox]').prop('checked', false);
			var $this = $(this).find('input[type=checkbox]');
			//if ($this.is(':checked')) {$this.prop('checked', false);} else {$this.prop('checked', true);}
			$id = $(this).attr("data-id");
			$this.prop('checked', true);

			$('#idlanguage').attr('data-id', $id);
			$('#idlanguage').empty();
			
			console.log($id);
			$.post('controller',{action:'set-employee-3',id:$id},function(response){
				console.log(response); 
				if (response.success == -1) {
					if (!response.authentication) 
						window.location.replace(response.page+"?referrer="+response.to);
				} else if (response.success == 1) {

		   	        console.log("success"); 
		   	        data = response.data; 
		   	         
		   	     doRefreshed();
		   	      	 
		   	        	 $('#language_3category'+$(this).attr('data-id')).prop('checked', true);
		   	        
					
				
					
				}else if (response.success == 0) {

				}  
		
			});	
			

		});	
	
	

	
	
	
	
	
	
	


	
	/*=================================================================================================================
	 * ==============================================newsletters endz================================================
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
	
	
	
	
	
	function getFormattedDate() {
	    var date = new Date();
	    var str = date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate() + " " +  date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();

	    return str;
	}
	
	
	
	
	
	
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
	   
	  $sest_utl_p_ =  '/employee/images_';
	 

	  
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
	
	
	
	// Countries
var country_arr = new Array("Afghanistan", "Albania", "Algeria", "American Samoa", "Angola", "Anguilla", "Antartica", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Ashmore and Cartier Island", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "British Virgin Islands", "Brunei", "Bulgaria", "Burkina Faso", "Burma", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Chile", "China", "Christmas Island", "Clipperton Island", "Cocos (Keeling) Islands", "Colombia", "Comoros", "Congo, Democratic Republic of the", "Congo, Republic of the", "Cook Islands", "Costa Rica", "Cote d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czeck Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Europa Island", "Falkland Islands (Islas Malvinas)", "Faroe Islands", "Fiji", "Finland", "France", "French Guiana", "French Polynesia", "French Southern and Antarctic Lands", "Gabon", "Gambia, The", "Gaza Strip", "Georgia", "Germany", "Ghana", "Gibraltar", "Glorioso Islands", "Greece", "Greenland", "Grenada", "Guadeloupe", "Guam", "Guatemala", "Guernsey", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Heard Island and McDonald Islands", "Holy See (Vatican City)", "Honduras", "Hong Kong", "Howland Island", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland", "Ireland, Northern", "Israel", "Italy", "Jamaica", "Jan Mayen", "Japan", "Jarvis Island", "Jersey", "Johnston Atoll", "Jordan", "Juan de Nova Island", "Kazakhstan", "Kenya", "Kiribati", "Korea, North", "Korea, South", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macau", "Macedonia, Former Yugoslav Republic of", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Man, Isle of", "Marshall Islands", "Martinique", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Federated States of", "Midway Islands", "Moldova", "Monaco", "Mongolia", "Montserrat", "Morocco", "Mozambique", "Namibia", "Nauru", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Niue", "Norfolk Island", "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Pitcaim Islands", "Poland", "Portugal", "Puerto Rico", "Qatar", "Reunion", "Romainia", "Russia", "Rwanda", "Saint Helena", "Saint Kitts and Nevis", "Saint Lucia", "Saint Pierre and Miquelon", "Saint Vincent and the Grenadines", "Samoa", "San Marino", "Sao Tome and Principe", "Saudi Arabia", "Scotland", "Senegal", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Georgia and South Sandwich Islands", "Spain", "Spratly Islands", "Sri Lanka", "Sudan", "Suriname", "Svalbard", "Swaziland", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Tobago", "Toga", "Tokelau", "Tonga", "Trinidad", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "Uruguay", "USA", "Uzbekistan", "Vanuatu", "Venezuela", "Vietnam", "Virgin Islands", "Wales", "Wallis and Futuna", "West Bank", "Western Sahara", "Yemen", "Yugoslavia", "Zambia", "Zimbabwe");

//States
var s_a = new Array();
s_a[0] = "";
s_a[1] = "Badakhshan|Badghis|Baghlan|Balkh|Bamian|Farah|Faryab|Ghazni|Ghowr|Helmand|Herat|Jowzjan|Kabol|Kandahar|Kapisa|Konar|Kondoz|Laghman|Lowgar|Nangarhar|Nimruz|Oruzgan|Paktia|Paktika|Parvan|Samangan|Sar-e Pol|Takhar|Vardak|Zabol";
s_a[2] = "Berat|Bulqize|Delvine|Devoll (Bilisht)|Diber (Peshkopi)|Durres|Elbasan|Fier|Gjirokaster|Gramsh|Has (Krume)|Kavaje|Kolonje (Erseke)|Korce|Kruje|Kucove|Kukes|Kurbin|Lezhe|Librazhd|Lushnje|Malesi e Madhe (Koplik)|Mallakaster (Ballsh)|Mat (Burrel)|Mirdite (Rreshen)|Peqin|Permet|Pogradec|Puke|Sarande|Shkoder|Skrapar (Corovode)|Tepelene|Tirane (Tirana)|Tirane (Tirana)|Tropoje (Bajram Curri)|Vlore";
s_a[3] = "Adrar|Ain Defla|Ain Temouchent|Alger|Annaba|Batna|Bechar|Bejaia|Biskra|Blida|Bordj Bou Arreridj|Bouira|Boumerdes|Chlef|Constantine|Djelfa|El Bayadh|El Oued|El Tarf|Ghardaia|Guelma|Illizi|Jijel|Khenchela|Laghouat|M'Sila|Mascara|Medea|Mila|Mostaganem|Naama|Oran|Ouargla|Oum el Bouaghi|Relizane|Saida|Setif|Sidi Bel Abbes|Skikda|Souk Ahras|Tamanghasset|Tebessa|Tiaret|Tindouf|Tipaza|Tissemsilt|Tizi Ouzou|Tlemcen";
s_a[4] = "Eastern|Manu'a|Rose Island|Swains Island|Western";
s_a[5] = "Andorra la Vella|Bengo|Benguela|Bie|Cabinda|Canillo|Cuando Cubango|Cuanza Norte|Cuanza Sul|Cunene|Encamp|Escaldes-Engordany|Huambo|Huila|La Massana|Luanda|Lunda Norte|Lunda Sul|Malanje|Moxico|Namibe|Ordino|Sant Julia de Loria|Uige|Zaire";
s_a[6] = "Anguilla";
s_a[7] = "Antartica";
s_a[8] = "Barbuda|Redonda|Saint George|Saint John|Saint Mary|Saint Paul|Saint Peter|Saint Philip";
s_a[9] = "Antartica e Islas del Atlantico Sur|Buenos Aires|Buenos Aires Capital Federal|Catamarca|Chaco|Chubut|Cordoba|Corrientes|Entre Rios|Formosa|Jujuy|La Pampa|La Rioja|Mendoza|Misiones|Neuquen|Rio Negro|Salta|San Juan|San Luis|Santa Cruz|Santa Fe|Santiago del Estero|Tierra del Fuego|Tucuman";
s_a[10] = "Aragatsotn|Ararat|Armavir|Geghark'unik'|Kotayk'|Lorri|Shirak|Syunik'|Tavush|Vayots' Dzor|Yerevan";
s_a[11] = "Aruba";
s_a[12] = "Ashmore and Cartier Island";
s_a[13] = "Australian Capital Territory|New South Wales|Northern Territory|Queensland|South Australia|Tasmania|Victoria|Western Australia";
s_a[14] = "Burgenland|Kaernten|Niederoesterreich|Oberoesterreich|Salzburg|Steiermark|Tirol|Vorarlberg|Wien";
s_a[15] = "Abseron Rayonu|Agcabadi Rayonu|Agdam Rayonu|Agdas Rayonu|Agstafa Rayonu|Agsu Rayonu|Ali Bayramli Sahari|Astara Rayonu|Baki Sahari|Balakan Rayonu|Barda Rayonu|Beylaqan Rayonu|Bilasuvar Rayonu|Cabrayil Rayonu|Calilabad Rayonu|Daskasan Rayonu|Davaci Rayonu|Fuzuli Rayonu|Gadabay Rayonu|Ganca Sahari|Goranboy Rayonu|Goycay Rayonu|Haciqabul Rayonu|Imisli Rayonu|Ismayilli Rayonu|Kalbacar Rayonu|Kurdamir Rayonu|Lacin Rayonu|Lankaran Rayonu|Lankaran Sahari|Lerik Rayonu|Masalli Rayonu|Mingacevir Sahari|Naftalan Sahari|Naxcivan Muxtar Respublikasi|Neftcala Rayonu|Oguz Rayonu|Qabala Rayonu|Qax Rayonu|Qazax Rayonu|Qobustan Rayonu|Quba Rayonu|Qubadli Rayonu|Qusar Rayonu|Saatli Rayonu|Sabirabad Rayonu|Saki Rayonu|Saki Sahari|Salyan Rayonu|Samaxi Rayonu|Samkir Rayonu|Samux Rayonu|Siyazan Rayonu|Sumqayit Sahari|Susa Rayonu|Susa Sahari|Tartar Rayonu|Tovuz Rayonu|Ucar Rayonu|Xacmaz Rayonu|Xankandi Sahari|Xanlar Rayonu|Xizi Rayonu|Xocali Rayonu|Xocavand Rayonu|Yardimli Rayonu|Yevlax Rayonu|Yevlax Sahari|Zangilan Rayonu|Zaqatala Rayonu|Zardab Rayonu";
s_a[16] = "Acklins and Crooked Islands|Bimini|Cat Island|Exuma|Freeport|Fresh Creek|Governor's Harbour|Green Turtle Cay|Harbour Island|High Rock|Inagua|Kemps Bay|Long Island|Marsh Harbour|Mayaguana|New Providence|Nicholls Town and Berry Islands|Ragged Island|Rock Sound|San Salvador and Rum Cay|Sandy Point";
s_a[17] = "Al Hadd|Al Manamah|Al Mintaqah al Gharbiyah|Al Mintaqah al Wusta|Al Mintaqah ash Shamaliyah|Al Muharraq|Ar Rifa' wa al Mintaqah al Janubiyah|Jidd Hafs|Juzur Hawar|Madinat 'Isa|Madinat Hamad|Sitrah";
s_a[18] = "Barguna|Barisal|Bhola|Jhalokati|Patuakhali|Pirojpur|Bandarban|Brahmanbaria|Chandpur|Chittagong|Comilla|Cox's Bazar|Feni|Khagrachari|Lakshmipur|Noakhali|Rangamati|Dhaka|Faridpur|Gazipur|Gopalganj|Jamalpur|Kishoreganj|Madaripur|Manikganj|Munshiganj|Mymensingh|Narayanganj|Narsingdi|Netrokona|Rajbari|Shariatpur|Sherpur|Tangail|Bagerhat|Chuadanga|Jessore|Jhenaidah|Khulna|Kushtia|Magura|Meherpur|Narail|Satkhira|Bogra|Dinajpur|Gaibandha|Jaipurhat|Kurigram|Lalmonirhat|Naogaon|Natore|Nawabganj|Nilphamari|Pabna|Panchagarh|Rajshahi|Rangpur|Sirajganj|Thakurgaon|Habiganj|Maulvi bazar|Sunamganj|Sylhet";
s_a[19] = "Bridgetown|Christ Church|Saint Andrew|Saint George|Saint James|Saint John|Saint Joseph|Saint Lucy|Saint Michael|Saint Peter|Saint Philip|Saint Thomas";
s_a[20] = "Brestskaya (Brest)|Homyel'skaya (Homyel')|Horad Minsk|Hrodzyenskaya (Hrodna)|Mahilyowskaya (Mahilyow)|Minskaya|Vitsyebskaya (Vitsyebsk)";
s_a[21] = "Antwerpen|Brabant Wallon|Brussels Capitol Region|Hainaut|Liege|Limburg|Luxembourg|Namur|Oost-Vlaanderen|Vlaams Brabant|West-Vlaanderen";
s_a[22] = "Belize|Cayo|Corozal|Orange Walk|Stann Creek|Toledo";
s_a[23] = "Alibori|Atakora|Atlantique|Borgou|Collines|Couffo|Donga|Littoral|Mono|Oueme|Plateau|Zou";
s_a[24] = "Devonshire|Hamilton|Hamilton|Paget|Pembroke|Saint George|Saint Georges|Sandys|Smiths|Southampton|Warwick";
s_a[25] = "Bumthang|Chhukha|Chirang|Daga|Geylegphug|Ha|Lhuntshi|Mongar|Paro|Pemagatsel|Punakha|Samchi|Samdrup Jongkhar|Shemgang|Tashigang|Thimphu|Tongsa|Wangdi Phodrang";
s_a[26] = "Beni|Chuquisaca|Cochabamba|La Paz|Oruro|Pando|Potosi|Santa Cruz|Tarija";
s_a[27] = "Federation of Bosnia and Herzegovina|Republika Srpska";
s_a[28] = "Central|Chobe|Francistown|Gaborone|Ghanzi|Kgalagadi|Kgatleng|Kweneng|Lobatse|Ngamiland|North-East|Selebi-Pikwe|South-East|Southern";
s_a[29] = "Acre|Alagoas|Amapa|Amazonas|Bahia|Ceara|Distrito Federal|Espirito Santo|Goias|Maranhao|Mato Grosso|Mato Grosso do Sul|Minas Gerais|Para|Paraiba|Parana|Pernambuco|Piaui|Rio de Janeiro|Rio Grande do Norte|Rio Grande do Sul|Rondonia|Roraima|Santa Catarina|Sao Paulo|Sergipe|Tocantins";
s_a[30] = "Anegada|Jost Van Dyke|Tortola|Virgin Gorda";
s_a[31] = "Belait|Brunei and Muara|Temburong|Tutong";
s_a[32] = "Blagoevgrad|Burgas|Dobrich|Gabrovo|Khaskovo|Kurdzhali|Kyustendil|Lovech|Montana|Pazardzhik|Pernik|Pleven|Plovdiv|Razgrad|Ruse|Shumen|Silistra|Sliven|Smolyan|Sofiya|Sofiya-Grad|Stara Zagora|Turgovishte|Varna|Veliko Turnovo|Vidin|Vratsa|Yambol";
s_a[33] = "Bale|Bam|Banwa|Bazega|Bougouriba|Boulgou|Boulkiemde|Comoe|Ganzourgou|Gnagna|Gourma|Houet|Ioba|Kadiogo|Kenedougou|Komandjari|Kompienga|Kossi|Koupelogo|Kouritenga|Kourweogo|Leraba|Loroum|Mouhoun|Nahouri|Namentenga|Naumbiel|Nayala|Oubritenga|Oudalan|Passore|Poni|Samentenga|Sanguie|Seno|Sissili|Soum|Sourou|Tapoa|Tuy|Yagha|Yatenga|Ziro|Zondomo|Zoundweogo";
s_a[34] = "Ayeyarwady|Bago|Chin State|Kachin State|Kayah State|Kayin State|Magway|Mandalay|Mon State|Rakhine State|Sagaing|Shan State|Tanintharyi|Yangon";
s_a[35] = "Bubanza|Bujumbura|Bururi|Cankuzo|Cibitoke|Gitega|Karuzi|Kayanza|Kirundo|Makamba|Muramvya|Muyinga|Mwaro|Ngozi|Rutana|Ruyigi";
s_a[36] = "Banteay Mean Cheay|Batdambang|Kampong Cham|Kampong Chhnang|Kampong Spoe|Kampong Thum|Kampot|Kandal|Kaoh Kong|Keb|Kracheh|Mondol Kiri|Otdar Mean Cheay|Pailin|Phnum Penh|Pouthisat|Preah Seihanu (Sihanoukville)|Preah Vihear|Prey Veng|Rotanah Kiri|Siem Reab|Stoeng Treng|Svay Rieng|Takev";
s_a[37] = "Adamaoua|Centre|Est|Extreme-Nord|Littoral|Nord|Nord-Ouest|Ouest|Sud|Sud-Ouest";
s_a[38] = "Alberta|British Columbia|Manitoba|New Brunswick|Newfoundland|Northwest Territories|Nova Scotia|Nunavut|Ontario|Prince Edward Island|Quebec|Saskatchewan|Yukon Territory";
s_a[39] = "Boa Vista|Brava|Maio|Mosteiros|Paul|Porto Novo|Praia|Ribeira Grande|Sal|Santa Catarina|Santa Cruz|Sao Domingos|Sao Filipe|Sao Nicolau|Sao Vicente|Tarrafal";
s_a[40] = "Creek|Eastern|Midland|South Town|Spot Bay|Stake Bay|West End|Western";
s_a[41] = "Bamingui-Bangoran|Bangui|Basse-Kotto|Gribingui|Haut-Mbomou|Haute-Kotto|Haute-Sangha|Kemo-Gribingui|Lobaye|Mbomou|Nana-Mambere|Ombella-Mpoko|Ouaka|Ouham|Ouham-Pende|Sangha|Vakaga";
s_a[42] = "Batha|Biltine|Borkou-Ennedi-Tibesti|Chari-Baguirmi|Guera|Kanem|Lac|Logone Occidental|Logone Oriental|Mayo-Kebbi|Moyen-Chari|Ouaddai|Salamat|Tandjile";
s_a[43] = "Aisen del General Carlos Ibanez del Campo|Antofagasta|Araucania|Atacama|Bio-Bio|Coquimbo|Libertador General Bernardo O'Higgins|Los Lagos|Magallanes y de la Antartica Chilena|Maule|Region Metropolitana (Santiago)|Tarapaca|Valparaiso";
s_a[44] = "Anhui|Beijing|Chongqing|Fujian|Gansu|Guangdong|Guangxi|Guizhou|Hainan|Hebei|Heilongjiang|Henan|Hubei|Hunan|Jiangsu|Jiangxi|Jilin|Liaoning|Nei Mongol|Ningxia|Qinghai|Shaanxi|Shandong|Shanghai|Shanxi|Sichuan|Tianjin|Xinjiang|Xizang (Tibet)|Yunnan|Zhejiang";
s_a[45] = "Christmas Island";
s_a[46] = "Clipperton Island";
s_a[47] = "Direction Island|Home Island|Horsburgh Island|North Keeling Island|South Island|West Island";
s_a[48] = "Amazonas|Antioquia|Arauca|Atlantico|Bolivar|Boyaca|Caldas|Caqueta|Casanare|Cauca|Cesar|Choco|Cordoba|Cundinamarca|Distrito Capital de Santa Fe de Bogota|Guainia|Guaviare|Huila|La Guajira|Magdalena|Meta|Narino|Norte de Santander|Putumayo|Quindio|Risaralda|San Andres y Providencia|Santander|Sucre|Tolima|Valle del Cauca|Vaupes|Vichada";
//<!-- -->
s_a[49] = "Anjouan (Nzwani)|Domoni|Fomboni|Grande Comore (Njazidja)|Moheli (Mwali)|Moroni|Moutsamoudou";
s_a[50] = "Bandundu|Bas-Congo|Equateur|Kasai-Occidental|Kasai-Oriental|Katanga|Kinshasa|Maniema|Nord-Kivu|Orientale|Sud-Kivu";
s_a[51] = "Bouenza|Brazzaville|Cuvette|Kouilou|Lekoumou|Likouala|Niari|Plateaux|Pool|Sangha";
s_a[52] = "Aitutaki|Atiu|Avarua|Mangaia|Manihiki|Manuae|Mauke|Mitiaro|Nassau Island|Palmerston|Penrhyn|Pukapuka|Rakahanga|Rarotonga|Suwarrow|Takutea";
s_a[53] = "Alajuela|Cartago|Guanacaste|Heredia|Limon|Puntarenas|San Jose";
s_a[54] = "Abengourou|Abidjan|Aboisso|Adiake'|Adzope|Agboville|Agnibilekrou|Ale'pe'|Bangolo|Beoumi|Biankouma|Bocanda|Bondoukou|Bongouanou|Bouafle|Bouake|Bouna|Boundiali|Dabakala|Dabon|Daloa|Danane|Daoukro|Dimbokro|Divo|Duekoue|Ferkessedougou|Gagnoa|Grand Bassam|Grand-Lahou|Guiglo|Issia|Jacqueville|Katiola|Korhogo|Lakota|Man|Mankono|Mbahiakro|Odienne|Oume|Sakassou|San-Pedro|Sassandra|Seguela|Sinfra|Soubre|Tabou|Tanda|Tiassale|Tiebissou|Tingrela|Touba|Toulepleu|Toumodi|Vavoua|Yamoussoukro|Zuenoula";
s_a[55] = "Bjelovarsko-Bilogorska Zupanija|Brodsko-Posavska Zupanija|Dubrovacko-Neretvanska Zupanija|Istarska Zupanija|Karlovacka Zupanija|Koprivnicko-Krizevacka Zupanija|Krapinsko-Zagorska Zupanija|Licko-Senjska Zupanija|Medimurska Zupanija|Osjecko-Baranjska Zupanija|Pozesko-Slavonska Zupanija|Primorsko-Goranska Zupanija|Sibensko-Kninska Zupanija|Sisacko-Moslavacka Zupanija|Splitsko-Dalmatinska Zupanija|Varazdinska Zupanija|Viroviticko-Podravska Zupanija|Vukovarsko-Srijemska Zupanija|Zadarska Zupanija|Zagreb|Zagrebacka Zupanija";
s_a[56] = "Camaguey|Ciego de Avila|Cienfuegos|Ciudad de La Habana|Granma|Guantanamo|Holguin|Isla de la Juventud|La Habana|Las Tunas|Matanzas|Pinar del Rio|Sancti Spiritus|Santiago de Cuba|Villa Clara";
s_a[57] = "Famagusta|Kyrenia|Larnaca|Limassol|Nicosia|Paphos";
s_a[58] = "Brnensky|Budejovicky|Jihlavsky|Karlovarsky|Kralovehradecky|Liberecky|Olomoucky|Ostravsky|Pardubicky|Plzensky|Praha|Stredocesky|Ustecky|Zlinsky";
s_a[59] = "Arhus|Bornholm|Fredericksberg|Frederiksborg|Fyn|Kobenhavn|Kobenhavns|Nordjylland|Ribe|Ringkobing|Roskilde|Sonderjylland|Storstrom|Vejle|Vestsjalland|Viborg";
s_a[60] = "'Ali Sabih|Dikhil|Djibouti|Obock|Tadjoura";
s_a[61] = "Saint Andrew|Saint David|Saint George|Saint John|Saint Joseph|Saint Luke|Saint Mark|Saint Patrick|Saint Paul|Saint Peter";
s_a[62] = "Azua|Baoruco|Barahona|Dajabon|Distrito Nacional|Duarte|El Seibo|Elias Pina|Espaillat|Hato Mayor|Independencia|La Altagracia|La Romana|La Vega|Maria Trinidad Sanchez|Monsenor Nouel|Monte Cristi|Monte Plata|Pedernales|Peravia|Puerto Plata|Salcedo|Samana|San Cristobal|San Juan|San Pedro de Macoris|Sanchez Ramirez|Santiago|Santiago Rodriguez|Valverde";
//<!-- -->
s_a[63] = "Azuay|Bolivar|Canar|Carchi|Chimborazo|Cotopaxi|El Oro|Esmeraldas|Galapagos|Guayas|Imbabura|Loja|Los Rios|Manabi|Morona-Santiago|Napo|Orellana|Pastaza|Pichincha|Sucumbios|Tungurahua|Zamora-Chinchipe";
s_a[64] = "Ad Daqahliyah|Al Bahr al Ahmar|Al Buhayrah|Al Fayyum|Al Gharbiyah|Al Iskandariyah|Al Isma'iliyah|Al Jizah|Al Minufiyah|Al Minya|Al Qahirah|Al Qalyubiyah|Al Wadi al Jadid|As Suways|Ash Sharqiyah|Aswan|Asyut|Bani Suwayf|Bur Sa'id|Dumyat|Janub Sina'|Kafr ash Shaykh|Matruh|Qina|Shamal Sina'|Suhaj";
s_a[65] = "Ahuachapan|Cabanas|Chalatenango|Cuscatlan|La Libertad|La Paz|La Union|Morazan|San Miguel|San Salvador|San Vicente|Santa Ana|Sonsonate|Usulutan";
s_a[66] = "Annobon|Bioko Norte|Bioko Sur|Centro Sur|Kie-Ntem|Litoral|Wele-Nzas";
s_a[67] = "Akale Guzay|Barka|Denkel|Hamasen|Sahil|Semhar|Senhit|Seraye";
s_a[68] = "Harjumaa (Tallinn)|Hiiumaa (Kardla)|Ida-Virumaa (Johvi)|Jarvamaa (Paide)|Jogevamaa (Jogeva)|Laane-Virumaa (Rakvere)|Laanemaa (Haapsalu)|Parnumaa (Parnu)|Polvamaa (Polva)|Raplamaa (Rapla)|Saaremaa (Kuessaare)|Tartumaa (Tartu)|Valgamaa (Valga)|Viljandimaa (Viljandi)|Vorumaa (Voru)"
s_a[69] = "Adis Abeba (Addis Ababa)|Afar|Amara|Dire Dawa|Gambela Hizboch|Hareri Hizb|Oromiya|Sumale|Tigray|YeDebub Biheroch Bihereseboch na Hizboch";
s_a[70] = "Europa Island";
s_a[71] = "Falkland Islands (Islas Malvinas)"
s_a[72] = "Bordoy|Eysturoy|Mykines|Sandoy|Skuvoy|Streymoy|Suduroy|Tvoroyri|Vagar";
s_a[73] = "Central|Eastern|Northern|Rotuma|Western";
s_a[74] = "Aland|Etela-Suomen Laani|Ita-Suomen Laani|Lansi-Suomen Laani|Lappi|Oulun Laani";
s_a[75] = "Alsace|Aquitaine|Auvergne|Basse-Normandie|Bourgogne|Bretagne|Centre|Champagne-Ardenne|Corse|Franche-Comte|Haute-Normandie|Ile-de-France|Languedoc-Roussillon|Limousin|Lorraine|Midi-Pyrenees|Nord-Pas-de-Calais|Pays de la Loire|Picardie|Poitou-Charentes|Provence-Alpes-Cote d'Azur|Rhone-Alpes";
s_a[76] = "French Guiana";
s_a[77] = "Archipel des Marquises|Archipel des Tuamotu|Archipel des Tubuai|Iles du Vent|Iles Sous-le-Vent";
s_a[78] = "Adelie Land|Ile Crozet|Iles Kerguelen|Iles Saint-Paul et Amsterdam";
s_a[79] = "Estuaire|Haut-Ogooue|Moyen-Ogooue|Ngounie|Nyanga|Ogooue-Ivindo|Ogooue-Lolo|Ogooue-Maritime|Woleu-Ntem";
s_a[80] = "Banjul|Central River|Lower River|North Bank|Upper River|Western";
s_a[81] = "Gaza Strip";
s_a[82] = "Abashis|Abkhazia or Ap'khazet'is Avtonomiuri Respublika (Sokhumi)|Adigenis|Ajaria or Acharis Avtonomiuri Respublika (Bat'umi)|Akhalgoris|Akhalk'alak'is|Akhalts'ikhis|Akhmetis|Ambrolauris|Aspindzis|Baghdat'is|Bolnisis|Borjomis|Ch'khorotsqus|Ch'okhatauris|Chiat'ura|Dedop'listsqaros|Dmanisis|Dushet'is|Gardabanis|Gori|Goris|Gurjaanis|Javis|K'arelis|K'ut'aisi|Kaspis|Kharagaulis|Khashuris|Khobis|Khonis|Lagodekhis|Lanch'khut'is|Lentekhis|Marneulis|Martvilis|Mestiis|Mts'khet'is|Ninotsmindis|Onis|Ozurget'is|P'ot'i|Qazbegis|Qvarlis|Rust'avi|Sach'kheris|Sagarejos|Samtrediis|Senakis|Sighnaghis|T'bilisi|T'elavis|T'erjolis|T'et'ritsqaros|T'ianet'is|Tqibuli|Ts'ageris|Tsalenjikhis|Tsalkis|Tsqaltubo|Vanis|Zestap'onis|Zugdidi|Zugdidis";
s_a[83] = "Baden-Wuerttemberg|Bayern|Berlin|Brandenburg|Bremen|Hamburg|Hessen|Mecklenburg-Vorpommern|Niedersachsen|Nordrhein-Westfalen|Rheinland-Pfalz|Saarland|Sachsen|Sachsen-Anhalt|Schleswig-Holstein|Thueringen";
s_a[84] = "Ashanti|Brong-Ahafo|Central|Eastern|Greater Accra|Northern|Upper East|Upper West|Volta|Western";
s_a[85] = "Gibraltar";
s_a[86] = "Ile du Lys|Ile Glorieuse";
s_a[87] = "Aitolia kai Akarnania|Akhaia|Argolis|Arkadhia|Arta|Attiki|Ayion Oros (Mt. Athos)|Dhodhekanisos|Drama|Evritania|Evros|Evvoia|Florina|Fokis|Fthiotis|Grevena|Ilia|Imathia|Ioannina|Irakleion|Kardhitsa|Kastoria|Kavala|Kefallinia|Kerkyra|Khalkidhiki|Khania|Khios|Kikladhes|Kilkis|Korinthia|Kozani|Lakonia|Larisa|Lasithi|Lesvos|Levkas|Magnisia|Messinia|Pella|Pieria|Preveza|Rethimni|Rodhopi|Samos|Serrai|Thesprotia|Thessaloniki|Trikala|Voiotia|Xanthi|Zakinthos";
s_a[88] = "Avannaa (Nordgronland)|Kitaa (Vestgronland)|Tunu (Ostgronland)"
s_a[89] = "Carriacou and Petit Martinique|Saint Andrew|Saint David|Saint George|Saint John|Saint Mark|Saint Patrick";
s_a[90] = "Basse-Terre|Grande-Terre|Iles de la Petite Terre|Iles des Saintes|Marie-Galante";
s_a[91] = "Guam";
s_a[92] = "Alta Verapaz|Baja Verapaz|Chimaltenango|Chiquimula|El Progreso|Escuintla|Guatemala|Huehuetenango|Izabal|Jalapa|Jutiapa|Peten|Quetzaltenango|Quiche|Retalhuleu|Sacatepequez|San Marcos|Santa Rosa|Solola|Suchitepequez|Totonicapan|Zacapa";
s_a[93] = "Castel|Forest|St. Andrew|St. Martin|St. Peter Port|St. Pierre du Bois|St. Sampson|St. Saviour|Torteval|Vale";
s_a[94] = "Beyla|Boffa|Boke|Conakry|Coyah|Dabola|Dalaba|Dinguiraye|Dubreka|Faranah|Forecariah|Fria|Gaoual|Gueckedou|Kankan|Kerouane|Kindia|Kissidougou|Koubia|Koundara|Kouroussa|Labe|Lelouma|Lola|Macenta|Mali|Mamou|Mandiana|Nzerekore|Pita|Siguiri|Telimele|Tougue|Yomou";
s_a[95] = "Bafata|Biombo|Bissau|Bolama-Bijagos|Cacheu|Gabu|Oio|Quinara|Tombali";
s_a[96] = "Barima-Waini|Cuyuni-Mazaruni|Demerara-Mahaica|East Berbice-Corentyne|Essequibo Islands-West Demerara|Mahaica-Berbice|Pomeroon-Supenaam|Potaro-Siparuni|Upper Demerara-Berbice|Upper Takutu-Upper Essequibo";
s_a[97] = "Artibonite|Centre|Grand'Anse|Nord|Nord-Est|Nord-Ouest|Ouest|Sud|Sud-Est";
s_a[98] = "Heard Island and McDonald Islands";
s_a[99] = "Holy See (Vatican City)"
s_a[100] = "Atlantida|Choluteca|Colon|Comayagua|Copan|Cortes|El Paraiso|Francisco Morazan|Gracias a Dios|Intibuca|Islas de la Bahia|La Paz|Lempira|Ocotepeque|Olancho|Santa Barbara|Valle|Yoro";
s_a[101] = "Hong Kong";
s_a[102] = "Howland Island";
s_a[103] = "Bacs-Kiskun|Baranya|Bekes|Bekescsaba|Borsod-Abauj-Zemplen|Budapest|Csongrad|Debrecen|Dunaujvaros|Eger|Fejer|Gyor|Gyor-Moson-Sopron|Hajdu-Bihar|Heves|Hodmezovasarhely|Jasz-Nagykun-Szolnok|Kaposvar|Kecskemet|Komarom-Esztergom|Miskolc|Nagykanizsa|Nograd|Nyiregyhaza|Pecs|Pest|Somogy|Sopron|Szabolcs-Szatmar-Bereg|Szeged|Szekesfehervar|Szolnok|Szombathely|Tatabanya|Tolna|Vas|Veszprem|Veszprem|Zala|Zalaegerszeg";
s_a[104] = "Akranes|Akureyri|Arnessysla|Austur-Bardhastrandarsysla|Austur-Hunavatnssysla|Austur-Skaftafellssysla|Borgarfjardharsysla|Dalasysla|Eyjafjardharsysla|Gullbringusysla|Hafnarfjordhur|Husavik|Isafjordhur|Keflavik|Kjosarsysla|Kopavogur|Myrasysla|Neskaupstadhur|Nordhur-Isafjardharsysla|Nordhur-Mulasys-la|Nordhur-Thingeyjarsysla|Olafsfjordhur|Rangarvallasysla|Reykjavik|Saudharkrokur|Seydhisfjordhur|Siglufjordhur|Skagafjardharsysla|Snaefellsnes-og Hnappadalssysla|Strandasysla|Sudhur-Mulasysla|Sudhur-Thingeyjarsysla|Vesttmannaeyjar|Vestur-Bardhastrandarsysla|Vestur-Hunavatnssysla|Vestur-Isafjardharsysla|Vestur-Skaftafellssysla";
s_a[105] = "Andaman and Nicobar Islands|Andhra Pradesh|Arunachal Pradesh|Assam|Bihar|Chandigarh|Chhattisgarh|Dadra and Nagar Haveli|Daman and Diu|Delhi|Goa|Gujarat|Haryana|Himachal Pradesh|Jammu and Kashmir|Jharkhand|Karnataka|Kerala|Lakshadweep|Madhya Pradesh|Maharashtra|Manipur|Meghalaya|Mizoram|Nagaland|Orissa|Pondicherry|Punjab|Rajasthan|Sikkim|Tamil Nadu|Tripura|Uttar Pradesh|Uttaranchal|West Bengal";
s_a[106] = "Aceh|Bali|Banten|Bengkulu|East Timor|Gorontalo|Irian Jaya|Jakarta Raya|Jambi|Jawa Barat|Jawa Tengah|Jawa Timur|Kalimantan Barat|Kalimantan Selatan|Kalimantan Tengah|Kalimantan Timur|Kepulauan Bangka Belitung|Lampung|Maluku|Maluku Utara|Nusa Tenggara Barat|Nusa Tenggara Timur|Riau|Sulawesi Selatan|Sulawesi Tengah|Sulawesi Tenggara|Sulawesi Utara|Sumatera Barat|Sumatera Selatan|Sumatera Utara|Yogyakarta";
s_a[107] = "Ardabil|Azarbayjan-e Gharbi|Azarbayjan-e Sharqi|Bushehr|Chahar Mahall va Bakhtiari|Esfahan|Fars|Gilan|Golestan|Hamadan|Hormozgan|Ilam|Kerman|Kermanshah|Khorasan|Khuzestan|Kohgiluyeh va Buyer Ahmad|Kordestan|Lorestan|Markazi|Mazandaran|Qazvin|Qom|Semnan|Sistan va Baluchestan|Tehran|Yazd|Zanjan";
s_a[108] = "Al Anbar|Al Basrah|Al Muthanna|Al Qadisiyah|An Najaf|Arbil|As Sulaymaniyah|At Ta'mim|Babil|Baghdad|Dahuk|Dhi Qar|Diyala|Karbala'|Maysan|Ninawa|Salah ad Din|Wasit";
s_a[109] = "Carlow|Cavan|Clare|Cork|Donegal|Dublin|Galway|Kerry|Kildare|Kilkenny|Laois|Leitrim|Limerick|Longford|Louth|Mayo|Meath|Monaghan|Offaly|Roscommon|Sligo|Tipperary|Waterford|Westmeath|Wexford|Wicklow";
s_a[110] = "Antrim|Ards|Armagh|Ballymena|Ballymoney|Banbridge|Belfast|Carrickfergus|Castlereagh|Coleraine|Cookstown|Craigavon|Derry|Down|Dungannon|Fermanagh|Larne|Limavady|Lisburn|Magherafelt|Moyle|Newry and Mourne|Newtownabbey|North Down|Omagh|Strabane";
s_a[111] = "Central|Haifa|Jerusalem|Northern|Southern|Tel Aviv";
s_a[112] = "Abruzzo|Basilicata|Calabria|Campania|Emilia-Romagna|Friuli-Venezia Giulia|Lazio|Liguria|Lombardia|Marche|Molise|Piemonte|Puglia|Sardegna|Sicilia|Toscana|Trentino-Alto Adige|Umbria|Valle d'Aosta|Veneto";
s_a[113] = "Clarendon|Hanover|Kingston|Manchester|Portland|Saint Andrew|Saint Ann|Saint Catherine|Saint Elizabeth|Saint James|Saint Mary|Saint Thomas|Trelawny|Westmoreland";
s_a[114] = "Jan Mayen";
s_a[115] = "Aichi|Akita|Aomori|Chiba|Ehime|Fukui|Fukuoka|Fukushima|Gifu|Gumma|Hiroshima|Hokkaido|Hyogo|Ibaraki|Ishikawa|Iwate|Kagawa|Kagoshima|Kanagawa|Kochi|Kumamoto|Kyoto|Mie|Miyagi|Miyazaki|Nagano|Nagasaki|Nara|Niigata|Oita|Okayama|Okinawa|Osaka|Saga|Saitama|Shiga|Shimane|Shizuoka|Tochigi|Tokushima|Tokyo|Tottori|Toyama|Wakayama|Yamagata|Yamaguchi|Yamanashi";
s_a[116] = "Jarvis Island";
s_a[117] = "Jersey";
s_a[118] = "Johnston Atoll";
s_a[119] = "'Amman|Ajlun|Al 'Aqabah|Al Balqa'|Al Karak|Al Mafraq|At Tafilah|Az Zarqa'|Irbid|Jarash|Ma'an|Madaba";
s_a[120] = "Juan de Nova Island";
s_a[121] = "Almaty|Aqmola|Aqtobe|Astana|Atyrau|Batys Qazaqstan|Bayqongyr|Mangghystau|Ongtustik Qazaqstan|Pavlodar|Qaraghandy|Qostanay|Qyzylorda|Shyghys Qazaqstan|Soltustik Qazaqstan|Zhambyl";
s_a[122] = "Central|Coast|Eastern|Nairobi Area|North Eastern|Nyanza|Rift Valley|Western";
s_a[123] = "Abaiang|Abemama|Aranuka|Arorae|Banaba|Banaba|Beru|Butaritari|Central Gilberts|Gilbert Islands|Kanton|Kiritimati|Kuria|Line Islands|Line Islands|Maiana|Makin|Marakei|Nikunau|Nonouti|Northern Gilberts|Onotoa|Phoenix Islands|Southern Gilberts|Tabiteuea|Tabuaeran|Tamana|Tarawa|Tarawa|Teraina";
s_a[124] = "Chagang-do (Chagang Province)|Hamgyong-bukto (North Hamgyong Province)|Hamgyong-namdo (South Hamgyong Province)|Hwanghae-bukto (North Hwanghae Province)|Hwanghae-namdo (South Hwanghae Province)|Kaesong-si (Kaesong City)|Kangwon-do (Kangwon Province)|Namp'o-si (Namp'o City)|P'yongan-bukto (North P'yongan Province)|P'yongan-namdo (South P'yongan Province)|P'yongyang-si (P'yongyang City)|Yanggang-do (Yanggang Province)"
s_a[125] = "Ch'ungch'ong-bukto|Ch'ungch'ong-namdo|Cheju-do|Cholla-bukto|Cholla-namdo|Inch'on-gwangyoksi|Kangwon-do|Kwangju-gwangyoksi|Kyonggi-do|Kyongsang-bukto|Kyongsang-namdo|Pusan-gwangyoksi|Soul-t'ukpyolsi|Taegu-gwangyoksi|Taejon-gwangyoksi|Ulsan-gwangyoksi";
s_a[126] = "Al 'Asimah|Al Ahmadi|Al Farwaniyah|Al Jahra'|Hawalli";
s_a[127] = "Batken Oblasty|Bishkek Shaary|Chuy Oblasty (Bishkek)|Jalal-Abad Oblasty|Naryn Oblasty|Osh Oblasty|Talas Oblasty|Ysyk-Kol Oblasty (Karakol)"
s_a[128] = "Attapu|Bokeo|Bolikhamxai|Champasak|Houaphan|Khammouan|Louangnamtha|Louangphabang|Oudomxai|Phongsali|Salavan|Savannakhet|Viangchan|Viangchan|Xaignabouli|Xaisomboun|Xekong|Xiangkhoang";
s_a[129] = "Aizkraukles Rajons|Aluksnes Rajons|Balvu Rajons|Bauskas Rajons|Cesu Rajons|Daugavpils|Daugavpils Rajons|Dobeles Rajons|Gulbenes Rajons|Jekabpils Rajons|Jelgava|Jelgavas Rajons|Jurmala|Kraslavas Rajons|Kuldigas Rajons|Leipaja|Liepajas Rajons|Limbazu Rajons|Ludzas Rajons|Madonas Rajons|Ogres Rajons|Preilu Rajons|Rezekne|Rezeknes Rajons|Riga|Rigas Rajons|Saldus Rajons|Talsu Rajons|Tukuma Rajons|Valkas Rajons|Valmieras Rajons|Ventspils|Ventspils Rajons";
s_a[130] = "Beyrouth|Ech Chimal|Ej Jnoub|El Bekaa|Jabal Loubnane";
s_a[131] = "Berea|Butha-Buthe|Leribe|Mafeteng|Maseru|Mohales Hoek|Mokhotlong|Qacha's Nek|Quthing|Thaba-Tseka";
s_a[132] = "Bomi|Bong|Grand Bassa|Grand Cape Mount|Grand Gedeh|Grand Kru|Lofa|Margibi|Maryland|Montserrado|Nimba|River Cess|Sinoe";
s_a[133] = "Ajdabiya|Al 'Aziziyah|Al Fatih|Al Jabal al Akhdar|Al Jufrah|Al Khums|Al Kufrah|An Nuqat al Khams|Ash Shati'|Awbari|Az Zawiyah|Banghazi|Darnah|Ghadamis|Gharyan|Misratah|Murzuq|Sabha|Sawfajjin|Surt|Tarabulus|Tarhunah|Tubruq|Yafran|Zlitan";
s_a[134] = "Balzers|Eschen|Gamprin|Mauren|Planken|Ruggell|Schaan|Schellenberg|Triesen|Triesenberg|Vaduz";
s_a[135] = "Akmenes Rajonas|Alytaus Rajonas|Alytus|Anyksciu Rajonas|Birstonas|Birzu Rajonas|Druskininkai|Ignalinos Rajonas|Jonavos Rajonas|Joniskio Rajonas|Jurbarko Rajonas|Kaisiadoriu Rajonas|Kaunas|Kauno Rajonas|Kedainiu Rajonas|Kelmes Rajonas|Klaipeda|Klaipedos Rajonas|Kretingos Rajonas|Kupiskio Rajonas|Lazdiju Rajonas|Marijampole|Marijampoles Rajonas|Mazeikiu Rajonas|Moletu Rajonas|Neringa Pakruojo Rajonas|Palanga|Panevezio Rajonas|Panevezys|Pasvalio Rajonas|Plunges Rajonas|Prienu Rajonas|Radviliskio Rajonas|Raseiniu Rajonas|Rokiskio Rajonas|Sakiu Rajonas|Salcininku Rajonas|Siauliai|Siauliu Rajonas|Silales Rajonas|Silutes Rajonas|Sirvintu Rajonas|Skuodo Rajonas|Svencioniu Rajonas|Taurages Rajonas|Telsiu Rajonas|Traku Rajonas|Ukmerges Rajonas|Utenos Rajonas|Varenos Rajonas|Vilkaviskio Rajonas|Vilniaus Rajonas|Vilnius|Zarasu Rajonas";
s_a[136] = "Diekirch|Grevenmacher|Luxembourg";
s_a[137] = "Macau";
s_a[138] = "Aracinovo|Bac|Belcista|Berovo|Bistrica|Bitola|Blatec|Bogdanci|Bogomila|Bogovinje|Bosilovo|Brvenica|Cair (Skopje)|Capari|Caska|Cegrane|Centar (Skopje)|Centar Zupa|Cesinovo|Cucer-Sandevo|Debar|Delcevo|Delogozdi|Demir Hisar|Demir Kapija|Dobrusevo|Dolna Banjica|Dolneni|Dorce Petrov (Skopje)|Drugovo|Dzepciste|Gazi Baba (Skopje)|Gevgelija|Gostivar|Gradsko|Ilinden|Izvor|Jegunovce|Kamenjane|Karbinci|Karpos (Skopje)|Kavadarci|Kicevo|Kisela Voda (Skopje)|Klecevce|Kocani|Konce|Kondovo|Konopiste|Kosel|Kratovo|Kriva Palanka|Krivogastani|Krusevo|Kuklis|Kukurecani|Kumanovo|Labunista|Lipkovo|Lozovo|Lukovo|Makedonska Kamenica|Makedonski Brod|Mavrovi Anovi|Meseista|Miravci|Mogila|Murtino|Negotino|Negotino-Poloska|Novaci|Novo Selo|Oblesevo|Ohrid|Orasac|Orizari|Oslomej|Pehcevo|Petrovec|Plasnia|Podares|Prilep|Probistip|Radovis|Rankovce|Resen|Rosoman|Rostusa|Samokov|Saraj|Sipkovica|Sopiste|Sopotnika|Srbinovo|Star Dojran|Staravina|Staro Nagoricane|Stip|Struga|Strumica|Studenicani|Suto Orizari (Skopje)|Sveti Nikole|Tearce|Tetovo|Topolcani|Valandovo|Vasilevo|Veles|Velesta|Vevcani|Vinica|Vitoliste|Vranestica|Vrapciste|Vratnica|Vrutok|Zajas|Zelenikovo|Zileno|Zitose|Zletovo|Zrnovci";
s_a[139] = "Antananarivo|Antsiranana|Fianarantsoa|Mahajanga|Toamasina|Toliara";
s_a[140] = "Balaka|Blantyre|Chikwawa|Chiradzulu|Chitipa|Dedza|Dowa|Karonga|Kasungu|Likoma|Lilongwe|Machinga (Kasupe)|Mangochi|Mchinji|Mulanje|Mwanza|Mzimba|Nkhata Bay|Nkhotakota|Nsanje|Ntcheu|Ntchisi|Phalombe|Rumphi|Salima|Thyolo|Zomba";
s_a[141] = "Johor|Kedah|Kelantan|Labuan|Melaka|Negeri Sembilan|Pahang|Perak|Perlis|Pulau Pinang|Sabah|Sarawak|Selangor|Terengganu|Wilayah Persekutuan";
s_a[142] = "Alifu|Baa|Dhaalu|Faafu|Gaafu Alifu|Gaafu Dhaalu|Gnaviyani|Haa Alifu|Haa Dhaalu|Kaafu|Laamu|Lhaviyani|Maale|Meemu|Noonu|Raa|Seenu|Shaviyani|Thaa|Vaavu";
s_a[143] = "Gao|Kayes|Kidal|Koulikoro|Mopti|Segou|Sikasso|Tombouctou";
s_a[144] = "Valletta";
s_a[145] = "Man, Isle of";
s_a[146] = "Ailinginae|Ailinglaplap|Ailuk|Arno|Aur|Bikar|Bikini|Bokak|Ebon|Enewetak|Erikub|Jabat|Jaluit|Jemo|Kili|Kwajalein|Lae|Lib|Likiep|Majuro|Maloelap|Mejit|Mili|Namorik|Namu|Rongelap|Rongrik|Toke|Ujae|Ujelang|Utirik|Wotho|Wotje";
s_a[147] = "Martinique";
s_a[148] = "Adrar|Assaba|Brakna|Dakhlet Nouadhibou|Gorgol|Guidimaka|Hodh Ech Chargui|Hodh El Gharbi|Inchiri|Nouakchott|Tagant|Tiris Zemmour|Trarza";
s_a[149] = "Agalega Islands|Black River|Cargados Carajos Shoals|Flacq|Grand Port|Moka|Pamplemousses|Plaines Wilhems|Port Louis|Riviere du Rempart|Rodrigues|Savanne";
s_a[150] = "Mayotte";
s_a[151] = "Aguascalientes|Baja California|Baja California Sur|Campeche|Chiapas|Chihuahua|Coahuila de Zaragoza|Colima|Distrito Federal|Durango|Guanajuato|Guerrero|Hidalgo|Jalisco|Mexico|Michoacan de Ocampo|Morelos|Nayarit|Nuevo Leon|Oaxaca|Puebla|Queretaro de Arteaga|Quintana Roo|San Luis Potosi|Sinaloa|Sonora|Tabasco|Tamaulipas|Tlaxcala|Veracruz-Llave|Yucatan|Zacatecas";
s_a[152] = "Chuuk (Truk)|Kosrae|Pohnpei|Yap";
s_a[153] = "Midway Islands";
s_a[154] = "Balti|Cahul|Chisinau|Chisinau|Dubasari|Edinet|Gagauzia|Lapusna|Orhei|Soroca|Tighina|Ungheni";
s_a[155] = "Fontvieille|La Condamine|Monaco-Ville|Monte-Carlo";
s_a[156] = "Arhangay|Bayan-Olgiy|Bayanhongor|Bulgan|Darhan|Dornod|Dornogovi|Dundgovi|Dzavhan|Erdenet|Govi-Altay|Hentiy|Hovd|Hovsgol|Omnogovi|Ovorhangay|Selenge|Suhbaatar|Tov|Ulaanbaatar|Uvs";
s_a[157] = "Saint Anthony|Saint Georges|Saint Peter's";
s_a[158] = "Agadir|Al Hoceima|Azilal|Ben Slimane|Beni Mellal|Boulemane|Casablanca|Chaouen|El Jadida|El Kelaa des Srarhna|Er Rachidia|Essaouira|Fes|Figuig|Guelmim|Ifrane|Kenitra|Khemisset|Khenifra|Khouribga|Laayoune|Larache|Marrakech|Meknes|Nador|Ouarzazate|Oujda|Rabat-Sale|Safi|Settat|Sidi Kacem|Tan-Tan|Tanger|Taounate|Taroudannt|Tata|Taza|Tetouan|Tiznit";
s_a[159] = "Cabo Delgado|Gaza|Inhambane|Manica|Maputo|Nampula|Niassa|Sofala|Tete|Zambezia";
s_a[160] = "Caprivi|Erongo|Hardap|Karas|Khomas|Kunene|Ohangwena|Okavango|Omaheke|Omusati|Oshana|Oshikoto|Otjozondjupa";
s_a[161] = "Aiwo|Anabar|Anetan|Anibare|Baiti|Boe|Buada|Denigomodu|Ewa|Ijuw|Meneng|Nibok|Uaboe|Yaren";
s_a[162] = "Bagmati|Bheri|Dhawalagiri|Gandaki|Janakpur|Karnali|Kosi|Lumbini|Mahakali|Mechi|Narayani|Rapti|Sagarmatha|Seti";
s_a[163] = "Drenthe|Flevoland|Friesland|Gelderland|Groningen|Limburg|Noord-Brabant|Noord-Holland|Overijssel|Utrecht|Zeeland|Zuid-Holland";
s_a[164] = "Netherlands Antilles";
s_a[165] = "Iles Loyaute|Nord|Sud";
s_a[166] = "Akaroa|Amuri|Ashburton|Bay of Islands|Bruce|Buller|Chatham Islands|Cheviot|Clifton|Clutha|Cook|Dannevirke|Egmont|Eketahuna|Ellesmere|Eltham|Eyre|Featherston|Franklin|Golden Bay|Great Barrier Island|Grey|Hauraki Plains|Hawera|Hawke's Bay|Heathcote|Hikurangi|Hobson|Hokianga|Horowhenua|Hurunui|Hutt|Inangahua|Inglewood|Kaikoura|Kairanga|Kiwitea|Lake|Mackenzie|Malvern|Manaia|Manawatu|Mangonui|Maniototo|Marlborough|Masterton|Matamata|Mount Herbert|Ohinemuri|Opotiki|Oroua|Otamatea|Otorohanga|Oxford|Pahiatua|Paparua|Patea|Piako|Pohangina|Raglan|Rangiora|Rangitikei|Rodney|Rotorua|Runanga|Saint Kilda|Silverpeaks|Southland|Stewart Island|Stratford|Strathallan|Taranaki|Taumarunui|Taupo|Tauranga|Thames-Coromandel|Tuapeka|Vincent|Waiapu|Waiheke|Waihemo|Waikato|Waikohu|Waimairi|Waimarino|Waimate|Waimate West|Waimea|Waipa|Waipawa|Waipukurau|Wairarapa South|Wairewa|Wairoa|Waitaki|Waitomo|Waitotara|Wallace|Wanganui|Waverley|Westland|Whakatane|Whangarei|Whangaroa|Woodville";
s_a[167] = "Atlantico Norte|Atlantico Sur|Boaco|Carazo|Chinandega|Chontales|Esteli|Granada|Jinotega|Leon|Madriz|Managua|Masaya|Matagalpa|Nueva Segovia|Rio San Juan|Rivas";
s_a[168] = "Agadez|Diffa|Dosso|Maradi|Niamey|Tahoua|Tillaberi|Zinder";
s_a[169] = "Abia|Abuja Federal Capital Territory|Adamawa|Akwa Ibom|Anambra|Bauchi|Bayelsa|Benue|Borno|Cross River|Delta|Ebonyi|Edo|Ekiti|Enugu|Gombe|Imo|Jigawa|Kaduna|Kano|Katsina|Kebbi|Kogi|Kwara|Lagos|Nassarawa|Niger|Ogun|Ondo|Osun|Oyo|Plateau|Rivers|Sokoto|Taraba|Yobe|Zamfara";
s_a[170] = "Niue";
s_a[171] = "Norfolk Island";
s_a[172] = "Northern Islands|Rota|Saipan|Tinian";
s_a[173] = "Akershus|Aust-Agder|Buskerud|Finnmark|Hedmark|Hordaland|More og Romsdal|Nord-Trondelag|Nordland|Oppland|Oslo|Ostfold|Rogaland|Sogn og Fjordane|Sor-Trondelag|Telemark|Troms|Vest-Agder|Vestfold";
s_a[174] = "Ad Dakhiliyah|Al Batinah|Al Wusta|Ash Sharqiyah|Az Zahirah|Masqat|Musandam|Zufar";
s_a[175] = "Balochistan|Federally Administered Tribal Areas|Islamabad Capital Territory|North-West Frontier Province|Punjab|Sindh";
s_a[176] = "Aimeliik|Airai|Angaur|Hatobohei|Kayangel|Koror|Melekeok|Ngaraard|Ngarchelong|Ngardmau|Ngatpang|Ngchesar|Ngeremlengui|Ngiwal|Palau Island|Peleliu|Sonsoral|Tobi";
s_a[177] = "Bocas del Toro|Chiriqui|Cocle|Colon|Darien|Herrera|Los Santos|Panama|San Blas|Veraguas";
s_a[178] = "Bougainville|Central|Chimbu|East New Britain|East Sepik|Eastern Highlands|Enga|Gulf|Madang|Manus|Milne Bay|Morobe|National Capital|New Ireland|Northern|Sandaun|Southern Highlands|West New Britain|Western|Western Highlands";
s_a[179] = "Alto Paraguay|Alto Parana|Amambay|Asuncion (city)|Boqueron|Caaguazu|Caazapa|Canindeyu|Central|Concepcion|Cordillera|Guaira|Itapua|Misiones|Neembucu|Paraguari|Presidente Hayes|San Pedro";
s_a[180] = "Amazonas|Ancash|Apurimac|Arequipa|Ayacucho|Cajamarca|Callao|Cusco|Huancavelica|Huanuco|Ica|Junin|La Libertad|Lambayeque|Lima|Loreto|Madre de Dios|Moquegua|Pasco|Piura|Puno|San Martin|Tacna|Tumbes|Ucayali";
s_a[181] = "Abra|Agusan del Norte|Agusan del Sur|Aklan|Albay|Angeles|Antique|Aurora|Bacolod|Bago|Baguio|Bais|Basilan|Basilan City|Bataan|Batanes|Batangas|Batangas City|Benguet|Bohol|Bukidnon|Bulacan|Butuan|Cabanatuan|Cadiz|Cagayan|Cagayan de Oro|Calbayog|Caloocan|Camarines Norte|Camarines Sur|Camiguin|Canlaon|Capiz|Catanduanes|Cavite|Cavite City|Cebu|Cebu City|Cotabato|Dagupan|Danao|Dapitan|Davao City Davao|Davao del Sur|Davao Oriental|Dipolog|Dumaguete|Eastern Samar|General Santos|Gingoog|Ifugao|Iligan|Ilocos Norte|Ilocos Sur|Iloilo|Iloilo City|Iriga|Isabela|Kalinga-Apayao|La Carlota|La Union|Laguna|Lanao del Norte|Lanao del Sur|Laoag|Lapu-Lapu|Legaspi|Leyte|Lipa|Lucena|Maguindanao|Mandaue|Manila|Marawi|Marinduque|Masbate|Mindoro Occidental|Mindoro Oriental|Misamis Occidental|Misamis Oriental|Mountain|Naga|Negros Occidental|Negros Oriental|North Cotabato|Northern Samar|Nueva Ecija|Nueva Vizcaya|Olongapo|Ormoc|Oroquieta|Ozamis|Pagadian|Palawan|Palayan|Pampanga|Pangasinan|Pasay|Puerto Princesa|Quezon|Quezon City|Quirino|Rizal|Romblon|Roxas|Samar|San Carlos (in Negros Occidental)|San Carlos (in Pangasinan)|San Jose|San Pablo|Silay|Siquijor|Sorsogon|South Cotabato|Southern Leyte|Sultan Kudarat|Sulu|Surigao|Surigao del Norte|Surigao del Sur|Tacloban|Tagaytay|Tagbilaran|Tangub|Tarlac|Tawitawi|Toledo|Trece Martires|Zambales|Zamboanga|Zamboanga del Norte|Zamboanga del Sur";
s_a[182] = "Pitcaim Islands";
s_a[183] = "Dolnoslaskie|Kujawsko-Pomorskie|Lodzkie|Lubelskie|Lubuskie|Malopolskie|Mazowieckie|Opolskie|Podkarpackie|Podlaskie|Pomorskie|Slaskie|Swietokrzyskie|Warminsko-Mazurskie|Wielkopolskie|Zachodniopomorskie";
s_a[184] = "Acores (Azores)|Aveiro|Beja|Braga|Braganca|Castelo Branco|Coimbra|Evora|Faro|Guarda|Leiria|Lisboa|Madeira|Portalegre|Porto|Santarem|Setubal|Viana do Castelo|Vila Real|Viseu";
s_a[185] = "Adjuntas|Aguada|Aguadilla|Aguas Buenas|Aibonito|Anasco|Arecibo|Arroyo|Barceloneta|Barranquitas|Bayamon|Cabo Rojo|Caguas|Camuy|Canovanas|Carolina|Catano|Cayey|Ceiba|Ciales|Cidra|Coamo|Comerio|Corozal|Culebra|Dorado|Fajardo|Florida|Guanica|Guayama|Guayanilla|Guaynabo|Gurabo|Hatillo|Hormigueros|Humacao|Isabela|Jayuya|Juana Diaz|Juncos|Lajas|Lares|Las Marias|Las Piedras|Loiza|Luquillo|Manati|Maricao|Maunabo|Mayaguez|Moca|Morovis|Naguabo|Naranjito|Orocovis|Patillas|Penuelas|Ponce|Quebradillas|Rincon|Rio Grande|Sabana Grande|Salinas|San German|San Juan|San Lorenzo|San Sebastian|Santa Isabel|Toa Alta|Toa Baja|Trujillo Alto|Utuado|Vega Alta|Vega Baja|Vieques|Villalba|Yabucoa|Yauco";
s_a[186] = "Ad Dawhah|Al Ghuwayriyah|Al Jumayliyah|Al Khawr|Al Wakrah|Ar Rayyan|Jarayan al Batinah|Madinat ash Shamal|Umm Salal";
s_a[187] = "Reunion";
s_a[188] = "Alba|Arad|Arges|Bacau|Bihor|Bistrita-Nasaud|Botosani|Braila|Brasov|Bucuresti|Buzau|Calarasi|Caras-Severin|Cluj|Constanta|Covasna|Dimbovita|Dolj|Galati|Giurgiu|Gorj|Harghita|Hunedoara|Ialomita|Iasi|Maramures|Mehedinti|Mures|Neamt|Olt|Prahova|Salaj|Satu Mare|Sibiu|Suceava|Teleorman|Timis|Tulcea|Vaslui|Vilcea|Vrancea";
s_a[189] = "Adygeya (Maykop)|Aginskiy Buryatskiy (Aginskoye)|Altay (Gorno-Altaysk)|Altayskiy (Barnaul)|Amurskaya (Blagoveshchensk)|Arkhangel'skaya|Astrakhanskaya|Bashkortostan (Ufa)|Belgorodskaya|Bryanskaya|Buryatiya (Ulan-Ude)|Chechnya (Groznyy)|Chelyabinskaya|Chitinskaya|Chukotskiy (Anadyr')|Chuvashiya (Cheboksary)|Dagestan (Makhachkala)|Evenkiyskiy (Tura)|Ingushetiya (Nazran')|Irkutskaya|Ivanovskaya|Kabardino-Balkariya (Nal'chik)|Kaliningradskaya|Kalmykiya (Elista)|Kaluzhskaya|Kamchatskaya (Petropavlovsk-Kamchatskiy)|Karachayevo-Cherkesiya (Cherkessk)|Kareliya (Petrozavodsk)|Kemerovskaya|Khabarovskiy|Khakasiya (Abakan)|Khanty-Mansiyskiy (Khanty-Mansiysk)|Kirovskaya|Komi (Syktyvkar)|Komi-Permyatskiy (Kudymkar)|Koryakskiy (Palana)|Kostromskaya|Krasnodarskiy|Krasnoyarskiy|Kurganskaya|Kurskaya|Leningradskaya|Lipetskaya|Magadanskaya|Mariy-El (Yoshkar-Ola)|Mordoviya (Saransk)|Moskovskaya|Moskva (Moscow)|Murmanskaya|Nenetskiy (Nar'yan-Mar)|Nizhegorodskaya|Novgorodskaya|Novosibirskaya|Omskaya|Orenburgskaya|Orlovskaya (Orel)|Penzenskaya|Permskaya|Primorskiy (Vladivostok)|Pskovskaya|Rostovskaya|Ryazanskaya|Sakha (Yakutsk)|Sakhalinskaya (Yuzhno-Sakhalinsk)|Samarskaya|Sankt-Peterburg (Saint Petersburg)|Saratovskaya|Severnaya Osetiya-Alaniya [North Ossetia] (Vladikavkaz)|Smolenskaya|Stavropol'skiy|Sverdlovskaya (Yekaterinburg)|Tambovskaya|Tatarstan (Kazan')|Taymyrskiy (Dudinka)|Tomskaya|Tul'skaya|Tverskaya|Tyumenskaya|Tyva (Kyzyl)|Udmurtiya (Izhevsk)|Ul'yanovskaya|Ust'-Ordynskiy Buryatskiy (Ust'-Ordynskiy)|Vladimirskaya|Volgogradskaya|Vologodskaya|Voronezhskaya|Yamalo-Nenetskiy (Salekhard)|Yaroslavskaya|Yevreyskaya";
s_a[190] = "Butare|Byumba|Cyangugu|Gikongoro|Gisenyi|Gitarama|Kibungo|Kibuye|Kigali Rurale|Kigali-ville|Ruhengeri|Umutara";
s_a[191] = "Ascension|Saint Helena|Tristan da Cunha";
s_a[192] = "Christ Church Nichola Town|Saint Anne Sandy Point|Saint George Basseterre|Saint George Gingerland|Saint James Windward|Saint John Capisterre|Saint John Figtree|Saint Mary Cayon|Saint Paul Capisterre|Saint Paul Charlestown|Saint Peter Basseterre|Saint Thomas Lowland|Saint Thomas Middle Island|Trinity Palmetto Point";
s_a[193] = "Anse-la-Raye|Castries|Choiseul|Dauphin|Dennery|Gros Islet|Laborie|Micoud|Praslin|Soufriere|Vieux Fort";
s_a[194] = "Miquelon|Saint Pierre";
s_a[195] = "Charlotte|Grenadines|Saint Andrew|Saint David|Saint George|Saint Patrick";
s_a[196] = "A'ana|Aiga-i-le-Tai|Atua|Fa'asaleleaga|Gaga'emauga|Gagaifomauga|Palauli|Satupa'itea|Tuamasaga|Va'a-o-Fonoti|Vaisigano";
s_a[197] = "Acquaviva|Borgo Maggiore|Chiesanuova|Domagnano|Faetano|Fiorentino|Monte Giardino|San Marino|Serravalle";
s_a[198] = "Principe|Sao Tome";
s_a[199] = "'Asir|Al Bahah|Al Hudud ash Shamaliyah|Al Jawf|Al Madinah|Al Qasim|Ar Riyad|Ash Sharqiyah (Eastern Province)|Ha'il|Jizan|Makkah|Najran|Tabuk";
s_a[200] = "Aberdeen City|Aberdeenshire|Angus|Argyll and Bute|City of Edinburgh|Clackmannanshire|Dumfries and Galloway|Dundee City|East Ayrshire|East Dunbartonshire|East Lothian|East Renfrewshire|Eilean Siar (Western Isles)|Falkirk|Fife|Glasgow City|Highland|Inverclyde|Midlothian|Moray|North Ayrshire|North Lanarkshire|Orkney Islands|Perth and Kinross|Renfrewshire|Shetland Islands|South Ayrshire|South Lanarkshire|Stirling|The Scottish Borders|West Dunbartonshire|West Lothian";
s_a[201] = "Dakar|Diourbel|Fatick|Kaolack|Kolda|Louga|Saint-Louis|Tambacounda|Thies|Ziguinchor";
s_a[202] = "Anse aux Pins|Anse Boileau|Anse Etoile|Anse Louis|Anse Royale|Baie Lazare|Baie Sainte Anne|Beau Vallon|Bel Air|Bel Ombre|Cascade|Glacis|Grand' Anse (on Mahe)|Grand' Anse (on Praslin)|La Digue|La Riviere Anglaise|Mont Buxton|Mont Fleuri|Plaisance|Pointe La Rue|Port Glaud|Saint Louis|Takamaka";
s_a[203] = "Eastern|Northern|Southern|Western";
s_a[204] = "Singapore";
s_a[205] = "Banskobystricky|Bratislavsky|Kosicky|Nitriansky|Presovsky|Trenciansky|Trnavsky|Zilinsky";
s_a[206] = "Ajdovscina|Beltinci|Bled|Bohinj|Borovnica|Bovec|Brda|Brezice|Brezovica|Cankova-Tisina|Celje|Cerklje na Gorenjskem|Cerknica|Cerkno|Crensovci|Crna na Koroskem|Crnomelj|Destrnik-Trnovska Vas|Divaca|Dobrepolje|Dobrova-Horjul-Polhov Gradec|Dol pri Ljubljani|Domzale|Dornava|Dravograd|Duplek|Gorenja Vas-Poljane|Gorisnica|Gornja Radgona|Gornji Grad|Gornji Petrovci|Grosuplje|Hodos Salovci|Hrastnik|Hrpelje-Kozina|Idrija|Ig|Ilirska Bistrica|Ivancna Gorica|Izola|Jesenice|Jursinci|Kamnik|Kanal|Kidricevo|Kobarid|Kobilje|Kocevje|Komen|Koper|Kozje|Kranj|Kranjska Gora|Krsko|Kungota|Kuzma|Lasko|Lenart|Lendava|Litija|Ljubljana|Ljubno|Ljutomer|Logatec|Loska Dolina|Loski Potok|Luce|Lukovica|Majsperk|Maribor|Medvode|Menges|Metlika|Mezica|Miren-Kostanjevica|Mislinja|Moravce|Moravske Toplice|Mozirje|Murska Sobota|Muta|Naklo|Nazarje|Nova Gorica|Novo Mesto|Odranci|Ormoz|Osilnica|Pesnica|Piran|Pivka|Podcetrtek|Podvelka-Ribnica|Postojna|Preddvor|Ptuj|Puconci|Race-Fram|Radece|Radenci|Radlje ob Dravi|Radovljica|Ravne-Prevalje|Ribnica|Rogasevci|Rogaska Slatina|Rogatec|Ruse|Semic|Sencur|Sentilj|Sentjernej|Sentjur pri Celju|Sevnica|Sezana|Skocjan|Skofja Loka|Skofljica|Slovenj Gradec|Slovenska Bistrica|Slovenske Konjice|Smarje pri Jelsah|Smartno ob Paki|Sostanj|Starse|Store|Sveti Jurij|Tolmin|Trbovlje|Trebnje|Trzic|Turnisce|Velenje|Velike Lasce|Videm|Vipava|Vitanje|Vodice|Vojnik|Vrhnika|Vuzenica|Zagorje ob Savi|Zalec|Zavrc|Zelezniki|Ziri|Zrece";
s_a[207] = "Bellona|Central|Choiseul (Lauru)|Guadalcanal|Honiara|Isabel|Makira|Malaita|Rennell|Temotu|Western";
s_a[208] = "Awdal|Bakool|Banaadir|Bari|Bay|Galguduud|Gedo|Hiiraan|Jubbada Dhexe|Jubbada Hoose|Mudug|Nugaal|Sanaag|Shabeellaha Dhexe|Shabeellaha Hoose|Sool|Togdheer|Woqooyi Galbeed";
s_a[209] = "Eastern Cape|Free State|Gauteng|KwaZulu-Natal|Mpumalanga|North-West|Northern Cape|Northern Province|Western Cape";
s_a[210] = "Bird Island|Bristol Island|Clerke Rocks|Montagu Island|Saunders Island|South Georgia|Southern Thule|Traversay Islands";
s_a[211] = "Andalucia|Aragon|Asturias|Baleares (Balearic Islands)|Canarias (Canary Islands)|Cantabria|Castilla y Leon|Castilla-La Mancha|Cataluna|Ceuta|Communidad Valencian|Extremadura|Galicia|Islas Chafarinas|La Rioja|Madrid|Melilla|Murcia|Navarra|Pais Vasco (Basque Country)|Penon de Alhucemas|Penon de Velez de la Gomera";
s_a[212] = "Spratly Islands";
s_a[213] = "Central|Eastern|North Central|North Eastern|North Western|Northern|Sabaragamuwa|Southern|Uva|Western";
s_a[214] = "A'ali an Nil|Al Bahr al Ahmar|Al Buhayrat|Al Jazirah|Al Khartum|Al Qadarif|Al Wahdah|An Nil al Abyad|An Nil al Azraq|Ash Shamaliyah|Bahr al Jabal|Gharb al Istiwa'iyah|Gharb Bahr al Ghazal|Gharb Darfur|Gharb Kurdufan|Janub Darfur|Janub Kurdufan|Junqali|Kassala|Nahr an Nil|Shamal Bahr al Ghazal|Shamal Darfur|Shamal Kurdufan|Sharq al Istiwa'iyah|Sinnar|Warab";
s_a[215] = "Brokopondo|Commewijne|Coronie|Marowijne|Nickerie|Para|Paramaribo|Saramacca|Sipaliwini|Wanica";
s_a[216] = "Barentsoya|Bjornoya|Edgeoya|Hopen|Kvitoya|Nordaustandet|Prins Karls Forland|Spitsbergen";
s_a[217] = "Hhohho|Lubombo|Manzini|Shiselweni";
s_a[218] = "Blekinge|Dalarnas|Gavleborgs|Gotlands|Hallands|Jamtlands|Jonkopings|Kalmar|Kronobergs|Norrbottens|Orebro|Ostergotlands|Skane|Sodermanlands|Stockholms|Uppsala|Varmlands|Vasterbottens|Vasternorrlands|Vastmanlands|Vastra Gotalands";
s_a[219] = "Aargau|Ausser-Rhoden|Basel-Landschaft|Basel-Stadt|Bern|Fribourg|Geneve|Glarus|Graubunden|Inner-Rhoden|Jura|Luzern|Neuchatel|Nidwalden|Obwalden|Sankt Gallen|Schaffhausen|Schwyz|Solothurn|Thurgau|Ticino|Uri|Valais|Vaud|Zug|Zurich";
s_a[220] = "Al Hasakah|Al Ladhiqiyah|Al Qunaytirah|Ar Raqqah|As Suwayda'|Dar'a|Dayr az Zawr|Dimashq|Halab|Hamah|Hims|Idlib|Rif Dimashq|Tartus";
s_a[221] = "Chang-hua|Chi-lung|Chia-i|Chia-i|Chung-hsing-hsin-ts'un|Hsin-chu|Hsin-chu|Hua-lien|I-lan|Kao-hsiung|Kao-hsiung|Miao-li|Nan-t'ou|P'eng-hu|P'ing-tung|T'ai-chung|T'ai-chung|T'ai-nan|T'ai-nan|T'ai-pei|T'ai-pei|T'ai-tung|T'ao-yuan|Yun-lin";
s_a[222] = "Viloyati Khatlon|Viloyati Leninobod|Viloyati Mukhtori Kuhistoni Badakhshon";
s_a[223] = "Arusha|Dar es Salaam|Dodoma|Iringa|Kagera|Kigoma|Kilimanjaro|Lindi|Mara|Mbeya|Morogoro|Mtwara|Mwanza|Pemba North|Pemba South|Pwani|Rukwa|Ruvuma|Shinyanga|Singida|Tabora|Tanga|Zanzibar Central/South|Zanzibar North|Zanzibar Urban/West";
s_a[224] = "Amnat Charoen|Ang Thong|Buriram|Chachoengsao|Chai Nat|Chaiyaphum|Chanthaburi|Chiang Mai|Chiang Rai|Chon Buri|Chumphon|Kalasin|Kamphaeng Phet|Kanchanaburi|Khon Kaen|Krabi|Krung Thep Mahanakhon (Bangkok)|Lampang|Lamphun|Loei|Lop Buri|Mae Hong Son|Maha Sarakham|Mukdahan|Nakhon Nayok|Nakhon Pathom|Nakhon Phanom|Nakhon Ratchasima|Nakhon Sawan|Nakhon Si Thammarat|Nan|Narathiwat|Nong Bua Lamphu|Nong Khai|Nonthaburi|Pathum Thani|Pattani|Phangnga|Phatthalung|Phayao|Phetchabun|Phetchaburi|Phichit|Phitsanulok|Phra Nakhon Si Ayutthaya|Phrae|Phuket|Prachin Buri|Prachuap Khiri Khan|Ranong|Ratchaburi|Rayong|Roi Et|Sa Kaeo|Sakon Nakhon|Samut Prakan|Samut Sakhon|Samut Songkhram|Sara Buri|Satun|Sing Buri|Sisaket|Songkhla|Sukhothai|Suphan Buri|Surat Thani|Surin|Tak|Trang|Trat|Ubon Ratchathani|Udon Thani|Uthai Thani|Uttaradit|Yala|Yasothon";
s_a[225] = "Tobago";
s_a[226] = "De La Kara|Des Plateaux|Des Savanes|Du Centre|Maritime";
s_a[227] = "Atafu|Fakaofo|Nukunonu";
s_a[228] = "Ha'apai|Tongatapu|Vava'u";
s_a[229] = "Arima|Caroni|Mayaro|Nariva|Port-of-Spain|Saint Andrew|Saint David|Saint George|Saint Patrick|San Fernando|Victoria";
s_a[230] = "Ariana|Beja|Ben Arous|Bizerte|El Kef|Gabes|Gafsa|Jendouba|Kairouan|Kasserine|Kebili|Mahdia|Medenine|Monastir|Nabeul|Sfax|Sidi Bou Zid|Siliana|Sousse|Tataouine|Tozeur|Tunis|Zaghouan";
s_a[231] = "Adana|Adiyaman|Afyon|Agri|Aksaray|Amasya|Ankara|Antalya|Ardahan|Artvin|Aydin|Balikesir|Bartin|Batman|Bayburt|Bilecik|Bingol|Bitlis|Bolu|Burdur|Bursa|Canakkale|Cankiri|Corum|Denizli|Diyarbakir|Duzce|Edirne|Elazig|Erzincan|Erzurum|Eskisehir|Gaziantep|Giresun|Gumushane|Hakkari|Hatay|Icel|Igdir|Isparta|Istanbul|Izmir|Kahramanmaras|Karabuk|Karaman|Kars|Kastamonu|Kayseri|Kilis|Kirikkale|Kirklareli|Kirsehir|Kocaeli|Konya|Kutahya|Malatya|Manisa|Mardin|Mugla|Mus|Nevsehir|Nigde|Ordu|Osmaniye|Rize|Sakarya|Samsun|Sanliurfa|Siirt|Sinop|Sirnak|Sivas|Tekirdag|Tokat|Trabzon|Tunceli|Usak|Van|Yalova|Yozgat|Zonguldak";
s_a[232] = "Ahal Welayaty|Balkan Welayaty|Dashhowuz Welayaty|Lebap Welayaty|Mary Welayaty";
s_a[233] = "Tuvalu";
s_a[234] = "Adjumani|Apac|Arua|Bugiri|Bundibugyo|Bushenyi|Busia|Gulu|Hoima|Iganga|Jinja|Kabale|Kabarole|Kalangala|Kampala|Kamuli|Kapchorwa|Kasese|Katakwi|Kibale|Kiboga|Kisoro|Kitgum|Kotido|Kumi|Lira|Luwero|Masaka|Masindi|Mbale|Mbarara|Moroto|Moyo|Mpigi|Mubende|Mukono|Nakasongola|Nebbi|Ntungamo|Pallisa|Rakai|Rukungiri|Sembabule|Soroti|Tororo";
s_a[235] = "Avtonomna Respublika Krym (Simferopol')|Cherkas'ka (Cherkasy)|Chernihivs'ka (Chernihiv)|Chernivets'ka (Chernivtsi)|Dnipropetrovs'ka (Dnipropetrovs'k)|Donets'ka (Donets'k)|Ivano-Frankivs'ka (Ivano-Frankivs'k)|Kharkivs'ka (Kharkiv)|Khersons'ka (Kherson)|Khmel'nyts'ka (Khmel'nyts'kyy)|Kirovohrads'ka (Kirovohrad)|Kyyiv|Kyyivs'ka (Kiev)|L'vivs'ka (L'viv)|Luhans'ka (Luhans'k)|Mykolayivs'ka (Mykolayiv)|Odes'ka (Odesa)|Poltavs'ka (Poltava)|Rivnens'ka (Rivne)|Sevastopol'|Sums'ka (Sumy)|Ternopil's'ka (Ternopil')|Vinnyts'ka (Vinnytsya)|Volyns'ka (Luts'k)|Zakarpats'ka (Uzhhorod)|Zaporiz'ka (Zaporizhzhya)|Zhytomyrs'ka (Zhytomyr)"
s_a[236] = "'Ajman|Abu Zaby (Abu Dhabi)|Al Fujayrah|Ash Shariqah (Sharjah)|Dubayy (Dubai)|Ra's al Khaymah|Umm al Qaywayn";
s_a[237] = "Barking and Dagenham|Barnet|Barnsley|Bath and North East Somerset|Bedfordshire|Bexley|Birmingham|Blackburn with Darwen|Blackpool|Bolton|Bournemouth|Bracknell Forest|Bradford|Brent|Brighton and Hove|Bromley|Buckinghamshire|Bury|Calderdale|Cambridgeshire|Camden|Cheshire|City of Bristol|City of Kingston upon Hull|City of London|Cornwall|Coventry|Croydon|Cumbria|Darlington|Derby|Derbyshire|Devon|Doncaster|Dorset|Dudley|Durham|Ealing|East Riding of Yorkshire|East Sussex|Enfield|Essex|Gateshead|Gloucestershire|Greenwich|Hackney|Halton|Hammersmith and Fulham|Hampshire|Haringey|Harrow|Hartlepool|Havering|Herefordshire|Hertfordshire|Hillingdon|Hounslow|Isle of Wight|Islington|Kensington and Chelsea|Kent|Kingston upon Thames|Kirklees|Knowsley|Lambeth|Lancashire|Leeds|Leicester|Leicestershire|Lewisham|Lincolnshire|Liverpool|Luton|Manchester|Medway|Merton|Middlesbrough|Milton Keynes|Newcastle upon Tyne|Newham|Norfolk|North East Lincolnshire|North Lincolnshire|North Somerset|North Tyneside|North Yorkshire|Northamptonshire|Northumberland|Nottingham|Nottinghamshire|Oldham|Oxfordshire|Peterborough|Plymouth|Poole|Portsmouth|Reading|Redbridge|Redcar and Cleveland|Richmond upon Thames|Rochdale|Rotherham|Rutland|Salford|Sandwell|Sefton|Sheffield|Shropshire|Slough|Solihull|Somerset|South Gloucestershire|South Tyneside|Southampton|Southend-on-Sea|Southwark|St. Helens|Staffordshire|Stockport|Stockton-on-Tees|Stoke-on-Trent|Suffolk|Sunderland|Surrey|Sutton|Swindon|Tameside|Telford and Wrekin|Thurrock|Torbay|Tower Hamlets|Trafford|Wakefield|Walsall|Waltham Forest|Wandsworth|Warrington|Warwickshire|West Berkshire|West Sussex|Westminster|Wigan|Wiltshire|Windsor and Maidenhead|Wirral|Wokingham|Wolverhampton|Worcestershire|York";
s_a[238] = "Artigas|Canelones|Cerro Largo|Colonia|Durazno|Flores|Florida|Lavalleja|Maldonado|Montevideo|Paysandu|Rio Negro|Rivera|Rocha|Salto|San Jose|Soriano|Tacuarembo|Treinta y Tres";
s_a[239] = "Alabama|Alaska|Arizona|Arkansas|California|Colorado|Connecticut|Delaware|District of Columbia|Florida|Georgia|Hawaii|Idaho|Illinois|Indiana|Iowa|Kansas|Kentucky|Louisiana|Maine|Maryland|Massachusetts|Michigan|Minnesota|Mississippi|Missouri|Montana|Nebraska|Nevada|New Hampshire|New Jersey|New Mexico|New York|North Carolina|North Dakota|Ohio|Oklahoma|Oregon|Pennsylvania|Rhode Island|South Carolina|South Dakota|Tennessee|Texas|Utah|Vermont|Virginia|Washington|West Virginia|Wisconsin|Wyoming";
s_a[240] = "Andijon Wiloyati|Bukhoro Wiloyati|Farghona Wiloyati|Jizzakh Wiloyati|Khorazm Wiloyati (Urganch)|Namangan Wiloyati|Nawoiy Wiloyati|Qashqadaryo Wiloyati (Qarshi)|Qoraqalpoghiston (Nukus)|Samarqand Wiloyati|Sirdaryo Wiloyati (Guliston)|Surkhondaryo Wiloyati (Termiz)|Toshkent Shahri|Toshkent Wiloyati";
s_a[241] = "Malampa|Penama|Sanma|Shefa|Tafea|Torba";
s_a[242] = "Amazonas|Anzoategui|Apure|Aragua|Barinas|Bolivar|Carabobo|Cojedes|Delta Amacuro|Dependencias Federales|Distrito Federal|Falcon|Guarico|Lara|Merida|Miranda|Monagas|Nueva Esparta|Portuguesa|Sucre|Tachira|Trujillo|Vargas|Yaracuy|Zulia";
s_a[243] = "An Giang|Ba Ria-Vung Tau|Bac Giang|Bac Kan|Bac Lieu|Bac Ninh|Ben Tre|Binh Dinh|Binh Duong|Binh Phuoc|Binh Thuan|Ca Mau|Can Tho|Cao Bang|Da Nang|Dac Lak|Dong Nai|Dong Thap|Gia Lai|Ha Giang|Ha Nam|Ha Noi|Ha Tay|Ha Tinh|Hai Duong|Hai Phong|Ho Chi Minh|Hoa Binh|Hung Yen|Khanh Hoa|Kien Giang|Kon Tum|Lai Chau|Lam Dong|Lang Son|Lao Cai|Long An|Nam Dinh|Nghe An|Ninh Binh|Ninh Thuan|Phu Tho|Phu Yen|Quang Binh|Quang Nam|Quang Ngai|Quang Ninh|Quang Tri|Soc Trang|Son La|Tay Ninh|Thai Binh|Thai Nguyen|Thanh Hoa|Thua Thien-Hue|Tien Giang|Tra Vinh|Tuyen Quang|Vinh Long|Vinh Phuc|Yen Bai";
s_a[244] = "Saint Croix|Saint John|Saint Thomas";
s_a[245] = "Blaenau Gwent|Bridgend|Caerphilly|Cardiff|Carmarthenshire|Ceredigion|Conwy|Denbighshire|Flintshire|Gwynedd|Isle of Anglesey|Merthyr Tydfil|Monmouthshire|Neath Port Talbot|Newport|Pembrokeshire|Powys|Rhondda Cynon Taff|Swansea|The Vale of Glamorgan|Torfaen|Wrexham";
s_a[246] = "Alo|Sigave|Wallis";
s_a[247] = "West Bank";
s_a[248] = "Western Sahara";
s_a[249] = "'Adan|'Ataq|Abyan|Al Bayda'|Al Hudaydah|Al Jawf|Al Mahrah|Al Mahwit|Dhamar|Hadhramawt|Hajjah|Ibb|Lahij|Ma'rib|Sa'dah|San'a'|Ta'izz";
s_a[250] = "Kosovo|Montenegro|Serbia|Vojvodina";
s_a[251] = "Central|Copperbelt|Eastern|Luapula|Lusaka|North-Western|Northern|Southern|Western";
s_a[252] = "Bulawayo|Harare|ManicalandMashonaland Central|Mashonaland East|Mashonaland West|Masvingo|Matabeleland North|Matabeleland South|Midlands";


function populateStates(countryElementId, stateElementId) {

var selectedCountryIndex = document.getElementById(countryElementId).selectedIndex;

var stateElement = document.getElementById(stateElementId);

stateElement.length = 0; // Fixed by Julian Woods
stateElement.options[0] = new Option('Select State', '');
stateElement.selectedIndex = 0;

var state_arr = s_a[selectedCountryIndex].split("|");

for (var i = 0; i < state_arr.length; i++) {
    stateElement.options[stateElement.length] = new Option(state_arr[i], state_arr[i]);
}
}

function populateCountries(countryElementId, stateElementId) {
// given the id of the <select> tag as function argument, it inserts <option> tags
var countryElement = document.getElementById(countryElementId);


try {
	countryElement.length = 0; 
}
catch(err) {
}

try {
countryElement.options[0] = new Option('Select Country', '-1');
}
catch(err) {
}

try {
countryElement.selectedIndex = 0;
for (var i = 0; i < country_arr.length; i++) {
    countryElement.options[countryElement.length] = new Option(country_arr[i], country_arr[i]);
}   
}
catch(err) {
}

// Assigned all countries. Now assign event listener for the states.


try {
if (stateElementId) {
    countryElement.onchange = function () {
        populateStates(countryElementId, stateElementId);
    };
}
}
catch(err) {
}
}



populateCountries("country", "state");
populateCountries("country2");



$.validator.addMethod("valueNotEquals", function(value, element, arg){
	  return arg !== value;
	 }, "Value must not equal arg.");


});