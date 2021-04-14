<!DOCTYPE html>
<html>
<head>
	<meta charset="uts-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" >
	<link rel="stylesheet" type="text/css" href="css/contact.css">
	<script src="script/jquery-3.5.1.js" type="text/javascript"></script>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <script src='script/main.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
	<title>CONTACT US</title>
</head>
<body>

	<%@ include file="menubar.jsp" %>
	
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
							<span>INFO@INTERNATIONALBLOG.COM</span>
						</li>
						<li>
							<span><img src="images/call.png"></span>
							<span>+000 (00) 000 0000</span>
						</li>
					</ul>
				</div>
				<ul class="sci">
					<li><a href="#"><img src="images/1.png"></a></li>
					<li><a href="#"><img src="images/2.png"></a></li>
					<li><a href="#"><img src="images/3.png"></a></li>
					<li><a href="#"><img src="images/5.png"></a></li>
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