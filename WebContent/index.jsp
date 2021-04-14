<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.Role"%>
<%@page import="db.User"%>
<%@page import="utils.Utils"%>
<% 
User u = Utils.getUser(request);
if(u == null) {
	response.sendRedirect("./login.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB</title>
    <script src="script/jquery-3.5.1.js" type="text/javascript"></script>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>    
    <script src='script/main.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="menubar.jsp" %>
	
	<!-- Page Intro Start-->
	<div class="bgded overlay" style="background-image:url('images/intro.jpg')"> 
	    <div id="pageintro" class="hoc clear">
	        <div class="intro">
	            <ul class="slides">
	            <li>
	                <article>
	                <h3 class="heading">Marketing Message #1</h3>
	                <p>We Are Here To Support You</p>
	                </article>
	            </li>
	            <li>
	                <article>
	                <h3 class="heading">Marketing Message #2</h3>
	                <p>We Are Here for You</p>
	                </article>
	            </li>
	            <li>
	                <article>
	                <h3 class="heading">Marketing Message #3</h3>
	                <p>Join Our Network</p>
	                </article>
	            </li>
	            </ul>
	        </div>
	    </div>
    </div>
    <!-- Page Intro End-->

<!-- ******************************************************************************************* -->
    <!-- Blog Higlights Start -->

    <div class="wrapper row3 coloured">
        <main class="hoc container clear"> 
            <!-- main body -->
            <div id="introblocks">
                <ul class="nospace group">
                    <li class="one_third first">
                        <article>
                        <div>
                            <h6 class="heading">Student Support Blog</h6>
                        </div>
                        <img src="images/intro.jpg" alt="">
                        <footer><a href="#">More Details</a></footer>
                        </article>
                    </li>
                    <li class="one_third">
                        <article>
                        <div>
                            <h6 class="heading">International Studnet </h6>
                        </div>
                        <img src="images/campus.jpg" alt="">
                        <footer><a href="#">More Details</a></footer>
                        </article>
                    </li>
                    <li class="one_third">
                        <article>
                        <div>
                            <h6 class="heading">Covid-19 Latest News</h6>
                        </div>
                        <img src="images/productivity.jpg" alt="">
                        <footer><a href="#">More Details</a></footer>
                        </article>
                    </li>
                </ul>
            </div>
            <!-- / main body -->
            <div class="clear"></div>
        </main>
    </div>

<!-- ******************************************************************************************* -->
    <!-- About Us Start-->

    <div class="wrapper bgded overlay" style="background-image:url('images/aboutus.jpg')">
        <section class="hoc container clear"> 
            <div class="sectiontitle center">
                    <h3 class="heading">About Us</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis officia quo nam reiciendis dignissimos sequi dolor et,
                        quasi libero animi obcaecati quibusdam dolores optio! Dolorum maiores aut inventore eos fuga! Possimus,
                        cupiditate illum dolore asperiores vitae aut voluptatum recusandae saepe?
                    </p>
            </div>
            <div class="one_third first">
                    <h3 class="heading">Who We Are</h3>
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis officia quo nam reiciendis dignissimos sequi dolor et,
                        quasi libero animi obcaecati quibusdam dolores optio! Dolorum maiores aut inventore eos fuga! Possimus,
                        cupiditate illum dolore asperiores vitae aut voluptatum recusandae saepe?
                    </p>
            </div>
            <div class="one_third">
                <h3 class="heading">Our Values</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis officia quo nam reiciendis dignissimos sequi dolor et,
                    quasi libero animi obcaecati quibusdam dolores optio! Dolorum maiores aut inventore eos fuga! Possimus,
                    cupiditate illum dolore asperiores vitae aut voluptatum recusandae saepe?
                </p>
            </div>
            <div class="one_third">
                <h3 class="heading">Our Services</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corporis officia quo nam reiciendis dignissimos sequi dolor et,
                    quasi libero animi obcaecati quibusdam dolores optio! Dolorum maiores aut inventore eos fuga! Possimus,
                    cupiditate illum dolore asperiores vitae aut voluptatum recusandae saepe?
                </p>
            </div>
        </section>
    </div>

    <!-- About Us End-->
  <!-- ******************************************************************************************* -->

  <!-- ******************************************************************************************* -->
    <!-- Meet Our Team Start-->

    <div class="wrapper row3 coloured">
        <section class="hoc container clear team-block" > 
            <div class="sectiontitle center">
                    <h3 class="heading">Meet Our Team</h3>
                    <p> </p>
            </div>
            <div class="one_quarter first team-member" >
                <div class="team-member__pic">
                    <img src="images/team1.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Sarah Parker xx
                        <span>Project Manager</span>
                    </p>
                    <ul class="team-member__social">
                        <li><a href="#"><i class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin-in" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="one_quarter  team-member" >
                <div class="team-member__pic">
                    <img src="images/team2.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Edward Jan xx
                        <span>Public Relation</span>
                    </p>
                    <ul class="team-member__social">
                        <li><a href="#"><i class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin-in" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="one_quarter  team-member" >
                <div class="team-member__pic">
                    <img src="images/team3.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Derek Silver xx
                        <span>Social Media </span>
                    </p>
                    <ul class="team-member__social">
                        <li><a href="#"><i class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin-in" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>
            <div class="one_quarter  team-member" >
                <div class="team-member__pic">
                    <img src="images/team4.jpg"  alt="">
                </div>
                <div class="team-member__info">
                    <p class="team-member__name">
                        Sarah Parker xx
                        <span>Student Support</span>
                    </p>
                    <ul class="team-member__social">
                        <li><a href="#"><i class="fab fa-facebook-f" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-instagram" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fab fa-linkedin-in" aria-hidden="true"></i></a></li>
                    </ul>
                </div>
            </div>

        </section>
    </div>

    <!-- Meet Our Team End-->
  <!-- ******************************************************************************************* -->

    <!-- ******************************************************************************************* -->
    <!-- Testimonials Start-->

    <div class="wrapper row3 coloured">
        <section class="hoc container clear s-testimonials" > 
            <div class="sectiontitle center">
                <h3 class="heading">Testimonials</h3>
                <p> What internationla Student are saying</p>
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

    <!-- Meet Our Team End-->
  <!-- ******************************************************************************************* -->

  <!-- ******************************************************************************************* -->
      <!-- Upcomming Evnets Start-->


    <div class="wrapper row3 ">
        <div class="hoc container clear"> 
            <div class="group">
                <section class="one_half first">
                    <h6 class="heading btmspace-50">Up Coming Event & Webinars</h6>
                    <ul class="nospace">
                        <li class="btmspace-30">
                            <article>
                            <h4 class="nospace"><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit.</a></h4>
                            <time  datetime="2021-07-07">7<sup>th</sup>Jul 2021</time>
                            </article>
                        </li>
                        <li class="btmspace-30">
                            <article>
                            <h4 class="nospace"><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit.</a></h4>
                            <time  datetime="2021-07-07">7<sup>th</sup>Jul 2021</time>
                            </article>
                        </li>
                        <li class="btmspace-30">
                            <article>
                            <h4 class="nospace"><a href="#">Lorem ipsum dolor sit amet consectetur adipisicing elit.</a></h4>
                            <time  datetime="2021-07-07">7<sup>th</sup>Jul 2021</time>
                            </article>
                        </li>
                    </ul>
                </section>
                <section class="one_half">
                    <h6 class="heading btmspace-50">Explore Our Community </h6>
                    <ul class="nospace">
                        <li class="btmspace-30">
                            <article>
                                <h4 class="nospace"><a href="#">Europian Studnet Zone</a></h4>
                            </article>
                        </li>                        <li class="btmspace-30">
                            <article>
                                <h4 class="nospace"><a href="#">American Student  Zone</a></h4>
                            </article>
                        </li>
                        <li class="btmspace-30">
                            <article>
                            <h4 class="nospace"><a href="#">Asian Studnet Zone</a></h4>
                            </article>
                        </li>
                        <li class="btmspace-30">
                            <article>
                            <h4 class="nospace"><a href="#">African Studnet Zone</a></h4>
                            </article>
                        </li>
                        <li class="btmspace-30">
                            <article>
                                <h4 class="nospace"><a href="#">Discover Dublin </a></h4>
                            </article>
                        </li>
                    </ul>
                </section>
            </div>
        </div>
    </div>
       
    <!-- Upcomming Evnets End-->
<!-- ******************************************************************************************* -->

	<%@ include file="footer.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->
    <script src="/script/jquery-3.6.0.js" type="text/javascript"></script>
    <script src="/script/main.js" type="text/javascript"></script>


    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>