
<%@include file="header.jsp"%> 	 

	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
	%>
	  
	  
	  
	  <%

	includes.Connection con = new includes.Connection();
	 
	 
	
	String query = " SELECT * FROM `employer` WHERE username='" + user.getEmail()+ "' AND delete_status = 0 ORDER BY date DESC ";

 	String id =  null;
 	String username =  null;
 	String company =  null;
 	String pin =  null;
 	String country =  null;
 	String state =  null;
 	String contact =  null;
 	String start_date =  null;
 	String vision =  null;
 	String hr_contact =  null;
 	String url =  null;
 	String l_no =  null;
 	String mobile =  null;
 	String about =  null;
 	String image =  null; 
			
			try {
				 java.sql.ResultSet rs = ( java.sql.ResultSet) con.display(query   );
				 
				while(rs.next()) {

				 	  id =  rs.getString("id");
				 	  username =  rs.getString("username");
				 	  company =  rs.getString("company");
				 	  pin =  rs.getString("pin");
				 	  country =  rs.getString("country");
				 	  state =  rs.getString("state");
				 	  contact =  rs.getString("contact");
				 	  start_date =  rs.getString("start_date");
				 	  vision =  rs.getString("vision");
				 	  hr_contact =  rs.getString("hr_contact");
				 	  url =  rs.getString("url");
				 	  l_no =  rs.getString("l_no");
				 	  mobile =  rs.getString("mobile");
				 	  about =  rs.getString("about");
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
						
						
						
<form class="form-horizontal" id="update-employer">

<input value="<% out.print(id); %>" id="id" name="id" type="text" class="hidden" >
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">Name</label>
		<div class="col-sm-8">
			<input value="<% out.print(company); %>" id="company" name="company" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label">email</label>
		<div class="col-sm-8">
			<input value="<% out.print(username); %>" id="username" name="username" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	
 
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">pin</label>
		<div class="col-sm-8">
			<input value="<% out.print(pin); %>"  id="pin" name="pin" type="text" class="form-control1"  placeholder="Default Input">
		</div> 
	</div>
	
	
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">country</label>
		<div class="col-sm-8"> 
			<select class="form-control1"  id="country" name="country"></select>
		</div> 
	</div>
	
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">state</label>
		<div class="col-sm-8">
			<select  class="form-control1"  name="state" id="state"></select>
		</div> 
	</div>
	   
      
	<script type="text/javascript">
		$(document).ready(function(){			
			setTimeout(function(){
				
				setTimeout(function(){
					$('#state').val("<% out.print(state); %>").trigger('change');
				}, 1000);

				$('#country').val("<% out.print(country); %>").trigger('change');
				
			}, 1000);
		});
	</script>
	
        
	<div class="form-group   has-feedback">
		<label for="focusedinput" class="col-sm-2 control-label text-capitalize">start date</label>
		<div class="col-sm-8"> 
			<input value="<% out.print(start_date); %>"  type="text" class="form-control" id="start_date" placeholder="Enter start date" name="start_date"   data-date-format="yyyy-mm-dd">  
							
		</div> 
	</div> 
    	
	
	
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">vision</label>
		<div class="col-sm-8">
			<textarea name="vision" id="vision" cols="50" rows="4" class="form-control1"><% out.print(vision); %></textarea>
		</div>
	</div>
	
	
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">hr contact</label>
		<div class="col-sm-8">
			<textarea name="hr_contact" id="hr_contact" cols="50" rows="4" class="form-control1"><% out.print(hr_contact); %></textarea>
		</div>
	</div>
	
		
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">url</label>
		<div class="col-sm-8">
			<textarea name="url" id="url" cols="50" rows="4" class="form-control1"><% out.print(url); %></textarea>
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
	
	
			
	<div class="form-group   has-feedback">
		<label for="txtarea1" class="col-sm-2 control-label text-capitalize">about</label>
		<div class="col-sm-8">
			<textarea name="about" id="about" cols="50" rows="4" class="form-control1"><% out.print(about); %></textarea>
		</div>
	</div>
	
	
						<div class="form-group     has-feedback ">
							<label class="control-label col-sm-2 text-capitalize" for="image">image:</label>
							<div class="col-sm-10">
								<div class="input-group" id="image-up">
									<div class="input-group-btn">
										<button class="btn btn-info " id="select-file" type="button">select</button>
									</div> <input name="image" value="<% out.print(image); %>"  type="text" class="form-control get-selected-imgg" disabled="disabled">
								</div>
	<div style="width:100%;text-align: center;">
	<img  onerror="javascript:this.src='<%out.print(controller.Controller.returnPath (request));%>/assets/images/default.png'" src="<%out.print(controller.Controller.returnPath (request));%>/employer/images_/<% out.print(image);  %>" class="img-rounded" id="prev_image_here_n" width="250" height="250"> </div></div>
								
								
							</div>
						 
 
 <button class="btn btn-lg btn-success1 btn-block" type="submit">Submit</button>
</form>
						</div>
					</div>
					
	 
 
 
  </div>
  <div class="copy_layout">
      <p>Copyright © 2015 Modern. All Rights Reserved | Design by <a href="http://w3layouts.com/" target="_blank">W3layouts</a> </p>
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