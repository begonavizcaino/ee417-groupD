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
                            <div class="row post-contents">
                            </div>
                            <div class="col-lg-12">
                                <div class="main-button">
                                    <a id="view_all_btn">View All Posts</a>
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
    <script src="js/post/post.js"></script>
    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>