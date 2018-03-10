
<%@include file="header.jsp"%> 	 

	<style type="text/css">
		textarea {
			min-height: 8.4em;
		}
		td textarea {
			min-height: 4.4em;
		}
		
		.now_margin_bt-10 {
			margin-bottom: 4em;
/*    			border-bottom: 4px solid #baaaaa; */
		}
		
		p.form-control1, .form-control_2.input-sm {
  		  border: none;
   	}
	</style>
	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
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










  	       <h3>vacancies</h3>
	
	
	<div class="row">
		<div class="col-md-12">
			<form action="employee/job.jsp" method="get"> 
			    <div class="input-group">
			     <input   type="text"  value="<% 
			

					if(request.getParameter("keyword") != null ) 
				out.print(request.getParameter("keyword"));
			
			%>" name="keyword" placeholder="enter a keyword name , job " class="form-control">
			<span class="input-group-btn" >
			        <button class="btn btn-secondary" type="submit">Go!</button>
			      </span>
			    </div> 
			</form>
		</div>
	</div>
	
	
		 		
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
	
	
	
	
	
	<br/>
	<p>category</p>
	<div class="row">
		<div class="col-md-12 text-center">
			<%
			 
			
			  cona = new includes.Connection(); 
		    querya = "SELECT DISTINCT( c.name) FROM `vacancies` v LEFT JOIN job j ON j.id = v.job LEFT JOIN job_category c ON c.id= j.category WHERE j.category  = "+a2+"  "; 
	 
		    try {
					 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
					while(rsa.next()) {  
							
						
						out.print(" <a href=\"employee/job.jsp?k="+a2+"\" class=\"btn btn-lg btn-primary\" >"
						+rsa.getString("name")+"</a>");
	 	 
						
					} 
					rsa.close();
					cona.preparedStatement.close ();  
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} 
		    

		    
		    
			  cona = new includes.Connection(); 
		    querya = "SELECT DISTINCT( c.name) FROM `vacancies` v LEFT JOIN job j ON j.id = v.job LEFT JOIN education c ON c.id= v.education WHERE v.education  = "+a3+"  "; 
	 
		    try {
					 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
					while(rsa.next()) {  
							
						
						out.print(" <a href=\"employee/job.jsp?m="+a3+"\" class=\"btn btn-lg btn-warning\" >"
						+rsa.getString("name")+"</a>");
	 	 
						
					} 
					rsa.close();
					cona.preparedStatement.close ();  
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} 
		    
		    
		    
		    
			  cona = new includes.Connection(); 
		    querya = "SELECT DISTINCT( c.company) FROM `vacancies` v LEFT JOIN job j ON j.id = v.job LEFT JOIN employer c ON c.id= v.employer WHERE v.employer  = "+a1+"  "; 
	 
		    try {
					 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
					while(rsa.next()) {  
							
						
						out.print(" <a href=\"employee/job.jsp?m="+a1+"\" class=\"btn btn-lg btn-info\" >"
						+rsa.getString("company")+"</a>");
	 	 
						
					} 
					rsa.close();
					cona.preparedStatement.close ();  
				} catch (Exception e) {
					System.out.println(e.getMessage());
				} 
	%>			 
			 
			 
		</div>
	</div>
	
	
	<br/>
	

  <ul class="nav nav-tabs">
<!--     <li class="active"><a data-toggle="tab" href="#home">View</a></li> -->
<!--     <li><a data-toggle="tab" href="#menu1">Add</a></li> -->
<!--       <li style="display: none;"><a data-toggle="tab" href="#menu2"></a></li>  -->
<!--     <li><a data-toggle="tab" href="#menu3">Menu 3</a></li> -->
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active bg-color-white">
      
      <div class="panel panel-default ">
		  
				<div class="panel-body">
					 
		
		
		
		
		
		
		<div class="col-md-12 widget_bottom_left">
							<div class="banner-bottom-video-grid-left">
								<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								
								
								
						
							 
								  
								  
							

								  
		


<%
	
	
	

	  con = new includes.Connection();

	  query = " SELECT *,v.date AS ddate FROM `vacancies` v LEFT JOIN job j ON v.job = j.id WHERE j.delete_status = 0  AND v.delete_status = 0 AND DATE(v.interview) >= CURDATE()    ORDER BY v.date DESC ";
	 
	  
	  

		if(request.getParameter("keyword") != null ) 
			 query = " SELECT *,v.date AS ddate FROM `vacancies` v LEFT JOIN job j ON v.job = j.id WHERE j.delete_status = 0  AND v.delete_status = 0 AND DATE(v.interview) >= CURDATE() "+
		" AND ( v.place LIKE '%"+request.getParameter("keyword")
		+"%' OR v.salary  LIKE '%"+request.getParameter("keyword")
		+"%' OR v.qualifications  LIKE '%"+request.getParameter("keyword")
		+"%' OR v.experience  LIKE '%"+request.getParameter("keyword")
		+"%'  OR j.title  LIKE '%"+request.getParameter("keyword")
		+"%'  OR j.purpose  LIKE '%"+request.getParameter("keyword")
		+"%') ORDER BY v.date DESC ";

				if(request.getParameter("k") != null ) 
					 query = " SELECT *,v.date AS ddate FROM `vacancies` v LEFT JOIN job j ON v.job = j.id WHERE j.delete_status = 0  AND v.delete_status = 0 AND DATE(v.interview) >= CURDATE() "+
				" AND ( j.category = '"+request.getParameter("k")
				  
				+"') ORDER BY v.date DESC ";

						if(request.getParameter("l") != null ) 
							 query = " SELECT *,v.date AS ddate FROM `vacancies` v LEFT JOIN job j ON v.job = j.id WHERE j.delete_status = 0  AND v.delete_status = 0 AND DATE(v.interview) >= CURDATE() "+
						" AND ( j.employer = '"+request.getParameter("l")
						  
						+"') ORDER BY v.date DESC ";

								if(request.getParameter("m") != null ) 
									 query = " SELECT *,v.date AS ddate FROM `vacancies` v LEFT JOIN job j ON v.job = j.id WHERE j.delete_status = 0  AND v.delete_status = 0 AND DATE(v.interview) >= CURDATE() "+
								" AND ( v.education = '"+request.getParameter("m")
								  
								+"') ORDER BY v.date DESC ";
								 
			 
			 System.out.print(query);
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
				 
				while(rs.next()) {  
					String data = "";
					 
									
		%>							

					 
					
					
							
			  <div class="panel panel-default">
				<div class="panel-heading" role="tab" id="heading<% out.print(rs.getString("id")); %>">
				  <h4 class="panel-title asd">
					<a class="pa_italic" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<% out.print(rs.getString("id")); %>" aria-expanded="true" aria-controls="collapseOne">
					  <span class="lnr lnr-chevron-down"></span><i class="lnr lnr-chevron-up"></i><label><% out.print(rs.getString("title")); %></label>
					</a>
				  </h4>
				</div>
				<div id="collapse<% out.print(rs.getString("id")); %>" class="panel-collapse collapse  " role="tabpanel" aria-labelledby="heading<% out.print(rs.getString("id")); %>">
				 
				 
				  <div class="panel-body panel_text">
				  
					 
					 
					 
					 <div class="row animated bounceInRight now_margin_bt-10 ">
					
					<form class="form-horizontal " id="edit-vacancies">
					
					<input type="hidden" id="edit-id" name="id">
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">job:</label>
							<div class="col-sm-10"> 
								 
								
								<p  class="form-control1" ><% out.print(rs.getString("title")); %></p>
							
							</div>
						</div>
					
					 
					 
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">place:</label>
							<div class="col-sm-10">
								<p  class="form-control1" ><% out.print(rs.getString("place")); %></p>
							</div>
						</div>
						
						
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">salary:</label>
							<div class="col-sm-10">

								<p  class="form-control1" ><% out.print(rs.getString("salary")); %></p>
							</div>
						</div>
						
						
						
						
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">hours:</label>
							<div class="col-sm-10">
								<p  class="form-control1" ><% out.print(rs.getString("hours")); %></p>
							</div>
						</div>
						
						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">education:</label>
							<div class="col-sm-10">
							<p  class="form-control1" >
		<%
		   cona = new includes.Connection(); 
	    querya = " SELECT * FROM `education` WHERE delete_status = 0 AND id="+rs.getString("education")+" ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rsa.next()) {  
					
					
					out.print( rsa.getString("name"));
				} 
				rsa.close();
				cona.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>							
						</p>	
							  
							</div>
						</div>
					
					 						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">skills:</label>
							<div class="col-sm-10"> 
							<p  class="form-control1" >
		<%
		  cona = new includes.Connection(); 
	    querya = " SELECT * FROM `skills` WHERE delete_status = 0 AND id="+rs.getString("skills")+" ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rsa.next()) {  
					
					
					out.print( rsa.getString("name"));
				} 
				rsa.close();
				cona.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>							
						</p>	
							</div>
						</div>
										 						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">competencies:</label>
							<div class="col-sm-10"> 
															<p  class="form-control1" >
		<%
		  cona = new includes.Connection(); 
	    querya = " SELECT * FROM `competencies` WHERE delete_status = 0 AND id="+rs.getString("competencies")+" ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rsa = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rsa.next()) {  
					
					
					out.print( rsa.getString("name"));
				} 
				rsa.close();
				cona.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>							
						</p>	
							</div>
						</div>
					
					 
											
						
					
					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">experience:</label>
							<div class="col-sm-10"> 

								<p  class="form-control1" ><% out.print(rs.getString("experience")); %></p>
													</div>
						</div>

					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">qualifications:</label>
							<div class="col-sm-10"> 
				
								<p  class="form-control1" ><% out.print(rs.getString("qualifications")); %></p>
</div>
						</div>

					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">description:</label>
							<div class="col-sm-10"> 
							
								<p  class="form-control1" ><% out.print(rs.getString("description")); %></p>	
								</div>
						</div>
						
						
							<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">interview date</label>
		<div class="col-sm-10"> 
			
								<p  class="form-control1" ><% out.print(rs.getString("interview")); %></p>				
		</div> 
	</div> 
    	


						<div class="form-group">
					    <div class=" col-sm-2" id="editActionDelteHereme">

					    </div>
					    <div class="col-sm-offset-8 col-sm-2">
<!-- 					      <input type="submit" class="btn btn-warning btn-xs-12 btn-xs" value="Update"> -->
					    </div>
					  </div>
	
					</form>
					 
					</div>
					 
				  </div>
				  
				  
				</div>
			  </div>
			  	 
					 
					 
<%					 
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
					
						
				
				
					 
					 
				</div>
			 
	</div>
			

      
	</div>
    <div id="menu1" class="tab-pane fade bg-color-white">
        <div class="panel panel-default ">
<!-- 			<div class="panel-heading"> -->
<!-- 				Add Job category  -->
<!-- 			</div> -->
				<div class="panel-body">
					<div class="col-md-12 animated bounceInLeft">
					
					

					
					
					
					</div>
				</div>
			 
		</div>
			
      
	</div>


 <div id="menu2" class="tab-pane fade"> 
<div class="panel panel-default ">
<!-- 			<div class="panel-heading"> -->
<!-- 				Add Job category  -->
<!-- 			</div> -->
<div>

<h4>edit</h4></div>
				<div class="panel-body">
					
				</div>
			 
		</div>
			
			
			
      
      
      
	</div>



<!--     <div id="menu3" class="tab-pane fade"> -->
<!--       <h3>Menu 3</h3> -->
<!--       <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p> -->
<!--     </div> -->
  </div>


 
			<!--body wrapper start-->
		 
  <form   method="post" class="hidden" action="<%out.print(controller.Controller.returnPath (request));%>/fileupload" enctype="multipart/form-data" id="select-upload-me">
    <input type="file" name="file" class="hidden"  accept="application/msword, application/vnd.ms-excel, application/vnd.ms-powerpoint,
text/plain, application/pdf, image/*"  />
    <input type="submit" class="hidden"/>
</form> 


<%@include file="footer.jsp"%> 	
		
		
		
		

			 
	