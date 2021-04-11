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
	response.sendRedirect("./login.jsp");
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
<!-- ******************************************************************************************* -->
	    <!-- Top Header Start -->
	
	    <div class="wrapper row0">
	        <div id="topbar" class="hoc clear"> 
	            <div class="fl_left">
	                <ul>
	                <li><i class="fa fa-phone"></i> +000 (00) 000 0000</li>
	                <li><i class="fa fa-envelope-o"></i> info@internationalblog.com</li>
	                </ul>
	            </div>
	            <div class="fl_right">
	                <ul>
	                <li><a href="index.html"><i class="fa fa-lg fa-home"></i></a></li>
	                <li><a href="signup.html">Login</a></li>
	                <li><a href="signup.html">Sign-Up</a></li>
	                <li id="searchform">
	                    <div>
	                      <form action="#" method="post">
	                        <fieldset>
	                          <legend>Quick Search:</legend>
	                          <input type="text" placeholder="Enter search term&hellip;">
	                          <button type="submit"><i class="fas fa-search"></i></button>
	                        </fieldset>
	                      </form>
	                    </div>
	                  </li>
	                </ul>
	            </div>
	        </div>
	    </div>
	
	    <!-- Top Header End -->
<!-- ******************************************************************************************* -->


<!-- ******************************************************************************************* -->
    <!-- Blog Posts Start-->

    <div class="wrapper  ">
        <div class="hoc container clear"> 
            <section class="blog-posts">
                <div class="two_third first">  
                    <div class="col-lg-8">
                        <div class="all-blog-posts">
                            <div class="row">

                                <!-- Post #1 -------------------------------------------------->
                                
                                <div class="col-lg-12">
                                    <div class="blog-post">
                                        <div class="blog-thumb">
                                            <img src="images/intro.jpg" alt="">
                                        </div>
                                        <div class="down-content">
                                            <span>ACADEMIC</span>
                                            <a href="post1.html"><h4>Student Support Stories</h4></a>
                                            <ul class="post-info">
                                                <li><a href="#">Admin</a></li>
                                                <li><a href="#">April 18th, 2021</a></li>
                                                <li><a href="#"><%= comments.size() %> Comments</a></li>
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
                <div class="one_third ">
                    <div class="col-lg-4">
                        <div class="sidebar">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="sidebar-item search">
                                        <form id="search_form" name="gs" method="GET" action="#">
                                            <input type="text" name="q" class="searchText" placeholder="type to search..." autocomplete="on">
                                        </form>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="sidebar-item recent-posts">
                                        <div class="sidebar-heading">
                                            <h2>Recent Posts</h2>
                                        </div>
                                        <div class="content">
                                            <ul>
                                                <li><a href="post1.html">
                                                    <h5>Student Support Stories</h5>
                                                    <span>April 18, 2021</span>
                                                </a></li>
                                                <li><a href="post1.html">
                                                    <h5>Staying Productive</h5>
                                                    <span>April 18, 2021</span>
                                                </a></li>
                                                <li><a href="post1.html">
                                                    <h5>Making Most of yourday</h5>
                                                    <span>April 18, 2021</span>
                                                </a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="sidebar-item categories">
                                        <div class="sidebar-heading">
                                            <h2>Categories</h2>
                                        </div>
                                        <div class="content">
                                            <ul>
                                                <li><a href="#">- Academic</a></li>
                                                <li><a href="#">- Campus</a></li>
                                                <li><a href="#">- College life</a></li>
                                                <li><a href="#">- Student Life</a></li>
                                                <li><a href="#">- Sports</a></li>
                                                <li><a href="#">- Creativity</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="sidebar-item tags">
                                        <div class="sidebar-heading">
                                            <h2>Tags</h2>
                                        </div>
                                        <div class="content">
                                            <ul>
                                                <li><a href="#">- Academic</a></li>
                                                <li><a href="#">- Campus</a></li>
                                                <li><a href="#">- College life</a></li>
                                                <li><a href="#">- Student Life</a></li>
                                                <li><a href="#">- Sports</a></li>
                                                <li><a href="#">- Creativity</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
    	<form id="comment" action="#" method="post">
    		<input name="name" type="text" id="name" placeholder="Your name" required="">
    		<input name="email" type="text" id="email" placeholder="Your email" required="">
    		<input name="subject" type="text" id="subject" placeholder="Subject">
    		<textarea name="message" rows="6" id="message" placeholder="Type your comment" required=""></textarea>
    		<button type="submit" id="form-submit" class="main-button">Submit</button>
      	</form>
      	
<!-- ******************************************************************************************* -->
    <!-- Footer-> Main Footer Start -->

    <div class="wrapper row4">
        <footer id="footer" class="hoc clear"> 
            <div class="one_third first">
            <h6 class="heading">Reach out</h6>
            <p>Getting in Touch is easy! Find us & follow us here</p>
            <ul class="faico clear">
              <li><a class="faicon-facebook" href="#"><i class="fab fa-facebook"></i></a></li>
              <li><a class="faicon-google-plus" href="#"><i class="fab fa-google-plus-g"></i></a></li>
              <li><a class="faicon-linkedin" href="#"><i class="fab fa-linkedin"></i></a></li>
              <li><a class="faicon-twitter" href="#"><i class="fab fa-twitter"></i></a></li>
              <li><a class="faicon-instagram" href="#"><i class="fab fa-instagram"></i></a></li>
            </ul>
          </div>
          <div class="one_third ">
            <h6 class="heading">Explore More</h6>
            <ul class="nospace linklist">
              <li><a href="index.html">Home</a></li>
              <li><a href="#">About Us</a></li>
              <li><a href="contactus.html">Contact Us</a></li>
              <li><a href="#">Privacy</a></li>
            </ul>
          </div>
          <div class="one_third">
            <h6 class="heading">Our Newsletter</h6>
            <p class="nospace btmspace-15">Enter your email address to follow this blog and receive notifications by email.</p>
            <form method="post" action="#">
              <fieldset>
                <legend>Newsletter:</legend>
                <input class="btmspace-15" type="text" value="" placeholder="Name">
                <input class="btmspace-15" type="text" value="" placeholder="Email">
                <button  type="submit" value="submit">Submit</button>
              </fieldset>
            </form>
          </div>
        </footer>
      </div>

    <!-- Footer-> Main Footer End -->
<!-- ******************************************************************************************* -->

<!-- ******************************************************************************************* -->
    <!-- Footer-> Copy Right bar Start -->

    <div class="wrapper row5">
        <div id="copyright" class="hoc clear"> 
            <p>Copyright &copy; <script>document.write(new Date().getFullYear())</script> - All Rights Reserved - <a href="#">InternationalBlog</a></p>
        </div>
    </div>

    <!-- Footer-> Copy Right bar End -->
<!-- ******************************************************************************************* -->
		
	</body>
</html>