<%@page import="utils.Utils"%>
<%
if(Utils.isUserConnected(request)) {
	response.sendRedirect("./index.jsp");
	return;
}
boolean mode = "signup".equals(request.getAttribute("mode")) || "signup".equals(request.getParameter("mode"));// attribute for servlets forwarding, param for href forwarding
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>ISB SignUp</title>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/signup.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/menubar.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
    <script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
</head>
<body >

	<%@ include file="menubar.jsp" %>

<!-- ******************************************************************************************* -->
    <!-- About Us Start-->

    <div class="wrapper ">
        <section class="hoc"> 
            <div class="container<%= mode ? " right-panel-active" : "" %>" id="container">
                <div class="form-container sign-up-container ">
                    <form id="form" class="form" action="Signup" method="post">
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
                            <input id="username" name="firstname" type="text" placeholder="First Name" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- SecondName -->
                        <div class="form-control" >
                            <input id="username2" name="lastname" type="text" placeholder="Last Name" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Email ID -->
                        <div class="form-control" >
                            <input id="email" type="email" name="email" placeholder="Email" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Password -->
                        <div class="form-control">
                            <input id="password" type="password" name="password" placeholder="Password" value="" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Re-type Password -->
                        <div class="form-control">
                            <input id="password2" type="password" name="confirm" placeholder="Confirm Password" />
                            <i class="fas fa-check-circle"></i>
                            <i class="fas fa-exclamation-circle"></i>
                            <small>Error Message</small>
                        </div>
                        <!-- Date of Birth input -->
                        <input type="date" placeholder="Date of Birth" name="birth"/>
                        
                        <!-- Country Input-->
                        <div class="form-control">
	                        <select name="nationality" id="nationality">
	                            <option value="_">Nationality</option>
	                            <option value="Europe">Europe</option>
	                            <option value="NorthAmerica">North America</option>
	                            <option value="LatinAmerica">Latin America</option>
	                            <option value="Asia">Asia</option>
	                            <option value="Africa">Africa</option>
	                            <option value="MiddleEast">Middle East</option>
	                        </select>
                            <small>Error Message</small>
                        </div>
                        
                        <!-- Country Input-->
                        <div class="form-control">
	                        <select name="studying_region" id="studying_region">
	                            <option value="_">Studying region</option>
	                            <option value="Europe">Europe</option>
	                            <option value="NorthAmerica">North America</option>
	                            <option value="LatinAmerica">Latin America</option>
	                            <option value="Asia">Asia</option>
	                            <option value="Africa">Africa</option>
	                            <option value="MiddleEast">Middle East</option>
	                        </select>
                            <small>Error Message</small>
                        </div>
                        
                        <% if(mode && request.getAttribute("error") != null) { %>
                        	<p class="error"><%= request.getAttribute("error") %></p>
                        <% } %>
                        	
                        <!-- Submit Button -->
                        <button type="submit" value="submit">Sign Up</button>
                    </form>
                </div>
                <!-- Sign In - Sign Up  Menu-->
                <div class="form-container sign-in-container">
                    <form action="Login" method="post">
                        <h1>Sign in</h1>
                        <div class="social-container">
                            <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                            <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                        <span>or use your account</span>
                        <!-- User/E-mail  -->
                        <input type="text" placeholder="Email" name="username"/>
                        <!-- User Password  -->
                        <input type="password" placeholder="Password" name="password"/>
                        <% if(!mode && request.getAttribute("error") != null) { %>
                        	<p class="error"><%= request.getAttribute("error") %></p>
                        <% } %>
                        
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
    <script src="js/sign/signUp.js" type="text/javascript"></script>

    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

    
</body>
</html>