
<%@include file="header.jsp"%>


<section class="content-header">
	<h1>
		Competencies<small> </small>
	</h1>
	<ol class="breadcrumb">
		<li class="now_home"></li>
		<li class="active">Add</li>
	</ol>
</section>

<section class="content ">
 
 
 
 
  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">View</a></li> 
      <li style="display: none;"><a data-toggle="tab" href="#menu2"></a></li> 
<!--     <li><a data-toggle="tab" href="#menu3">Menu 3</a></li> -->
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active bg-color-white">
      
      <div class="panel panel-default ">
		  
				<div class="panel-body">
					<div class="col-md-12 animated bounceInLeft">
										<h3>Added Competencies</h3>
					<div class="col-md-12">
					
						<table class="table sortable " id="added_competencies">
							<thead>
								<tr>
									<th class="col-md-4" data-defaultsign="AZ"> name </th>
									<th class="col-md-7" data-defaultsign="AZ"> description </th>
									<th class="col-md-1"> action </th>
								</tr>
							</thead>

							<tbody class=" table-hover">
	<%

	includes.Connection  con = new includes.Connection();
	 
	 
	
	 String query = " SELECT * FROM `competencies` WHERE delete_status = 0 ORDER BY date DESC ";
	 
 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
				 
				while(rs.next()) { 
					String data = "<tr>"+
							"<td>" + rs.getString("name") + " </td>"+
							"<td>" + rs.getString("description") + " </td>"+
							"<td><button class='btn btn-info btn-sm for-edit-competencies' data-id='" + rs.getString("name") + "'>edit</button> </td>"+
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
    

 <div id="menu2" class="tab-pane fade"> 
      <div class="panel panel-default "> 
				<div class="panel-body">
				<h4> Edit Competencies </h4>
				
					<div class="col-md-12 animated bounceInLeft">
					
					<form class="form-horizontal " id="edit-competencies">
					 
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">name:</label>
							<div class="col-sm-10">
								<input disabled="disabled" type="text" class="form-control" id="edit-name"	placeholder="Enter Category name" name="name">  
							</div>
						</div>
					
					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">description:</label>
							<div class="col-sm-10"> 
								<textarea  class="form-control" id="edit-description" placeholder="add a description" name="description"></textarea>
							</div>
						</div>



					  
					  	<div class="form-group">
					    <div class="col-md-offset-8 col-md-2">
					      <button class="btn btn-danger" id="delete_this_competencies" >Delete</button>
					    </div>
					    <div class="col-md-2">
					      <input type="submit" class="btn btn-warning" value="Update">
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


 

	<div class=""> 
		<div class="panel panel-default ">


		</div>
	</div>




</section>




<%@include file="footer.jsp"%>
