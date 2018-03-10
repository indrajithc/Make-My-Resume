
<%@include file="header.jsp"%> 	 

	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
	%>
	  
	
	 		

<div class="graphs">
		<h4 class="text-capitalize">newsletter</h4>

		<!-- //switches -->
		<div class="col_1">
			


			
			<div class="col-md-3  ">
				<div class="activity_box activity_box1">
					<h3 class="text-capitalize">company</h3>
					<div class="scrollbar" id="style-2">
						<div class="activity-row activity-row1">
							<div class="single-bottom">
								<ul id="alot909458">
								
	<%
	
		includes.Connection con = new includes.Connection();
		
		String email = "";
		boolean issuccess = false;
		
		String query = " SELECT * FROM `employer` WHERE  delete_status = 0  ORDER BY company DESC ";
		 
		out.print(	"<li data-id='0'>"+
				"<input class='alanguage_category' type='checkbox'  id='language_1category0 value='null'>"+
				"<label title='empty' for='brand'><span></span> no </label>"+
				"</li>"+
				""+
				"");
				
			try {
				java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
					 
				while(rs.next()) {   
					
					out.print(	"<li data-id='"+rs.getString("id")+"'>"+
								"<input class='alanguage_category' type='checkbox'  id='language_1category"+rs.getString("id")+"' value='"+rs.getString("id")+"'>"+
								"<label title='"+rs.getString("about")+"' for='brand'><span></span> "+rs.getString("company")+"</label>"+
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
			
			
			
			
			<div class="col-md-3  ">
				<div class="activity_box activity_box2">
					<h3 class="text-capitalize">category</h3>
					<div class="scrollbar" id="style-2">
						<div class="activity-row activity-row1">
							<div class="single-bottom">
								<ul id="alot909457">
								
	<%
	
		  con = new includes.Connection();
		
		  email = "";
		  issuccess = false;
		
		  query = " SELECT * FROM `job_category` WHERE  delete_status = 0  ORDER BY name DESC ";
		 
			 
			out.print(	"<li data-id='0'>"+
					"<input class='alanguage_category' type='checkbox'  id='language_2category0 value='null'>"+
					"<label title='empty' for='brand'><span></span> no </label>"+
					"</li>"+
					""+
					"");
							
				
			try {
				java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
					 
				while(rs.next()) {   
					
					out.print(	"<li data-id='"+rs.getString("id")+"'>"+
								"<input class='alanguage_category' type='checkbox'  id='language_2category"+rs.getString("id")+"' value='"+rs.getString("id")+"'>"+
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
			
 <div class="col-md-3  ">
				<div class="activity_box activity_box3">
					<h3 class="text-capitalize">education</h3>
					<div class="scrollbar" id="style-2">
						<div class="activity-row activity-row1">
							<div class="single-bottom">
								<ul id="alot909456">
								
	<%
	
		  con = new includes.Connection();
		
		  email = "";
		  issuccess = false;
		
		  query = " SELECT * FROM `education` WHERE  delete_status = 0  ORDER BY name DESC ";
		 
			 
			out.print(	"<li data-id='0'>"+
					"<input class='alanguage_category' type='checkbox'  id='language_3category0 value='null'>"+
					"<label title='empty' for='brand'><span></span> no </label>"+
					"</li>"+
					""+
					"");
				
			try {
				java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
					 
				while(rs.next()) {   
					
					out.print(	"<li data-id='"+rs.getString("id")+"'>"+
								"<input class='alanguage_category' type='checkbox'  id='language_3category"+rs.getString("id")+"' value='"+rs.getString("id")+"'>"+
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
 
			
			
			
			
			<div class="col-md-3  ">
				<div class="activity_box">
					<h3 class="text-capitalize" >my newsletters</h3>
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
		
		  query = " SELECT er.company, j.name AS category, ed.name AS education FROM `newsletter` n LEFT JOIN employer er ON er.id = n.company LEFT JOIN job_category j ON j.id = n.category LEFT JOIN education ed ON ed.id = n.education WHERE n.employee ="+idd+" ORDER BY n.date DESC LIMIT 1  ";
		 
	 
				
			try {
				java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
					 
				while(rs.next()) {   

					 try{
						 
					 
					
					if(rs.getString("company").length() >0)
					out.print(	"<div   class='activity-row'  >"+
								"<div class='col-xs-9 activity-desc'>"+
								"<h5><a href='#'> company </a></h5>"+
								"<p>"+rs.getString("company")+"</p>"+
								"</div>"+
								"<div class='clearfix'> </div>"+
								"</div>"+
								"");
					 }	catch (Exception e) {
							System.out.println(e.getMessage());
						}

					 try{
					if(rs.getString("category").length() >0)
					out.print(	"<div   class='activity-row'  >"+
								"<div class='col-xs-9 activity-desc'>"+
								"<h5><a href='#'> category </a></h5>"+
								"<p>"+rs.getString("category")+"</p>"+
								"</div>"+
								"<div class='clearfix'> </div>"+
								"</div>"+
								"");
					
				}	catch (Exception e) {
					System.out.println(e.getMessage());
				}

					 try{
					if(rs.getString("education").length() >0)
					out.print(	"<div   class='activity-row'  >"+
								"<div class='col-xs-9 activity-desc'>"+
								"<h5><a href='#'> education </a></h5>"+
								"<p>"+rs.getString("education")+"</p>"+
								"</div>"+
								"<div class='clearfix'> </div>"+
								"</div>"+
								"");
					 
			}	catch (Exception e) {
				System.out.println(e.getMessage());
			}
						
					
					
				
					
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
		
		
		
		

			 
	