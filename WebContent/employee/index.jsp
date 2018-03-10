
<%@include file="header.jsp"%> 	 

	
	<%
	  httpSession = request.getSession();
	
		user = (User)  httpSession.getAttribute("user");
		System.out.print(user);

		try{
			
	  if (user == null ) {
			System.out.print("goto login");
			String requestURL = request.getRequestURL().toString();
			String queryString = request.getQueryString();
			if (queryString != null) requestURL += "?" + queryString;
			 
			out.print("<script type='text/javascript'>"+
					"window.location.href = '"+Connection.DIRECTORY +"/employeeloginpage?referrer="+ requestURL+"';"+
					"</script>"
					
					
					
					);
			return;
		}
	} catch (Exception e) {
		response.sendRedirect(Connection.DIRECTORY +"/employeeloginpage" );
		System.out.println(e.getMessage());
	} 
	  
	%>
	  
	
	 	 <%

	includes.Connection con = new includes.Connection();
	 
	 
	
	String query = " SELECT *  FROM `employee` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

 	String id =  null;
 	String username = null;
 	String fname =  null;
 	String lname =  null;
 	String sex =  null;
 	String address =  null; 
 	String l_no =  null;
 	String mobile =  null; 
 	String image =  null; 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query);
				 
				while(rs.next()) {

				 	  id =  rs.getString("id");
				 	 username = rs.getString("username");
				 	  fname =  rs.getString("fname");
				 	  lname =  rs.getString("lname");
				 	  sex =  rs.getString("sex");
				 	 address =  rs.getString("address");  
				 	  l_no =  rs.getString("l_no");
				 	  mobile =  rs.getString("mobile"); 
				 	  image =  rs.getString("image"); 
				 	
				 	
				}
				 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			

	%>		  


	 		
			<%

			String a1 = "";
			String a2 = "";
			String a3 = "";
			int a4 = 0;
			
			
		includes.Connection  cona = new includes.Connection(); 
	  String querya = " SELECT *  FROM `newsletter` WHERE delete_status = 0 AND employee="+id+"   "; 
			try {
				 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rsa.next()) {  
					
 
					  a1 = rsa.getString("company");
					  a2 = rsa.getString("category");
					  a3 = rsa.getString("education"); 
					
				} 
				rsa.close();
				cona.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>			
				<div class="graphs">
					<div class="col_3">
						<div class="col-md-3 widget widget1">
							<div class="r3_counter_box">
								<i class="fa fa-mail-forward"></i>
								<div class="stats">
							
								  <h5 class="romed">	
				
										
										<%
 
			
		  cona = new includes.Connection(); 
	    querya = " SELECT COUNT(*) AS nono FROM `vacancies` v LEFT JOIN job j ON j.id = v.job WHERE j.category = "+a2+"  "; 
			try {
				 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rsa.next()) {  
						
					
					out.print(rsa.getString("nono"));
 	
					 a4 += Integer.parseInt(rsa.getString("nono"));
					
				} 
				rsa.close();
				cona.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>				
								
								
								
								 <span>Jobs</span></h5>
								  <div class="grow">
									<p  class="rome">category</p>
								  </div>
								</div>
							</div>
						</div>
						<div class="col-md-3 widget widget1">
							<div class="r3_counter_box">
								<i class="fa fa-users"></i>
								<div class="stats">
								 								  <h5  class="romde">	
				
										
										<%
 
			
		  cona = new includes.Connection(); 
	    querya = " SELECT COUNT(*) AS nono FROM `vacancies`   WHERE employer = "+a1+"  "; 
			try {
				 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rsa.next()) {  
						
					
					out.print(rsa.getString("nono"));
 	
					 a4 += Integer.parseInt(rsa.getString("nono"));
						
					
				} 
				rsa.close();
				cona.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>				
								
								
								
								 <span>Jobs</span></h5>
								  <div class="grow grow1">
									<p class="rome">company</p>
								  </div>
								</div>
							</div>
						</div>
						<div class="col-md-3 widget widget1">
							<div class="r3_counter_box">
								<i class="fa fa-eye"></i>
								<div class="stats">
								  <h5>	
				
										
										<%
 
			
		  cona = new includes.Connection(); 
			 querya = " SELECT COUNT(*) AS nono FROM `vacancies`   WHERE education = "+a3+"  "; 
			 try {
				 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rsa.next()) {  
						
					
					out.print(rsa.getString("nono"));
 	
					 
					 a4 += Integer.parseInt(rsa.getString("nono"));
						
				} 
				rsa.close();
				cona.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>				
								
								
								
								 <span>Jobs</span></h5>
								  <div class="grow  grow3">
									<p  class="rome">education</p>
								  </div>
								</div>
							</div>
						 </div>
						 <div class="col-md-3 widget">
							<div class="r3_counter_box">
								<i class="fa fa-usd"></i>
								<div class="stats">
								  <h5>	
				
										
										<%
 
			
		 
					
					out.print(a4);
 	 
			 
	%>				
								
								
								
								 <span>Jobs</span></h5>
								  <div class="grow grow2">
									<p>Total</p>
								  </div>
								</div>
							</div>
						</div>
						<div class="clearfix"> </div>
					</div>

 
		<!-- //switches -->
		 
				</div>
			<!--body wrapper start-->
		 
		 <script type="text/javascript">
		 console.log("fff");
		 	
		 $(document).ready( function(){
			 console.log("fff3");
			 $('.rome').click(function(){
				 console.log("fff4");
				 location.href="employee/job.jsp";
			 });
			 
		 });
		 </script>
  
<%@include file="footer.jsp"%> 	
		
		
		
		

			 
	