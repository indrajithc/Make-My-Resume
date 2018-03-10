
<%@include file="header.jsp"%> 	 

	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
	%>
	  
	
	 		

<div class="graphs">
		<h4 class="text-capitalize">interesting languages</h4>

		<!-- //switches -->
		<div class="col_1">
			


			
			<div class="col-md-4 span_8">
				<div class="activity_box activity_box1">
					<h3 class="text-capitalize">language category</h3>
					<div class="scrollbar" id="style-2">
						<div class="activity-row activity-row1">
							<div class="single-bottom">
								<ul id="idoflanguage_category">
								
	<%
	
		includes.Connection con = new includes.Connection();
		
		String email = "";
		boolean issuccess = false;
		
		String query = " SELECT * FROM `language_category` WHERE  delete_status = 0  ORDER BY name DESC ";
		 
	 
				
			try {
				java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
					 
				while(rs.next()) {   
					
					out.print(	"<li data-id='"+rs.getString("id")+"'>"+
								"<input class='alanguage_category' type='checkbox'  id='language_category"+rs.getString("id")+"' value='"+rs.getString("id")+"'>"+
								"<label title='"+rs.getString("description")+"' for='brand'><span></span> "+rs.getString("name")+"</label>"+
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
						</div>
					</div>
				 
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
			
			<div class="col-md-4 span_8">
				<div class="activity_box activity_box2">
					<h3>language</h3>
					<div class="scrollbar" id="style-2">
						<div class="activity-row activity-row1">
							<div class="single-bottom">
								<ul id="idlanguage">
									
									 
									
								</ul>
							</div>
						</div>
					</div>
				 
				</div>
				<div class="clearfix"> </div>
			</div>
			
			
			
			
			
			<div class="col-md-4 span_8">
				<div class="activity_box">
					<h3 class="text-capitalize" >my interests</h3>
					<div class="scrollbar scrollbar1" id="idmylangues">
						
				<%
				
				
				String idd = "0";
				

				  con = new includes.Connection();
				
				  query = " SELECT * FROM employee WHERE username = ?  ";
				
				Object[] vo = new Object[1];
				vo[0] = user.getUserName();

				
						
						try {
							java.sql.ResultSet rs = (java.sql.ResultSet) con.display(query , vo ); 
							while(rs.next()) {
								idd = rs.getString("id");
							} 
							rs.close();
							con.preparedStatement.close (); 
							
						} catch (Exception e) {
							System.out.println(e.getMessage()); 
						} 
				
	
		  con = new includes.Connection();
		
		  email = "";
		  issuccess = false;
		
		  query = " SELECT i.*, l.description AS desca, l.name AS name FROM `interested` i LEFT JOIN language l ON i.language = l.id WHERE  i.delete_status = 0 AND i.employee="+idd+" ORDER BY i.date DESC ";
		 
	 
				
			try {
				java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
					 
				while(rs.next()) {   
					
					out.print(	"<div data-id='"+rs.getString("language")+"' class='activity-row' id='myLang"+rs.getString("language")+"'>"+
								"<div class='col-xs-9 activity-desc'>"+
								"<h5><a href='#'>"+rs.getString("name")+"</a></h5>"+
								"<p>"+rs.getString("desca")+"</p>"+
								"</div>"+
								"<div class='clearfix'> </div>"+
								"</div>"+
								"");
					
					 
						
						
					
					
				
					
				}
			 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
	
	
	
	%>							
							
						
						
						
						
					
						
						
					 
					</div>
				</div>
			</div>
			
			
			<div class="clearfix"> </div>
			
		</div>
				</div>
			<!--body wrapper start-->
		 
  
<%@include file="footer.jsp"%> 	
		
		
		
		

			 
	