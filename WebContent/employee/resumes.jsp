
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
		}
		
		.form-control1, .form-control_2.input-sm {
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

<div class="graphs">
		<div class="row">
		<h3 class="col-sm-10 blank1">resumes</h3>
		<a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=resume" class="col-sm-2 btn btn-info btn-xs">add</a>
		</div>
		<div class="tab-content">
		<div class="tab-pane active" id="horizontal-form">
		 	
			
	
	
					
		 <%

	  con = new includes.Connection();
	 
	 
	
	  query = " SELECT *, DATE_FORMAT(date,'%d %M %Y  ') AS ddate FROM `resume` WHERE employee=" + id + " AND delete_status = 0 ORDER BY date DESC ";
 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query);
				 
				while(rs.next()) {



	%>		  
					
					
					
					
					
					
								
<div class="form-horizontal grid_4 now_margin_bt-10"   >
	<h4><% out.print(rs.getString("ddate")); %></h4>
 	 <div class="row">
		 <button id="delte-thi-resu" data-id="<% out.print(rs.getString("id")); %>" class="col-xs-offset-11 col-sx-1 btn btn-xs btn-danger ">delete</button>
		</div>	
			
 	<div class="row">
 		<div class="col-md-offset-1 col-md-6">
 		
 			<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">First Name</label>
		<div class="col-sm-10">
		<p  class="form-control1 non-border"><% out.print(fname); %></p>
			 
		</div> 
	</div>
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">Last Name</label>
		<div class="col-sm-10">
		<p  class="form-control1 non-border"><% out.print(lname); %></p>
	</div> 
	</div>
	
	
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">Email</label>
		<div class="col-sm-10">
		<p  class="form-control1 non-border"><% out.print(username); %></p>
			 </div> 
	</div>
 		
 		
 		</div> 
 		<div class="col-md-4 text-right">
 			<div class="col-xs-8 float-right">
 				<img  class="img-responsive" alt=""  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/images/default.png'" src="<%out.print(controller.Controller.returnPath (request));%>/employee/images_/<% out.print(image);  %>" >
 			</div>
 		</div> 
 	</div>
 
 		<h4>data 1</h4>

	 
 
    	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">sex</label>
		<div class="col-sm-8">
		<p  class="form-control1 non-border"><% out.print(sex); %></p>
		</div>
	</div>
	 
	
	
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">Address</label>
		<div class="col-sm-8">
		<p  class="form-control1 non-border"><% out.print(address); %></p> 
		</div>
	</div>

	
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">landline</label>
		<div class="col-sm-8">
		<p  class="form-control1 non-border"><% out.print(l_no); %></p> 
		</div> 
	</div>
		
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">mobile</label>
		<div class="col-sm-8">
		<p  class="form-control1 non-border"><% out.print(mobile); %></p> 
</div> 
	</div>
	
	<h4>Data 2</h4>
	
	

<form  method="post" id="add-employee-resume">

		<input value="<% out.print(id); %>" id="employee" name="employee" type="text" class="hidden" >
			
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">hobbies</label>
		<div class="col-sm-8">
		
		<p  class="form-control1 non-border"><% rs.getString("hobbies"); %></p>  
		</div>
	</div>
			
			
						
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">about</label>
		<div class="col-sm-8">
		<p  class="form-control1 non-border"><% rs.getString("about"); %></p>  
		</div>
	</div>
			
			
	<div class="form-group   has-feedback">
		<label for="radio" class="col-sm-2 control-label">Radio Inline</label>
		<div class="col-sm-8">
		
		<p  class="form-control1 non-border"><% 
		
		if(rs.getInt("privacy") == 1)
			out.print(" only me");
		else
			out.print("public");
			
		
		%></p>  
		</div>
	</div>	

	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">description</label>
		<div class="col-sm-8">
		
		<p  class="form-control1 non-border"><% rs.getString("description"); %></p>   
		</div>
	</div>	
	 
</form>
			
			 
			
		<div class="panel panel-warning"   data-widget-static="">
							<div class="panel-heading">
								<h2 class="text-capitalize">academic</h2>
								<div class="panel-ctrls" data-actions-container="" data-action-collapse="{&quot;target&quot;: &quot;.panel-body&quot;}"><span class="button-icon has-bg"><i class="ti ti-angle-down"></i></span></div>
							</div>
<div class="panel-body no-padding" style="display: block;">
	 
	<table id="addNewRowToAcdmHost" class="table table-striped  table-hover">
		<thead>
			<tr class="warning">
<th class="text-capitalize"><i style="padding-right:1em;" class="fa fa-graduation-cap" aria-hidden="true"></i>level</th>
<th class="text-capitalize"><i style="padding-right:1em;" class="fa fa-paper-plane" aria-hidden="true"></i>scale</th>
<th class="text-capitalize"><i style="padding-right:1em;" class="fa fa-diamond" aria-hidden="true"></i>grade</th>
<th class="text-capitalize"><i style="padding-right:1em;" class="fa fa-phone" aria-hidden="true"></i>land line</th>
<th class="text-capitalize"><i style="padding-right:1em;" class="fa fa-university" aria-hidden="true"></i>institution</th>
<th class="text-capitalize"><i style="padding-right:1em;" class="fa fa-map-marker" aria-hidden="true"></i>address</th>
<th class="text-capitalize"><i style="padding-right:1em;" class="fa fa-info" aria-hidden="true"></i>description</th> 

			</tr>
		</thead>
		<tbody>
		
		
		
				 <%

				 includes.Connection concon = new includes.Connection();
	 
	 
	
	  query = " SELECT *  FROM `academic` WHERE resume=" + rs.getString("id") + " AND delete_status = 0 ORDER BY date ASC ";
 
		
			try {
				 java.sql.ResultSet rs2 = ( java.sql.ResultSet) concon.display(query);
				 
				while(rs2.next()) { 	
					out.print("<tr>"+
							"<td>"+rs2.getString("level")+"</td>"+
							"<td>"+rs2.getString("scale")+"</td>"+
							"<td>"+rs2.getString("grade")+"</td>"+
							"<td>"+rs2.getString("l_no")+"</td>"+
							"<td>"+rs2.getString("institution")+"</td>"+
							"<td>"+rs2.getString("address")+"</td>"+
							"<td>"+rs2.getString("description")+"</td> "+ 
							"</tr>"+
							""+
							"");

					System.out.println("--4");	
				}
				 
				rs2.close();
				concon.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			
	%>		  
				
		
		 
				
			 
		</tbody>
	</table>
</div>
						</div>
		
		
		
		
			<div class="panel panel-info"   data-widget-static="">
							<div class="panel-heading">
								<h2 class="text-capitalize">experience</h2>
								<div class="panel-ctrls" data-actions-container="" data-action-collapse="{&quot;target&quot;: &quot;.panel-body&quot;}"><span class="button-icon has-bg"><i class="ti ti-angle-down"></i></span></div>
							</div>
<div class="panel-body no-padding" style="display: block;">
	 
	<table id="addNewRowToAcdmHost1" class="table table-striped  table-hover">
		<thead>
			<tr class="warning">
<th class="text-capitalize">company</th>
<th class="text-capitalize">address</th>
<th class="text-capitalize">pin</th>
<th class="text-capitalize"> land line</th>
<th class="text-capitalize">position</th>
<th class="text-capitalize">hr_contact</th>
<th class="text-capitalize">email</th> 
<th class="text-capitalize">years</th> 
<th class="text-capitalize">site url</th> 
<th class="text-capitalize">description</th>  
			</tr>
		</thead>
		<tbody>
 


				 <%

				   concon = new includes.Connection();
	 
	 
	
	  query = " SELECT *  FROM `experience` WHERE resume=" + rs.getString("id") + " AND delete_status = 0 ORDER BY date ASC ";
 
		
			try {
				 java.sql.ResultSet rs2 = ( java.sql.ResultSet) concon.display(query);
				 
				while(rs2.next()) { 	
					out.print( 
							"<tr>"+
							"<td>"+rs2.getString("company")+"</td>"+
							"<td>"+rs2.getString("address")+"</td>"+
							"<td>"+rs2.getString("pin")+"</td>"+
							"<td>"+rs2.getString("l_no")+"</td>"+
							"<td>"+rs2.getString("position")+"</td>"+
							"<td>"+rs2.getString("hr_contact")+"</td>"+
							"<td>"+rs2.getString("email")+"</td>"+
							"<td>"+rs2.getString("years")+"</td>"+
							"<td>"+rs2.getString("url")+"</td>"+
							"<td>"+rs2.getString("description")+"</td> "+ 
							"</tr>"+
							""+
							"");

					System.out.println("--4");	
				}
				 
				rs2.close();
				concon.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			
	%>		  
				
		
		
		
		
		
			 
		</tbody>
	</table>
</div>
						</div>
		
		
		
		
		
		<div class="panel panel-success"   data-widget-static="">
							<div class="panel-heading">
								<h2 class="text-capitalize">attachment</h2>
								<div class="panel-ctrls" data-actions-container="" data-action-collapse="{&quot;target&quot;: &quot;.panel-body&quot;}"><span class="button-icon has-bg"><i class="ti ti-angle-down"></i></span></div>
							</div>
<div class="panel-body no-padding" style="display: block;">
	 
	<table id="addNewRowToAcdmHost2" class="table table-striped  table-hover">
		<thead>
			<tr class="warning">
<th class="text-capitalize">attachment</th>
<th class="text-capitalize">type</th> 
<th class="text-capitalize">description</th>  
			</tr>
		</thead>
		<tbody>
		
			 <%

				   concon = new includes.Connection();
	 
	 
	
	  query = " SELECT *  FROM `attachment` WHERE resume=" + rs.getString("id") + " AND delete_status = 0 ORDER BY date ASC ";
 
		
			try {
				 java.sql.ResultSet rs2 = ( java.sql.ResultSet) concon.display(query);
				 
				while(rs2.next()) { 	
					out.print( 
							"<tr>"+
							"<td><a href='upload/"+rs2.getString("attachment")+"'>"+rs2.getString("attachment")+"</td>"+
							"<td>"+rs2.getString("type")+"</td>"+
							"<td>"+rs2.getString("description")+"</td>"+ 
							"</tr>"+
							""+
							"");

					System.out.println("--4");	
				}
				 
				rs2.close();
				concon.preparedStatement.close (); 
				
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
			
			
	%>		  
				
		
			 
		</tbody>
	</table>
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
			<!--body wrapper start-->
		 
  <form   method="post" class="hidden" action="<%out.print(controller.Controller.returnPath (request));%>/fileupload" enctype="multipart/form-data" id="select-upload-me">
    <input type="file" name="file" class="hidden"  accept="application/msword, application/vnd.ms-excel, application/vnd.ms-powerpoint,
text/plain, application/pdf, image/*"  />
    <input type="submit" class="hidden"/>
</form> 


<%@include file="footer.jsp"%> 	
		
		
		
		

			 
	