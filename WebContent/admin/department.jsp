
<%@include file="header.jsp"%>


<section class="content-header">
	<h1>
		Department <small>sample department</small>
	</h1>
	<ol class="breadcrumb">
		<li class="now_home"></li>
		<li class="active">Add</li>
	</ol>
</section>

<section class="content">


	<div class=""> 
		<div class="panel panel-default ">
			<div class="panel-heading">fill department Form</div>
			<div class="panel-body">
				<div class="col-md-6 animated bounceInLeft">
					
					<form class="form-horizontal " id="add-department">
					
					<h3 class="text-capitalize">add new Department</h3>
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">name:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name"	placeholder="Enter department name" name="name">  
							</div>
						</div>
					
					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">description:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="description" placeholder="add a description" name="description"></textarea>
							</div>
						</div>


						<div class="form-group">
					    <div class="col-sm-offset-10 col-sm-2">
					      <input type="submit" class="btn btn-warning" value="Add">
					    </div>
					  </div>
	
					</form>
					
					<form class="form-horizontal " id="edit-department" style="display:none;">
					
					<h3 class="text-capitalize">edit Department</h3>
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="edit-name">name:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit-name" disabled="disabled"	placeholder="Enter department name" name="editname">  
							</div>
						</div>
					
					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="edit-description">description:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="edit-description" placeholder="add a description" name="editdescription"></textarea>
							</div>
						</div>


						<div class="form-group">
					    <div class="col-md-offset-8 col-md-2">
					      <button class="btn btn-danger" id="delete_this_department" >Delete</button>
					    </div>
					    <div class="col-md-2">
					      <input type="submit" class="btn btn-warning" value="Update">
					    </div>
					  </div>
	
					</form>
					
					
				</div>
				
				
				<div class="col-md-6 animated bounceInRight">
					<h3>Added Department</h3>
					<div class="col-md-12">
					
						<table class="table sortable " id="added_department">
							<thead>
								<tr>
									<th class="col-md-4" data-defaultsign="AZ"> name </th>
									<th class="col-md-7" data-defaultsign="AZ"> description </th>
									<th class="col-md-1"> action </th>
								</tr>
							</thead>

							<tbody class=" table-hover">
	<%

	includes.Connection con = new includes.Connection();
	 
	 
	
	String query = " SELECT * FROM `department` WHERE delete_status = 0 ORDER BY date DESC ";
	 
 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
				 
				while(rs.next()) { 
					String data = "<tr>"+
							"<td>" + rs.getString("name") + " </td>"+
							"<td>" + rs.getString("description") + " </td>"+
							"<td><button class='btn btn-info btn-sm for-edit-department' data-id='" + rs.getString("name") + "'>edit</button> </td>"+
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




</section>




<%@include file="footer.jsp"%>
