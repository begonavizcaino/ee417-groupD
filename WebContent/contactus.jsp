<!DOCTYPE html>
<html>
<head>
	<meta charset="uts-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" >
	<meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" type="text/css" href="css/contact.css">
	<link rel="stylesheet" type="text/css" href="css/menubar.css">
    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
	<script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
	<title>ISB Contact Us</title>
</head>
<body>

	<%@ include file="menubar.jsp" %>
	
    <!-- Contact Us -->
	<section>
		<div class="container">
			<div class="contactInfo">
				<div>
					<h2>Contact Info</h2>
					<ul class="info">
						<li>
							<span><img src="images/location.png"></span>
							<span>XYZ SOME ROAD/ST.<br>
								DUBLIN, IRE</span>
						</li>
						<li>
							<span><img src="images/mail.png"></span>
							<span>interblog417@gmail.com</span>
						</li>
						<li>
							<span><img src="images/call.png"></span>
							<span>+000 (00) 000 0000</span>
						</li>
					</ul>
				</div>
				<ul class="sci">
					<li><a href="https://www.facebook.com/interBlog417/"><img src="images/1.png"></a></li>
					<li><a href="https://twitter.com/interna48111070"><img src="images/2.png"></a></li>
					<li><a href="https://www.instagram.com/interblog417/"><img src="images/3.png"></a></li>
					<li><a href="https://www.linkedin.com/in/international-blog"w><img src="images/5.png"></a></li>
				</ul>
			</div>
			<div class="contactForm">
				<h2>Send a Message</h2>
				<div class="formBox">
					<div class="inputBox w50">
						<input type="text" required>
						<span>First Name</span>
					</div>
					<div class="inputBox w50">
						<input type="text" required>
						<span>Last Name</span>						
					</div>
					<div class="inputBox w50">
						<input type="email" required>
						<span>Email</span>
					</div>
					<div class="inputBox w50">
						<input type="text" required>
						<span>Mobile Number</span>
					</div>
					<div class="inputBox w100">
						<textarea required></textarea>
						<span>Write your message here...</span>
					</div>
					<div class="inputBox w100">
						<input type="submit" value="Send">
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="footer.jsp" %>	

</body>
</html>