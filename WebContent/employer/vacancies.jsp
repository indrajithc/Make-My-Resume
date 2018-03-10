
<%@include file="header.jsp"%> 	 

	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
	%>
	  
	  	  <%

	includes.Connection con = new includes.Connection();
	 
	 
	
	String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

 	String id =  null; 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
				 
				while(rs.next()) {

				 	  id =  rs.getString("id"); 
				 	

				}
				 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 


	%>	
	 
 
<div class="graphs">
	  
	 <div class="grid_3 grid_4">
  <h3>vacancies</h3>
  <div class="bs-example">
    

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">View</a></li>
    <li><a data-toggle="tab" href="#menu1">Add</a></li>
      <li style="display: none;"><a data-toggle="tab" href="#menu2"></a></li> 
<!--     <li><a data-toggle="tab" href="#menu3">Menu 3</a></li> -->
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active bg-color-white">
      
      <div class="panel panel-default ">
		  
				<div class="panel-body">
					<div class="col-md-12 animated bounceInLeft">
										<h3>Added vacancies</h3>
					<div class="col-md-12">
					
						<table class="table sortable " id="added_vacancies">
							<thead>
								<tr>
									<th class="col-md-4" data-defaultsign="AZ"> title </th>
									<th class="col-md-7" data-defaultsign="AZ"> place </th>
									<th class="col-md-7" data-defaultsign="_09">salary</th>
									<th class="col-md-7" data-defaultsign="AZ"> interview </th>
									<th class="col-md-7" data-defaultsign="AZ"> date </th>
									<th class="col-md-1"> action </th>
								</tr>
							</thead>

							<tbody class=" table-hover">
	<%
	
	
	

	  con = new includes.Connection();

	  query = " SELECT *,  IF(DATE(v.interview) >= CURDATE(), '0', '1') AS valid ,v.date AS ddate FROM `vacancies` v LEFT JOIN job j ON v.job = j.id WHERE j.delete_status = 0  AND v.delete_status = 0  AND v.employer=" + id + " ORDER BY v.date DESC ";
	 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
				 
				while(rs.next()) {  
					String data = "";
					if(rs.getInt("valid") == 0)
					 data = "<tr>"+
							"<td>" + rs.getString("title") + " </td>"+
							"<td>" + rs.getString("place") + " </td>"+
							"<td>" + rs.getString("salary") + " </td>"+
							"<td>" + rs.getString("interview") + " </td>"+
							"<td>" + rs.getString("ddate") + " </td>"+
							"<td><button class='col-xs-12 btn btn-info btn-xs for-edit-vacancies' data-id='" + rs.getString("id") + "'>more</button> </td>"+
						"</tr>";
							else 
								 data = "<tr>"+
											"<td>" + rs.getString("title") + " </td>"+
											"<td>" + rs.getString("place") + " </td>"+
											"<td>" + rs.getString("salary") + " </td>"+
											"<td>" + rs.getString("interview") + " </td>"+
											"<td>" + rs.getString("ddate") + " </td>"+
											"<td><button class='col-xs-12 btn btn-default btn-xs '>old</button> </td>"+
										"</tr>";		
					out.print(data);
				}
				 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			

	%>						

							
							</tbody>
						</table>
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
					
					<form class="form-horizontal " id="add-vacancies">
					
					
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">job:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control job_category" id="job_category"	placeholder="Enter Category name" name="job_category">
								<option value=""  disabled="disabled" selected="selected"> select </option>
	<%

	includes.Connection cona = new includes.Connection();
	 
	 
	
	String querya = " SELECT * FROM `job_category` WHERE delete_status = 0 ORDER BY name DESC ";
	 
 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   );
				 
				while(rs.next()) { 
					
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				}
				 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			

	%>						
	
	
	
								
								
									
								</Select>
							
							</div>
						</div>
					
					 
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">job:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control job" id="job"	placeholder=" " name="job">
								<option class="" value="" disabled="disabled" selected="selected"> select job category </option>
 
									
								</Select>
							
							</div>
						</div>
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">place:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="place" name="place">  
							</div>
						</div>
						
						
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">salary:</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="salary" name="salary">  
							</div>
						</div>
						
						
						
						
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">hours:</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="hours" name="hours">  
							</div>
						</div>
						
						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">education:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control" id="education"  name="education">
								<option value="" disabled="disabled" selected="selected"> select </option>
	<%
	  cona = new includes.Connection(); 
	  querya = " SELECT * FROM `education` WHERE delete_status = 0 ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rs.next()) {  
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				} 
				rs.close();
				con.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>						 
								</Select> 
							</div>
						</div>
					
					 						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">skills:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control" id="skills"  name="skills">
								<option value="" disabled="disabled" selected="selected"> select </option>
	<%
	  cona = new includes.Connection(); 
	  querya = " SELECT * FROM `skills` WHERE delete_status = 0 ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rs.next()) {  
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				} 
				rs.close();
				con.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>						 
								</Select> 
							</div>
						</div>
										 						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">competencies:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control" id="competencies"  name="competencies">
								<option value="" disabled="disabled" selected="selected"> select </option>
	<%
	  cona = new includes.Connection(); 
	  querya = " SELECT * FROM `competencies` WHERE delete_status = 0 ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rs.next()) {  
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				} 
				rs.close();
				con.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>						 
								</Select> 
							</div>
						</div>
					
					 
											
						
					
					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">experience:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="experience" placeholder="add an experience" name="experience"></textarea>
							</div>
						</div>

					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">qualifications:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="qualifications" placeholder="add a qualifications" name="qualifications"></textarea>
							</div>
						</div>

					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">description:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="description" placeholder="add a description" name="description"></textarea>
							</div>
						</div>
						
						
							<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">interview date</label>
		<div class="col-sm-10"> 
			<input value=""  type="text" class="form-control" id="interview" placeholder="Enter interview date" name="interview"   data-date-format="yyyy-mm-dd">  
							
		</div> 
	</div> 
    	


						<div class="form-group">
					    <div class="col-sm-offset-10 col-sm-2">
					      <input type="submit" class="btn btn-warning" value="Add">
					    </div>
					  </div>
	
					</form>
					
					
					
					
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
					<div class="col-md-12 animated bounceInRight">
					
					<form class="form-horizontal " id="edit-vacancies">
					
					<input type="hidden" id="edit-id" name="id">
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">job:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control job_category" id="edit-job_category"	placeholder="Enter Category name"  name="job_category">
								<option value="" disabled="disabled" selected="selected"> select </option>
	<%

	 cona = new includes.Connection();
	 
	 
	
	  querya = " SELECT * FROM `job_category` WHERE delete_status = 0 ORDER BY name DESC ";
	 
 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   );
				 
				while(rs.next()) { 
					
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				}
				 
				rs.close();
				con.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			

	%>						
	
	
	
								
								
									
								</Select>
							
							</div>
						</div>
					
					 
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">job:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control job" id="edit-job"	placeholder=" "  name="job">
								<option value="" disabled="disabled" selected="selected"> select job category </option>
 
									
								</Select>
							
							</div>
						</div>
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">place:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit-place"  name="place">  
							</div>
						</div>
						
						
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">salary:</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="edit-salary"  name="salary">  
							</div>
						</div>
						
						
						
						
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">hours:</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="edit-hours"  name="hours">  
							</div>
						</div>
						
						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">education:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control" id="edit-education"   name="education">
								<option value="" disabled="disabled" selected="selected"> select </option>
	<%
	  cona = new includes.Connection(); 
	  querya = " SELECT * FROM `education` WHERE delete_status = 0 ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rs.next()) {  
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				} 
				rs.close();
				con.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>						 
								</Select> 
							</div>
						</div>
					
					 						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">skills:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control" id="edit-skills"   name="skills">
								<option value="" disabled="disabled" selected="selected"> select </option>
	<%
	  cona = new includes.Connection(); 
	  querya = " SELECT * FROM `skills` WHERE delete_status = 0 ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rs.next()) {  
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				} 
				rs.close();
				con.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>						 
								</Select> 
							</div>
						</div>
										 						
<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">competencies:</label>
							<div class="col-sm-10"> 
								<Select  class="form-control" id="edit-competencies"   name="competencies">
								<option value="" disabled="disabled" selected="selected"> select </option>
	<%
	  cona = new includes.Connection(); 
	  querya = " SELECT * FROM `competencies` WHERE delete_status = 0 ORDER BY name DESC "; 
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) cona.display(querya   ); 
				while(rs.next()) {  
					out.print("<option value='" +  rs.getString("id") + "'>" + rs.getString("name") + "</option>");
				} 
				rs.close();
				con.preparedStatement.close ();  
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
	%>						 
								</Select> 
							</div>
						</div>
					
					 
											
						
					
					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">experience:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="edit-experience" placeholder="add an experience"  name="experience"></textarea>
							</div>
						</div>

					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">qualifications:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="edit-qualifications" placeholder="add a qualifications"  name="qualifications"></textarea>
							</div>
						</div>

					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">description:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="edit-description" placeholder="add a description"  name="description"></textarea>
							</div>
						</div>
						
						
							<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">interview date</label>
		<div class="col-sm-10"> 
			<input value=""  type="text" class="form-control" id="edit-interview" placeholder="Enter interview date"  name="interview"   data-date-format="yyyy-mm-dd">  
							
		</div> 
	</div> 
    	


						<div class="form-group">
					    <div class=" col-sm-2" id="editActionDelteHereme">

					    </div>
					    <div class="col-sm-offset-8 col-sm-2">
					      <input type="submit" class="btn btn-warning btn-xs-12 btn-xs" value="Update">
					    </div>
					  </div>
	
					</form>
					
					
					
					
					</div>
				</div>
			 
		</div>
			
			
			
      
      
      
	</div>



<!--     <div id="menu3" class="tab-pane fade"> -->
<!--       <h3>Menu 3</h3> -->
<!--       <p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</p> -->
<!--     </div> -->
  </div>





    </div>
  </div> 
	  
	    

  <div class="copy_layout">
      <p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
  </div>
  </div> 
  
  
  
   
		
<%@include file="footer.jsp"%> 	
		
 








