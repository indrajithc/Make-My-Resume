
<%@include file="header.jsp"%> 	 

	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
	%>
	  
	
	 		

<div class="graphs">
					<h3 class="blank1">Compose Mail</h3>
					<div class="xs">
						<div class="col-md-4 email-list1">
							<ul class="collection" id="toAdminIndexId">
 
								
	<%
	
		includes.Connection con = new includes.Connection();
		
		String email = "";
		boolean issuccess = false;
		
		String query = " SELECT * FROM `say_to_admin` WHERE  delete_status = 0  ORDER BY date DESC ";
		 
	 
				
			try {
				java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
					 
				while(rs.next()) {   
					String d1 = "<i class='icon_4' title='waiting'>W</i>";
					String d2 = "waiting";
					if(rs.getInt("read") == 1){
						d1 = "<i class='icon_4 icon_6' title='readed'>R</i>";
						d2 = "readed";
						
					}
					out.print(	 
								"<li class='collection-item avatar email-unread'>"+
										d1+
								"<div class='avatar_left'>"+
								"<span class='email-title'>"+d2+"</span>"+
								"<p class='truncate grey-text ultra-small'>"+rs.getString("subject")+"</p>"+
								"</div>"+
								"<a href='#!' class='secondary-content'>"+ 
								"<time class='timeago blue-text ultra-small' datetime='"+rs.getString("date")+"'></time>"+
										
								"</a>"+
								"<div class='clearfix'> </div>"+
								"</li>"+
								""+
								"");
					
					
				}
			 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
	
	
	
	%>									
								
								 
					 	
								
							 
							</ul>
							

						</div>
						
						
						<div class="col-md-8 inbox_right">
							<div class="Compose-Message">               
								<div class="panel panel-default">
									<div class="panel-heading">
										Compose New Message 
									</div>
									<div class="panel-body panel-body-com-m">
										<div class="alert alert-info">
											Please fill details to send a new message
										</div>
										<form class="com-mail" id="sayToAdmin">
											<hr>
												<label>Enter Recipient Name : </label>
												 <label  type="text" class="form-control1 control3">To Admin</label>
												<input type="hidden" name="admin" id="admin" value="1">
												<label>Enter Subject :  </label>
												<input name="subject" id="subject" type="text" class="form-control1 control3">
												<label>Enter Message : </label>
												<textarea id="description" name="description" rows="6" class="form-control1 control2"></textarea>
											<hr>
											<input type="submit" value="Send Message">
										</form>
									</div>
								 </div>
							  </div>
						</div>
						
						
						<div class="clearfix"> </div>
					</div>
				</div>
			<!--body wrapper start-->
		 
  
<%@include file="footer.jsp"%> 	
		
		
		
		

			 
	