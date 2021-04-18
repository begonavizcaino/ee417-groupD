<%
if(!Utils.isUserConnected(request)) {
	response.sendRedirect("index.jsp");
	return;
}
%><!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB Main</title>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/menubar.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
    <script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
</head>
<body >

	<%@ include file="menubar.jsp" %>

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
                                            <span>Academic</span>
                                            <a href="post.jsp?postid=2"><h4>Student Support Stories</h4></a>
                                            <ul class="post-info">
                                                <li><a href="#">Admin</a></li>
                                                <li><a href="#">April 18th, 2021</a></li>
                                                <li><a href="#">4 Comments</a></li>
                                            </ul>
                                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                                                 Rem voluptas consequuntur culpa inventore. Cupiditate amet
                                                  beatae quasi mollitia, provident sint eligendi! Nemo magnam 
                                                  illo aperiam cupiditate labore reprehenderit maxime obcaecati, 
                                                  ducimus provident est quos quod magni enim, perspiciatis iusto nam!
                                            </p>
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
                                
                                <!-- Post #2 -------------------------------------------------->
                                <div class="col-lg-12">
                                    <div class="blog-post">
                                        <div class="blog-thumb">
                                            <img src="images/productivity.jpg" alt="">
                                        </div>
                                        <div class="down-content">
                                            <span>College Life</span>
                                            <a href="post.jsp?postid=2"><h4>Staying Productive</h4></a>
                                            <ul class="post-info">
                                                <li><a href="#">Admin</a></li>
                                                <li><a href="#">April 18th, 2021</a></li>
                                                <li><a href="#">4 Comments</a></li>
                                            </ul>
                                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                                                Rem voluptas consequuntur culpa inventore. Cupiditate amet
                                                 beatae quasi mollitia, provident sint eligendi! Nemo magnam 
                                                 illo aperiam cupiditate labore reprehenderit maxime obcaecati, 
                                                 ducimus provident est quos quod magni enim, perspiciatis iusto nam!
                                           </p>
                                           <div class="post-options">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <ul class="post-tags">
                                                            <li><i class="fa fa-tags"></i></li>
                                                            <li><a href="#">College life</a>,</li>
                                                            <li><a href="#">Student Life</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-6">
                                                        <ul class="post-share">
                                                            <li><i class="fa fa-share-alt"></i></li>
                                                            <li><a href="#">Facebook</a>,</li>
                                                            <li><a href="#">Twitter</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Post #3 -------------------------------------------------->
                                <div class="col-lg-12">
                                    <div class="blog-post">
                                        <div class="blog-thumb">
                                            <img src="images/campus.jpg" alt="">
                                        </div>
                                        <div class="down-content">
                                            <span>Campus</span>
                                            <a href="post.jsp?postid=2"><h4>Making most of your day</h4></a>
                                            <ul class="post-info">
                                                <li><a href="#">Admin</a></li>
                                                <li><a href="#">April 18th, 2021</a></li>
                                                <li><a href="#">4 Comments</a></li>
                                            </ul>
                                            <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                                                Rem voluptas consequuntur culpa inventore. Cupiditate amet
                                                 beatae quasi mollitia, provident sint eligendi! Nemo magnam 
                                                 illo aperiam cupiditate labore reprehenderit maxime obcaecati, 
                                                 ducimus provident est quos quod magni enim, perspiciatis iusto nam!
                                           </p>
                                           <div class="post-options">
                                                <div class="row">
                                                    <div class="col-6">
                                                        <ul class="post-tags">
                                                            <li><i class="fa fa-tags"></i></li>
                                                            <li><a href="#">Campus</a>,</li>
                                                            <li><a href="#">Sports</a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="col-6">
                                                        <ul class="post-share">
                                                            <li><i class="fa fa-share-alt"></i></li>
                                                            <li><a href="#">Facebook</a>,</li>
                                                            <li><a href="#">Twitter</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- All Posts Link -------------------------------------------------->
                                <div class="col-lg-12">
                                    <div class="main-button">
                                        <a href="#">View All Posts</a>
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

	<%@ include file="footer.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->
    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>