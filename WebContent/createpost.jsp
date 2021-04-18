<%@page import="db.Post"%>
<%@page import="db.Database"%>
<%@page import="utils.Utils"%>
<%@page import="db.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
User u = Utils.getUser(request);// get the user
if(u == null) {
	response.sendRedirect("./signup.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB Post</title>
    <script src="script/jquery-3.5.1.js" type="text/javascript"></script>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/createpost.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
    <script src='/script/main.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
</head>
<body >

	<%@ include file="menubar.jsp" %>

    <!-- Page Intro  Banner Starts -->
	<div class="bgded overlay"> 
     	<div class="main-banner header-text">
            <div class="container-fluid">
                <div class="owl-banner owl-carousel">
                    <div class="item">
                        <img src="images/intro.jpg" style="filter: brightness(0.4)" alt="">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span>Academic</span>
                                </div>
                                <a href="#"><h4>Student Support Stories</h4></a>
                                <ul class="post-info">
                                    <li><a href="#">Admin</a></li>
                                    <li><a href="#">April 18th, 2021</a></li>
                                    <li><a href="#">10 Comments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/productivity.jpg"style="filter: brightness(0.4)" alt="">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span>College Life</span>
                                </div>
                                <a href="post1.html"><h4>Staying Productive</h4></a>
                                <ul class="post-info">
                                    <li><a href="#">Admin</a></li>
                                    <li><a href="#">April 18th, 2021</a></li>
                                    <li><a href="#">10 Comments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/intro3.jpg" style="filter: brightness(0.4)" alt="">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span>Campus</span>
                                </div>
                                <a href="post1.html"><h4>Making most of your day</h4></a>
                                <ul class="post-info">
                                    <li><a href="#">Admin</a></li>
                                    <li><a href="#">April 18th, 2021</a></li>
                                    <li><a href="#">10 Comments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/intro.jpg" style="filter: brightness(0.4)" alt="">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span>Academic</span>
                                </div>
                                <a href="post1.html"><h4>Student Support Stories</h4></a>
                                <ul class="post-info">
                                    <li><a href="#">Admin</a></li>
                                    <li><a href="#">April 18th, 2021</a></li>
                                    <li><a href="#">10 Comments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/intro2.jpg"style="filter: brightness(0.4)" alt="">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span>College Life</span>
                                </div>
                                <a href="post1.html"><h4>Staying Productive</h4></a>
                                <ul class="post-info">
                                    <li><a href="#">Admin</a></li>
                                    <li><a href="#">April 18th, 2021</a></li>
                                    <li><a href="#">10 Comments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="images/intro3.jpg" style="filter: brightness(0.4)" alt="">
                        <div class="item-content">
                            <div class="main-content">
                                <div class="meta-category">
                                    <span>Campus</span>
                                </div>
                                <a href="post1.html"><h4>Making most of your day</h4></a>
                                <ul class="post-info">
                                    <li><a href="#">Admin</a></li>
                                    <li><a href="#">April 18th, 2021</a></li>
                                    <li><a href="#">10 Comments</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Intro  Banner End -->
    </div>

    <!-- End Top Background Image Wrapper -->
<!-- ******************************************************************************************* -->

<!-- ******************************************************************************************* -->
    <!-- Create Posts Start-->

    <div class="wrapper ">
        <div class="hoc container clear"> 
            
            <section class="blog-posts">
                <div class="">  
                    <div class="col-lg-12">
                        <div class=" submit-post">
                          <div class="sidebar-heading">
                            <h2>Start a post</h2>
                          </div>
                          <div class="content">
                            <form id="post" action="Post" method="post" enctype="multipart/form-data">
                              <div class="row">
                                <div class="col-md-6 col-sm-12">
                                  <fieldset>
                                    <input name="title" type="text" id="title" placeholder="Post Title" required="">
                                  </fieldset>
                                </div>
                                <div class="col-md-12 col-sm-12">
                                  <fieldset>
                                    <select name="category">
										<% for(Post category : Database.postDao.findCategories()) { %>
											<option value="<%= category.getId() %>"><%= category.getTitle() %></option>
										<% } %>
									</select>
                                  </fieldset>
                                </div>
                                <div class="col-lg-12">
                                  <fieldset>
                                    <textarea name="message" rows="5" id="message" placeholder="Type Here" required=""></textarea>
                                  </fieldset>
                                </div>
                                <div class="col-md-6 col-sm-12">
                                  <fieldset>
                                    <input type="file" name="picture" accept="image/png, image/jpeg" multiple>
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
                </div>
            </section>

        </div>
    </div>
       
    <!-- Create Posts End-->
<!-- ******************************************************************************************* -->

<%@ include file="footer.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->
    <script src="script/jquery-3.6.0.js" type="text/javascript"></script>
    <script src="script/main.js" type="text/javascript"></script>

    <script src="script/custom.js"></script>
    <script src="script/owl.js"></script>
    <script src="script/slick.js"></script>
    <script src="script/isotope.js"></script>
    <script src="script/accordions.js"></script>




    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>