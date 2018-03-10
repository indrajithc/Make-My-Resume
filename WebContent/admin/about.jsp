 
	
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
 
 
 
	
<%@include file="footer.jsp"%> 	