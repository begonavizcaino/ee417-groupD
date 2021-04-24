<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB</title>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link rel="stylesheet" type="text/css" media='screen' href="css/menubar.css">
    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
    <script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
</head>
<body>

	<%@ include file="menubar.jsp" %>
	
    <!-- Blog Highlights Start -->

    <div class="wrapper row3 coloured">
        <div id="highlights">
        <main class="hoc clear"> 
            <!-- main body -->
            <div id="introblocks">
                <ul class="nospace group">
                    <li class="one_third first">
                        <article>
                        <div>
                            <h6 class="heading">Student Support Blog</h6>
                        </div>
                        <img src="images/intro.jpg" alt="">
                        <footer><a href="studentsupport_article.jsp">More Details</a></footer>
                        </article>
                    </li>
                    <li class="one_third">
                        <article>
                        <div>
                            <h6 class="heading">International Students </h6>
                        </div>
                        <img src="images/campus.jpg" alt="">
                        <footer><a href="intstudent_article.jsp">More Details</a></footer>
                        </article>
                    </li>
                    <li class="one_third">
                        <article>
                        <div>
                            <h6 class="heading">Covid-19 Latest News</h6>
                        </div>
                        <img src="images/productivity.jpg" alt="">
                        <footer><a href="covid_article.jsp">More Details</a></footer>
                        </article>
                    </li>
                </ul>
            </div>
        </main>
        </div>
    </div>

<!-- ******************************************************************************************* -->
    <!-- Testimonials Start-->

    <div class="wrapper row3 coloured">
        <section class="hoc container clear s-testimonials" > 
            <div class="sectiontitle center">
                <h3 class="heading">Testimonials</h3>
                <p> What international students are saying</p>
            </div>
            <div class=" one_quarter first testimonial">
                <div class="testimonial-author">
                    <img src="images/user1.jpg" alt="Author image" class="testimonial-avatar">
                    <cite class="testimonial-cite">
                        <strong>Jane</strong>
                        <span>UCD</span>
                    </cite>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur, 
                    adipisicing elit. Cum, quo dolore harum dolorum 
                    amet error quae provident dolor. Accusantium ducimus 
                    sapiente iure est corporis magni consequuntur deleniti 
                    corrupti quos maiores.
                </p>
            </div> <!-- end testimonials__slide -->    

            <div class="one_quarter  testimonial">
                <div class="testimonial-author">
                    <img src="images/user2.jpg" alt="Author image" class="testimonial-avatar">
                    <cite class="testimonial-cite">
                        <strong>Domnic</strong>
                        <span>DCU</span>
                    </cite>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur, 
                    adipisicing elit. Cum, quo dolore harum dolorum 
                    amet error quae provident dolor. Accusantium ducimus 
                    sapiente iure est corporis magni consequuntur deleniti 
                    corrupti quos maiores.
                </p>
            </div> <!-- end testimonials__slide -->     
            <div class="one_quarter  testimonial">
                <div class="testimonial-author">
                    <img src="images/user3.jpg" alt="Author image" class="testimonial-avatar">
                    <cite class="testimonial-cite">
                        <strong>Domnic</strong>
                        <span>TUD</span>
                    </cite>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur, 
                    adipisicing elit. Cum, quo dolore harum dolorum 
                    amet error quae provident dolor. Accusantium ducimus 
                    sapiente iure est corporis magni consequuntur deleniti 
                    corrupti quos maiores.
                </p>
            </div> <!-- end testimonials__slide -->  
            <div class="one_quarter  testimonial">
                <div class="testimonial-author">
                    <img src="images/user4.jpg" alt="Author image" class="testimonial-avatar">
                    <cite class="testimonial-cite">
                        <strong>Domnic</strong>
                        <span>UCC</span>
                    </cite>
                </div>
                <p>Lorem ipsum dolor sit amet consectetur, 
                    adipisicing elit. Cum, quo dolore harum dolorum 
                    amet error quae provident dolor. Accusantium ducimus 
                    sapiente iure est corporis magni consequuntur deleniti 
                    corrupti quos maiores.
                </p>
            </div> <!-- end testimonials__slide -->    
        </section>
    </div>

  <!-- ******************************************************************************************* -->

	<%@ include file="footer.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->

    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>