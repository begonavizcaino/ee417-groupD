<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB SignUp</title>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/signup.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
</head>
<body >

	<%@ include file="menubar.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- About Us Start-->

    <div class="wrapper ">
        <section class="hoc"> 
            <div class="container" id="container" >
                <div class="form-container sign-up-container ">
                    <form id="form" class="form">
                        <h1>Create Account</h1>
                        <!-- Social Medeia Container -->
                        <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                        <span>or use your email for registration</span>
                        <!-- first Name -->
                        <div class="form-control" >
                            <input id="username" type="text" placeholder="Name" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- SecondName -->
                        <div class="form-control" >
                            <input id="username2" type="text" placeholder="Last Name" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Email ID -->
                        <div class="form-control" >
                            <input id="email" type="email" placeholder="Email" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Password -->
                        <div class="form-control">
                            <input id="password" type="password" placeholder="Password" value="" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Re-type Password -->
                        <div class="form-control">
                            <input id="password2" type="password" placeholder="Password2" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Date of Birth input -->
                        <input type="date" placeholder="Date of Birth" name="dob"/>
                        <!-- Country Input-->
                        <select name="country" >
                            <option value="">Country/Region</option>
                            <option value="">Europe</option>
                            <option value="">North America</option>
                            <option value="">Latin America</option>
                            <option value="">Asia</option>
                            <option value="">Africa</option>
                            <option value="">Middle East</option>
                            <option value="">Ireland</option>
                        </select>
                        <!-- Gender - Optional -->
                        <select name="gender" >
                            <option value="">Choose Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Others</option>
                        </select>
                        <!-- Check Box - T&C -->
                        <p><span><input type="checkbox"></span>I agree to the terms of services</p>			
                        <!-- Submit Button -->
                        <button type="submit" value="submit">Sign Up</button>
                    </form>
                </div>
                <!-- Sign In - Sign Up  Menu-->
                <div class="form-container sign-in-container">
                    <form action="#">
                        <h1>Sign in</h1>
                        <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                        <span>or use your account</span>
                        <!-- User/E-mail  -->
                        <input type="email" placeholder="Email" />
                        <!-- User Password  -->
                        <input type="password" placeholder="Password" />
                        <!-- forgot Password link -->
                        <a href="#">Forgot your password?</a>
                        <!-- Sign In Submit Button -->
                        <button>Sign In</button>
                    </form>
                </div>
                <!-- Sign In - Sign Up  Styling & overlay switching -->
                <div class="overlay-container">
                    <div class="overlay">
                        <div class="overlay-panel overlay-left">
                            <h1>Welcome Back!</h1>
                            <p>Please login with your personal info</p>
                            <button class="ghost" id="signIn">Sign In</button>
                        </div>
                        <div class="overlay-panel overlay-right">
                            <h1>Hello!</h1>
                            <p>Enter your personal details here</p>
                            <button class="ghost" id="signUp">Sign Up</button>
                        </div>
                    </div>
                </div>
            </div>
    
        </section>
    </div>



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
              <li><a href="../index.html">Home</a></li>
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


<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->
    <script src="script/jquery-3.6.0.js" type="text/javascript"></script>
    <script src="script/main.js" type="text/javascript"></script>


    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>