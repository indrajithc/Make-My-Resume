
<%@include file="header.jsp"%> 	 

	<style type="text/css">
		textarea {
			min-height: 8.4em;
		}
		td textarea {
			min-height: 4.4em;
		}
	</style>
	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
	%>
	   
	  <%

	includes.Connection con = new includes.Connection();
	 
	 
	
	String query = " SELECT * FROM `employee` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

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
		<h3 class="col-sm-10 blank1">Resume</h3>
		<a  href="<%= controller.Controller.returnPath (request) + "/" %>controller?page=resumes" class="col-sm-2 btn btn-warning btn-xs">history</a>
		<div class="tab-content">
		<div class="tab-pane active" id="horizontal-form">
		 	
			
								
<div class="form-horizontal"   >

 
 	<div class="row">
 		<div class="col-md-offset-1 col-md-6">
 		
 			<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">First Name</label>
		<div class="col-sm-10">
			<input disabled="disabled" value="<% out.print(fname); %>" id="fname" name="fname" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">Last Name</label>
		<div class="col-sm-10">
			<input  disabled="disabled" value="<% out.print(lname); %>" id="lname" name="lname" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">Email</label>
		<div class="col-sm-10">
			<input  disabled="disabled"  value="<% out.print(username); %>"  id="username" name="username" type="text" class="form-control1"  placeholder="Default Input">
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
			<div    class="radio-inline"><label><input disabled name="sex" value="male" type="radio" <% if(sex!= null) if(sex.equals("male")){ out.print("checked"); }%>> Male</label></div>
			<div   class="radio-inline"><label><input disabled name="sex" type="radio" value="female" <% if(sex!= null) if(sex.equals("female")){ out.print("checked");} %>> Female</label></div>
		</div>
	</div>
	 
	
	
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">Address</label>
		<div class="col-sm-8">
			<textarea  disabled="disabled"  name="address" id="address" cols="50" rows="4" class="form-control1"><% out.print(address); %></textarea>
		</div>
	</div>

	
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">landline</label>
		<div class="col-sm-8">
			<input  disabled="disabled"  value="<% out.print(l_no); %>"  id="l_no" name="l_no" type="number" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
		
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">mobile</label>
		<div class="col-sm-8">
			<input disabled="disabled"   value="<% out.print(mobile); %>"  id="mobile" name="mobile" type="number" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	<h4>Data 2</h4>
	
	

<form  method="post" id="add-employee-resume">

		<input value="<% out.print(id); %>" id="employee" name="employee" type="text" class="hidden" >
			
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">hobbies</label>
		<div class="col-sm-8">
			<textarea name="hobbies" id="hobbies" cols="50" rows="4" class="form-control1"></textarea>
		</div>
	</div>
			
			
						
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">about</label>
		<div class="col-sm-8">
			<textarea name="about" id="about" cols="50" rows="4" class="form-control1"></textarea>
		</div>
	</div>
			
			
	<div class="form-group   has-feedback">
		<label for="radio" class="col-sm-2 control-label">Radio Inline</label>
		<div class="col-sm-8">
			<div class="radio-inline"><label><input value="1" name="privacy" type="radio"> only me</label></div> 
			<div class="radio-inline"><label><input value="2" name="privacy" type="radio" checked> public</label></div> 
		</div>
	</div>	

	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">description</label>
		<div class="col-sm-8">
			<textarea name="description" id="description" cols="50" rows="4" class="form-control1"></textarea>
		</div>
	</div>	
	 
</form>
			
			 
			
		<div class="panel panel-warning"   data-widget-static="">
							<div class="panel-heading">
								<h2 class="text-capitalize">academic</h2>
								<div class="panel-ctrls" data-actions-container="" data-action-collapse="{&quot;target&quot;: &quot;.panel-body&quot;}"><span class="button-icon has-bg"><i class="ti ti-angle-down"></i></span></div>
							</div>
<div class="panel-body no-padding" style="display: block;">
	<button id="addNewRowToAcdm"  type="button" title="add a new row" class="col-sm-offset-10 col-xs-1 btn btn-warning"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>

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
<th>X</th>
			</tr>
		</thead>
		<tbody>
			 
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
	<button id="addNewRowToAcdm1"  type="button" title="add a new row" class="col-sm-offset-10 col-xs-1 btn btn-warning"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>

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
<th>X</th>
			</tr>
		</thead>
		<tbody>
<tr>
<td><input placeholder=" "   class="col-sm-12" type="text"></td>
<td><textarea></textarea></td>
<td><input placeholder=" "   class="col-sm-12" type="number"></td>
<td><input placeholder=" "   class="col-sm-12" type="number"></td>
<td><input placeholder=" "  class="col-sm-12" type="text"></td>
<td><textarea></textarea></td>
<td><input placeholder=" "  class="col-sm-12" type="text"></td>
<td><input class="col-sm-12" type="number"></td>
<td><input placeholder=" "  class="col-sm-12" type="text"></td>
<td><textarea></textarea></td> 
<td><i class="fa fa-minus-circle removeMe561" aria-hidden="true"></i></td>
</tr>

		
			 
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
	<button id="addNewRowToAcdm2"  type="button" title="add a new row" class="col-sm-offset-10 col-xs-1 btn btn-warning"><i class="fa fa-plus-circle" aria-hidden="true"></i></button>

	<table id="addNewRowToAcdmHost2" class="table table-striped  table-hover">
		<thead>
			<tr class="warning">
<th class="text-capitalize">attachment</th>
<th class="text-capitalize">type</th> 
<th class="text-capitalize">description</th> 
<th>X</th>
			</tr>
		</thead>
		<tbody>
			 
		</tbody>
	</table>
</div>
						</div>
			
			
			
			   
			 
				<div class="form-group mb-n">
					<label for="largeinput" class="col-sm-2 control-label label-input-lg">Large Input</label>
					<div class="col-sm-8">
						<input type="button" id="butt458" class="col-sm-offset-4 col-sm-4 btn btn-xs btn-success "  value="Go">
					</div>
				</div>
			</div>
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
		
		
		
		

			 
	