
<%@include file="header.jsp"%>


<section class="content-header">
	<h1>
		employer <small> </small>
	</h1>
	<ol class="breadcrumb">
		<li class="now_home"></li>
		<li class="active">Add</li>
	</ol>
</section>

<section class="content ">

 
       <div class="panel panel-default " id="showALlDetails" >
		  
				<div class="panel-body">
					<div class="col-md-12 animated bounceInLeft">
										<h3>employers</h3>
					<div class="col-md-12">
					
						<table class="table sortable " id="added_language-category">
							<thead>
								<tr>
									<th class="col-md-4" data-defaultsign="AZ"> username </th>
									<th class="col-md-7" data-defaultsign="AZ"> company </th>
									<th class="col-md-7" data-defaultsign="_09"> pin </th>
									<th class="col-md-7" data-defaultsign="AZ"> country </th>
									<th class="col-md-7" data-defaultsign="AZ"> state </th>
									<th class="col-md-7" data-defaultsign="_09"> mobile </th>
									<th class="col-md-7" data-defaultsign="AZ"> login </th> 
									<th class="col-md-1"> action </th>
								</tr>
							</thead>

							<tbody class=" table-hover">
	<%

	includes.Connection con = new includes.Connection();
	 
	 
	
	String query = " SELECT * FROM `employer` WHERE id > 0 ORDER BY date DESC ";
	 
 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
				 
				while(rs.next()) { 
					String data = "<tr>"+
							"<td>" + rs.getString("username") + " </td>"+
							"<td>" + rs.getString("company") + " </td>"+
							"<td>" + rs.getString("pin") + " </td>"+
							"<td>" + rs.getString("country") + " </td>"+
							"<td>" + rs.getString("state") + " </td>"+
							"<td>" + rs.getString("mobile") + " </td>"+
							"" ;
							if(rs.getString("login").equals("1"))
								data = data + "<td class='text-success'> true </td>";
							else
								data = data + "<td class='text-danger'>  false </td>";
								
								
							data = data + " "+ 
							"<td><button class='btn btn-info btn-sm for-edit-employer' data-id='" + rs.getString("id") + "'>edit</button> </td>"+
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
	
	
	
	
	
	 
       <div class="panel panel-default " id="showONeDetails" style="display:none;">
		  
		<div class="panel-body">
						
<form class="form-horizontal" id="get-employer">

	<div class="form-group   has-feedback"> 
		<div class="col-sm-12">
	<button type="button" id="backAll" class="col-sm-offset-11 col-sm-1 btn btn-warning btn-xs">all</button>		
</div> 
	</div>
<input value="" id="id" name="id" type="text" class="hidden" >
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">Name</label>
		<div class="col-sm-8">
			<input  disabled="disabled" id="company" name="company" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">email</label>
		<div class="col-sm-8">
			<input  disabled="disabled" id="username" name="username" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">pin</label>
		<div class="col-sm-8">
			<input  disabled="disabled" id="pin" name="pin" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">country</label>
		<div class="col-sm-8"> 
			<input  disabled="disabled" type="text" class="form-control1"  id="country" name="country">
		</div> 
	</div>
	
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">state</label>
		<div class="col-sm-8"> 
			<input  disabled="disabled" type="text" class="form-control1"  id="state" name="state">
		</div> 
	</div>
	    
	
        
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">start date</label>
		<div class="col-sm-8"> 
			<input   disabled="disabled"   type="text" class="form-control" id="start_date" placeholder="Enter start date" name="start_date"   data-date-format="yyyy-mm-dd">  
							
		</div> 
	</div> 
    	
	
	
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">vision</label>
		<div class="col-sm-8">
			<textarea   disabled="disabled"  name="vision" id="vision" cols="50" rows="4" class="form-control1"></textarea>
		</div>
	</div>
	
	
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">hr contact</label>
		<div class="col-sm-8">
			<textarea name="hr_contact" id="hr_contact" cols="50" rows="4" class="form-control1"></textarea>
		</div>
	</div>
	
		
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">url</label>
		<div class="col-sm-8">
			<textarea   disabled="disabled" name="url" id="url" cols="50" rows="4" class="form-control1"></textarea>
		</div>
	</div>
	
	
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">landline</label>
		<div class="col-sm-8">
			<input   disabled="disabled"  id="l_no" name="l_no" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
		
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">mobile</label>
		<div class="col-sm-8">
			<input  disabled="disabled"  id="mobile" name="mobile" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	
			
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">about</label>
		<div class="col-sm-8">
			<textarea   disabled="disabled"  name="about" id="about" cols="50" rows="4" class="form-control1"></textarea>
		</div>
	</div>
	
	
						<div class="form-group     has-feedback ">
							<label class="control-label col-sm-2 text-capitalize" for="image">image:</label>
							<div class="col-sm-10">
								<div class="input-group" id="image-up">
			
	<div style="width:100%;text-align: center;">
	<img style="max-width:250px; height:auto; width:250px;"  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/images/default.png'" 
	src="" class="img-rounded" id="image" name="image" width="250" height="250"> 
	</div>
								
														
</div>											
</div>
							</div>
						 
 
 
 			
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">login</label>
		<div class="col-sm-8" id="action-button">
			
		</div>
	</div>
<!--  <button class="btn btn-lg btn-success1 btn-block" type="submit">Submit</button> -->
</form>
		</div>
			 
	</div>
	
	


	<div class=""> 
		<div class="panel panel-default ">


		</div>
	</div>




</section>




<%@include file="footer.jsp"%>
