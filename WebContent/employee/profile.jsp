
<%@include file="header.jsp"%> 	 

	
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
	     <div class="xs">
  	       <h3>Forms</h3>
  	         <div class="tab-content">
						<div class="tab-pane active" id="horizontal-form">
						
						
						
<form class="form-horizontal" id="update-employee">

<input value="<% out.print(id); %>" id="id" name="id" type="text" class="hidden" >
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">First Name</label>
		<div class="col-sm-8">
			<input value="<% out.print(fname); %>" id="fname" name="fname" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">Last Name</label>
		<div class="col-sm-8">
			<input value="<% out.print(lname); %>" id="lname" name="lname" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">username</label>
		<div class="col-sm-8">
			<input value="<% out.print(username); %>"  id="username" name="username" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	<% System.out.print("ddddddd"+sex); %>
 
    	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">sex</label>
		<div class="col-sm-8">
			<div class="radio-inline"><label><input name="sex" value="male" type="radio" <% if(sex!= null) if(sex.equals("male")){ out.print("checked"); }%>> Male</label></div>
			<div class="radio-inline"><label><input name="sex" type="radio" value="female" <% if(sex!= null) if(sex.equals("female")){ out.print("checked");} %>> Female</label></div>
		</div>
	</div>
	
	<% System.out.print("ddddddd2"); %>
 
	
	
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">Address</label>
		<div class="col-sm-8">
			<textarea name="address" id="address" cols="50" rows="4" class="form-control1"><% out.print(address); %></textarea>
		</div>
	</div>

	
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">landline</label>
		<div class="col-sm-8">
			<input value="<% out.print(l_no); %>"  id="l_no" name="l_no" type="number" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
		
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">mobile</label>
		<div class="col-sm-8">
			<input value="<% out.print(mobile); %>"  id="mobile" name="mobile" type="number" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	


	
						<div class="form-group     has-feedback " >
							<label class="control-label col-sm-2 text-capitalize" for="image">image:</label>
							<div class="col-sm-10">
								<div class="input-group" id="image-up" style="margin: 0 0 0 0em;">
									<div class="input-group-btn">
										<button class="btn btn-info " id="select-file" type="button">select</button>
									</div> <input name="image" value="<% out.print(image); %>"  type="text" class="form-control get-selected-imgg" disabled="disabled">
								</div>
	<div style="width:100%;text-align: center;">
	<img  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/images/default.png'" src="<%out.print(controller.Controller.returnPath (request));%>/employee/images_/<% out.print(image);  %>" class="img-rounded" id="prev_image_here_n" width="250" height="250"> </div></div>
								
								
							</div>
						 
 
 <button class="btn btn-lg btn-success1 btn-block" type="submit">Submit</button>
</form>
						</div>
					</div>
					
	 
 
 
  </div>
  <div class="copy_layout">
      <p>Copyright © 2017 Modern. All Rights Reserved | Design by <a href="http://u.com/" target="_blank">u</a> </p>
  </div>
  </div> 
  
  
  
  
<form   method="post" class="hidden" action="<%out.print(controller.Controller.returnPath (request));%>/fileupload" enctype="multipart/form-data" id="select-upload-me">
    <input type="file" name="file" class="hidden"  accept="image/x-png,image/gif,image/jpeg"  />
    <input type="submit" class="hidden"/>
</form>  

 <div class="container">
  
   <!-- Button trigger modal -->
  <button type="button" class="hidden" data-target="#modal" data-toggle="modal" id="show_image_to_crop"> </button>

  <!-- Modal -->
  <div class="modal fade" id="modal" role="dialog" aria-labelledby="modalLabel" tabindex="-1"   >
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalLabel">Cropper</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        </div>
        <div class="modal-body">
          <div class="img-container">
            <img id="image" src="" alt="Picture">
          </div>
        </div>
        <div class="modal-footer">
                <input type="hidden" id="x" name="x" />
                <input type="hidden" id="y" name="y" />
                <input type="hidden" id="w" name="w" />
                <input type="hidden" id="h" name="h" />

                <input type="hidden" id="r" name="r" />
                <input type="hidden" id="sx" name="sx" />
                <input type="hidden" id="sy" name="sy" />
                
                
		        <div class="btn-group">
		          <button type="button" class="btn btn-primary action_crop" data-method="move" data-option="-10" data-second-option="0" title="Move Left">
		              <span class="fa fa-arrow-left"></span>
		          </button>
		          <button type="button" class="btn btn-primary action_crop" data-method="move" data-option="10" data-second-option="0" title="Move Right">
		              <span class="fa fa-arrow-right"></span>
		          </button>
		          <button type="button" class="btn btn-primary action_crop"  data-method="move" data-option="0" data-second-option="-10" title="Move Up">
		              <span class="fa fa-arrow-up"></span>
		          </button>
		          <button type="button" class="btn btn-primary action_crop" data-method="move" data-option="0" data-second-option="10" title="Move Down">
		              <span class="fa fa-arrow-down"></span>
		          </button>
		        </div>
                
                <div class="btn-group hidden">
		          <button type="button" class="btn btn-primary action_crop" data-method="rotate" data-option="-45" title="Rotate Left">
		              <span class="fa fa-rotate-left"></span>
		          </button>
		          <button type="button" class="btn btn-primary action_crop" data-method="rotate" data-option="45" title="Rotate Right">
 		              <span class="fa fa-rotate-right"></span>
		          </button>
		        </div>
		        <div class="btn-group">
		          <button type="button" class="btn btn-primary action_crop" data-method="zoom" data-option="0.1" title="Zoom In">
 		              <span class="fa fa-search-plus"></span>
		          </button>
		          <button type="button" class="btn btn-primary action_crop" data-method="zoom" data-option="-0.1" title="Zoom Out">
 		              <span class="fa fa-search-minus"></span>
		          </button>
		        </div>
		        
		        <div class="btn-group">
		          <button type="button" class="btn btn-primary action_crop" data-method="scaleX" data-option="-1" title="Flip Horizontal">
		              <span class="fa fa-arrows-h"></span>
		          </button>
		          <button type="button" class="btn btn-primary action_crop" data-method="scaleY" data-option="-1" title="Flip Vertical">
		              <span class="fa fa-arrows-v"></span>
		          </button>
		        </div>
		        
		                <div class="btn-group">
				          <button type="button" class="btn btn-primary action_crop" data-method="clear" title="Clear"> 
				              <span class="fa fa-remove"></span>
				          </button>
				           <button type="button" class="btn btn-primary action_crop" data-method="reset" title="Reset">
				              <span class="fa fa-refresh"></span>
				          </button>
				          <button type="button" class="btn btn-success " data-dismiss="modal" > 
				              <span class="fa fa-check"></span>
				          </button>
				        </div>

        </div>
      </div>
    </div>
  </div>
</div>


  
		
<%@include file="footer.jsp"%> 	
		
		
		
		







































<%-- <%@include file="footer.jsp"%> 	 --%>