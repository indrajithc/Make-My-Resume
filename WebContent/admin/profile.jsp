
<%@include file="header.jsp"%>


<section class="content-header">
	<h1>
		Form <small>Optional description</small>
	</h1>
	<ol class="breadcrumb">		
		<li class="now_home"></li>
		<li class="active">Here</li>
	</ol>
</section>

<section class="content">


	<div class=""> 
		<div class="panel panel-default">
			<div class="panel-heading">Sample Form</div>
			<div class="panel-body">
				<div class="col-md-offset-2 col-md-6">
					
					<form class="form-horizontal" id="update-admin">
					
					
					<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="name">Name:</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="name"	placeholder="Enter name" name="name">  
							</div>
						</div>
					
					
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="email">Email:</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="email"
									placeholder="Enter email" name="email">  
							</div>
						</div>
						
						 
						
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">mobile:</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="mobile" placeholder="Enter mobile" name="mobile">  
							</div>
						</div>
						
						<div class="form-group    has-feedback  ">
							<label class="control-label col-sm-2 text-capitalize" for="url">landline:</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="l_no" placeholder="Enter mobile" name=l_no>  
							</div>
						</div>
						 
					 
					 
					  

						<div class="form-group     has-feedback ">
							<label class="control-label col-sm-2 text-capitalize" for="image">image:</label>
							<div class="col-sm-10">
								<div class="input-group" id="image-up">
									<div class="input-group-btn">
										<button class="btn btn-info " id="select-file" type="button">select</button>
									</div> <input type="text" class="form-control get-selected-imgg" disabled="disabled">
								</div>
								
								
							</div>
						</div>



						<div class="form-group">
					    <div class="col-sm-offset-2 col-sm-10">
					      <button type="submit" class="btn btn-default">Submit</button>
					    </div>
					  </div>
	
					</form>
					
					
				</div>

			</div>
		</div>
	</div>




</section>


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
