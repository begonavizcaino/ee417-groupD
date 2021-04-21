<%@page import="db.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Database"%>
<%@page import="db.Role"%>
<%@page import="db.User"%>
<%@page import="db.AttachedContent"%>
<%@page import="utils.Utils"%>

<% 
User u = Utils.getUser(request);// get the user
if(u == null) {
	response.sendRedirect("./signup.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
Post post;
ArrayList<Post> comments;

ArrayList<AttachedContent> contents;

try {
	int postId = Integer.parseInt(request.getParameter("postid"));
	post = Database.postDao.findOneById(postId);
	if(post == null || post.getParentPost() == null) throw new Exception();
	comments = post.getComments();// each getComments is a sql query, let's make only one
	contents = post.getAttachedContent();
} catch(Exception e) {
	response.sendRedirect("./main.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset='utf-8'>
	    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
	    <title>ISB Post</title>
	    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	    <link rel='stylesheet' type='text/css' media='screen' href='css/singlepost.css'>
	    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
	    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
	    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
	    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
	    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
	    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
        <script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
	</head>
	<body>
		
	<%@ include file="menubar.jsp" %>

    <!-- Blog Posts Start-->

    <div class="wrapper">
        <div class="hoc container clear"> 
            <div class="main-button">
                <a href="main.jsp">Back</a>
            </div>
            <section class="blog-posts">
                <div class="two_third first">  
                    <div class="col-lg-8">
                        <div class="all-blog-posts">
                            <div class="row">

                                <!-- Post #1 -------------------------------------------------->
                                
                                <div class="col-lg-12">
                                    <div class="blog-post">
                                        <div class="blog-thumb">
                                            <img id="post-image" src="" alt="">
                                            <p id="post-temp-p" style="display: none;"><%= post.getFirstAttachedContent() %></p>
                                        </div>
                                        <div class="down-content">
                                            <span>ACADEMIC</span>
                                            <a><h4><%=post.getTitle() %></h4></a>
                                            <ul class="post-info">
                                                <li><a href="#"><%=post.getUser().getUsername() %></a></li>
                                                <li><a><%=post.getDate() %></a></li>
                                                <li><a><%= comments.size() %> Comments</a></li>
                                            </ul>
                                            <p><%=post.getMessage() %></p>
                                            <div class="post-options">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <ul class="post-tags">
                                                            <li><i class="fa fa-tags"></i></li>
                                                            <li><a href="#">Academic</a>,</li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-6">
                                                        <ul class="post-share">
                                                            <li><i class="fa fa-share-alt"></i></li>
                                                            <li><a href="#">Facebook</a>,</li>
                                                            <li><a href="#"> Twitter</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      

                <!-- Sidebar -->
                <%@ include file="postsidebar.jsp" %>
            </section>
        </div>
    </div>
       
    <!-- Blog Posts End-->
<!-- ******************************************************************************************* -->

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
		                            			<img src=<%= comment.getUser().getPicture() %> alt="">  <!-- get the poster's photo -->
		                            		</div>	
		                            		<div class="right-content">
		                            			<h4><%= comment.getUser().getFirstName() %> <%= comment.getUser().getLastName() %><span><%= comment.getDate() %></span></h4> <!-- get the poster's name and post time -->
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
    	
    	<div class="wrapper row3 ">
        <div class="hoc container clear"> 
            <div class="group">
                <section class="blog-posts">
                    <div class="col-lg-12">
                        <div class="sidebar-item submit-comment">
                          <div class="sidebar-heading">
                            <h2>Leave a comment</h2>
                          </div>
                          <div class="content">
                            <form id="comment" action="Comment" method="post">
                            <input type="text" name="postid" class="hidden" value="<%= post.getId() %>" />
                              <div class="row">
                                <div class="col-lg-12">
                                  <fieldset>
                                    <textarea name="message" rows="6" id="message" placeholder="Type your comment" required=""></textarea>
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                    <button type="submit" id="form-submit" class="main-button">Submit</button>
                                  </fieldset>
                                </div>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
      
                </section>
            </div>
        </div>
    </div>

    <!-- Footer-> Main Footer Start -->

    <%@ include file="footer.jsp" %>
	</body>

    <script>
        $(function() {
            $("#post-image").attr("src", $("#post-temp-p").html())
        })
    </script>
</html>