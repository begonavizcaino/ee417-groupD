<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB SignUp</title>
    <script src="script/jquery-3.5.1.js" type="text/javascript"></script>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/signup.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/menubar.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <script src='script/main.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
</head>
<body >

	<%@ include file="offconnectionmenubar.jsp" %>

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

   <%@ include file="footer.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->
    <script src="script/jquery-3.6.0.js" type="text/javascript"></script>
    <script src="script/main.js" type="text/javascript"></script>


    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>