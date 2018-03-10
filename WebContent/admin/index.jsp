
<%@include file="header.jsp"%> 	 

	
	<%
	  httpSession = request.getSession();
	  user = (User)  httpSession.getAttribute("user");
	  
	
	%>
	  
	
	 
 
 
 
 
            <section class="content-header">
                <h1>
            Page Header
            <small>Optional description</small>
          </h1>
          <h2> <% if( user != null) { user.getEmail(); } %> </h2>
	
                <ol class="breadcrumb">
					<li class="now_home"></li>
                    <li class="active">Here</li>
                </ol>
            </section>

<!--             <section class="content"> -->

<!--                 <div class="info-box"> -->
<!--                     <span class="info-box-icon bg-black"><i class="fa ion-android-checkmark-circle"></i></span> -->
<!--                     <div class="info-box-content"> -->
<!--                         <span class="info-box-text">Things</span> -->
<!--                         <span class="info-box-number">93,139</span> -->
<!--                     </div> -->
<!--                 </div> -->

<!--             </section> -->
    

 

<%@include file="footer.jsp"%> 	