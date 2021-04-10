<%@page import="db.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Database"%>
<%@page import="db.Role"%>
<%@page import="db.User"%>
<%@page import="utils.Utils"%>

<% 
User u = Utils.getUser(request);// get the user
if(u == null) {
	response.sendRedirect("./login.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
Post post;
ArrayList<Post> comments;
try {
	int postId = Integer.parseInt(request.getParameter("postid"));
	post = Database.postDao.findOneById(postId);
	if(post == null || post.getParentPost() == null) throw new Exception();
	comments = post.getComments();// each getComments is a sql query, let's make only one
} catch(Exception e) {
	response.sendRedirect("./main.html");
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
		<!-- TODO: @Bing add header & post content, formatting etc here (from post1.html) -->
		post content, as an example: <%= post.getMessage() %>
		<!-- Posts Comment Start-->

	    <div class="wrapper row3 ">
	        <div class="hoc container clear"> 
	            <div class="group">
	                <section class="first blog-posts">
	                    <div class="col-lg-12">
	                        <div class="sidebar-item comments">
	                          <div class="sidebar-heading">
	            
	                            <h2><%= comments.size() %> comments</h2>   <!-- get the number of the comments  -->
	                          </div>
	                          <div class="content">
	                            <ul>
	                            	<% for(Post comment : comments) { %> <!-- read all comments loop  -->
	                            		<li> <!-- TODO: Add class replied on concerned comments (not applicable yet) -->
		                            		<div class="author-thumb">
		                            			<img src=<%= comment.getUser().getImage() %> alt="">  <!-- get the poster's photo -->
		                            		</div>	
		                            		<div class="right-content">
		                            			<h4><%= comment.getUser().getUsername() %><span><%= comment.getDate() %></span></h4> <!-- get the poster's name and post time -->
		                            			<p><%= comment.getMessage() %></p> 		<!-- get the poster's message -->
		                            		</div>
		                              	</li>
	                            	<% } %>
	                            </ul>
	                          </div>
	                        </div>
	                      </div>
	                </section>
	            </div>
	        </div>
	    </div>
       
    	<!-- Post Comments End-->
    	
    	<!-- @Bing add comment form (targeting /Comment), keeping only the message field, then footer -->
		
	</body>
</html>