<%@page import="db.Role"%>
<%@page import="db.User"%>
<%@page import="utils.Utils"%>

<% 
User u = Utils.getUser(request);// get the user
if(u == null) {
	response.sendRedirect("./login.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>
<!DOCTYPE html>
<html>
	<head>
		<title>InterBlog - Post</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
	</head>
	<body>
		<!-- Posts Comment Start-->

	    <div class="wrapper row3 ">
	        <div class="hoc container clear"> 
	            <div class="group">
	                <section class="first blog-posts">
	                    <div class="col-lg-12">
	                        <div class="sidebar-item comments">
	                          <div class="sidebar-heading">
	            
	                            <h2><%= u.getComments().length() %> comments</h2>   <!-- get the number of the comments  -->
	                          </div>
	                          <div class="content">
	                            <ul>
	                            	<%= for(int i=0; i<= u.getComments().length(); i++) {%> <!-- read all comments loop  -->
	                            		<%= if(u.getComments()[i].isReplied){ %>			<!-- verify is this comment a reply? -->
	                            			<li class="replied">
	                            		<%= } %>
	                            		<%= else %> <li>
	                            		<div class="author-thumb">
	                            			<img src=<%= u.getComments().image() %> alt="">  <!-- get the poster's photo -->
	                            		</div>	
	                            		<div class="right-content">
	                            			<h4><%= u.getComments().name() %><span><%= u.getComments().time() %></span></h4> <!-- get the poster's name and post time -->
	                            			<p><%= u.getComments().message() %></p> 		<!-- get the poster's message -->
	                            		</div>
	                              	</li>
	                            	<%= } %>
	                            </ul>
	                          </div>
	                        </div>
	                      </div>
	                </section>
	            </div>
	        </div>
	    </div>
       
    	<!-- Post Comments End-->
		
	</body>
</html>