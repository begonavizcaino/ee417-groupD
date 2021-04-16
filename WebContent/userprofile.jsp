<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Profile</title>
	<meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <script src="script/jquery-3.5.1.js" type="text/javascript"></script>
    <meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="css/userprofile.css">
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link rel="stylesheet" type="text/css" media='screen' href="css/menubar.css">
    <link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
    <script src='/script/main.js'></script>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="menubar.jsp" %>

	<!-- Body Start -->

	<div class="container" style="padding-top: 0px; padding-bottom: 20px;">
		<div class="profile-header">
			<div class="profile-img">
				<img src="images/dp.jpg" width="200" alt="">
			</div>
			<div class="profile-nav-info">
				<h3 class="user-name">XYZ</h3>
				<div class="address">
					<p class="city">Dublin,</p>
					<span class="country">Ireland</span>
				</div>
			</div>
			<div class="profile-option">
				<div class="notifications">
					<i class="fa fa-bell"></i>
					<span class="alert-message">1</span>
				</div>
			</div>
		</div>
		<div class="main-bd">
			<div class="left-side">
				<div class="profile-side">
					<p class="mobile-no"><i class="fa fa-phone">+000 (00) 000 0000</i></p>
					<div class="user-mail"><i class="fa fa-envelope-o">xyz@gmail.com</i></div>
					<div class="user-details">Currently studing in : Ireland</div>
					<div class="user-bio">
						<p class="bio">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Cum, quo dolore harum dolorum amet error quae provident dolor. Accusantium ducimus sapiente iure est corporis magni consequuntur deleniti corrupti quos maiores.</p>
					</div>
					<div class="profile-btn">
						<button class="chatbtn">
							<i class="fa fa-comment"></i>Chat
						</button>
						<button class="createbtn">
							<i class="fa fa-plus"></i>Create
						</button>
					</div>
					<div class="user-rating">
						<h3 class="rating">4.5</h3>
						<div class="rate">
							<div class="stars">
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
							</div>
							<span class="no-user"><span>123</span>&nbsp;
							&nbsp;
							reviews</span>
						</div>
					</div>

				</div>
			</div>
			<div class="right-side">
				<div class="nav">
					<ul>
						<li onclick="tabs(0)" class="user-post active"></li>
						<li onclick="tabs(1)" class="user-review"></li>
						<li onclick="tabs(2)" class="user-setting"></li>
					</ul>
				</div>
				<div class="profile-body">
					<div class="profile-posts tab">
						<h1>Your Posts</h1>
						<p>Lorem ipsum dolor sit amet, consectetur, adipisicing elit. Doleres iure quae sint magni cupiditate non, quod velit similique ducimus! Impedit dicta, sit officiis recum. Adipisci ut facere atque nsotrum odit dolorum ea cumque modi. Asperiores dolorum ,iure odit ad, tempore magnam beatae deleniti doluta quisquam assumenda pariatur incidunt sapiete eaque modi earum. Ab ducimus accusamus recusandae, odio iusto commodi fuga, repellat inventore iure aut libero consequatur sequi nesciunt dolorem ipsam.</p>
					</div>
					<div class="profile-review tab">
						<h1>User Reviews</h1>
						<p>Lorem ipsum dolor sit amet, consectetur, adipisicing elit. Accusamus id cupiditate libero eius dolore, inrem nulla reiciendis. Qui, vero voluptatum! Quia iusto accusamus corporis, illo, ullam quibusdam maiores assumenda explicabo illum eligendi odit fugiat a, laborum rerum architecto eum ut distincto. Rrror quos temporibus at ecpedita? Optio amet aliqum provident voluptatum minima quidem nemo harum doloremque. Est nihil quisquam quis deserunt repellat, natus, saepe laborum. Ipsum officils, nisi optio.</p>
					</div>
					<div class="profile-setting tab">
						<h1>Account Settings</h1>
						<p>Lorem ipsum dolor sit amet, consectetur, adipisicing elit. Optio, eligendi magnam. Fuga ducimus assumenda, nemo sit, quod eveniet quidem dolorum modi voluptas dignissimos tempore omnis saepe officils aliquam. Tempore sed voluptatum, illo sit vitae ullam consequatur, architecto enim iusto asperiores supiditate debitis blanditiis harum quas ad dolor dolores veritatis molestiae! Apreiam, laboriosam! Temporibus modi vero ab quis, qui fuga reiciendis, hic, molestias vel ut recusandae eius nesciunt harum praesentium? Libero. </p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Body End -->
	
	<%@ include file="footer.jsp" %>

	<script src="./jquery/jquery.js"></script>
	<script src="./main.js"></script>
</body>
</html>