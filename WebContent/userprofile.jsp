<%@page import="db.AttachedContent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User u = Utils.getUser(request);
if(u == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv='X-UA-Compatible' content='IE=edge'>
	<title>User profile</title>
	<meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
	<link rel="stylesheet" type="text/css" media = 'screen' href="css/menubar.css">
	<link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
	<script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
    <link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    <link rel="stylesheet" type="text/css" href="css/userprofile.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
    

</head>
<body>

<%@ include file="menubar.jsp" %> 
    

<div class="container">
		<div class="profile-header">
			<div class="profile-img">
				<img src="<%= (u.getPicture() != null && !u.getPicture().equals("")) ? u.getPicture() : "images/dp.jpg" %>" width="200" alt="">
			</div>
			<div class="profile-nav-info">
				<h3 class="user-name"><%= u.getName() %></h3>
				<div class="address">
					<!-- <p class="city">Dublin,</p> -->
					<span class="country"><%= u.getNationality() %></span>
				</div>
			</div>
		</div>
		<div class="main-bd">
			<div class="left-side">
				<div class="profile-side">
					<p class="user-mail"><i class="fa fa-envelope-o"> <%= u.getUsername() %></i></p>
					<div class="user-details"><strong><%= u.getStudyIn() %></strong></div>
					<div class="user-bio">
						<h3>Bio</h3>
						<p class="bio">Lorem ipsum dolor sit amet consectetur, adipisicing elit. Cum, quo dolore harum dolorum amet error quae provident dolor. Accusantium ducimus sapiente iure est corporis magni consequuntur deleniti corrupti quos maiores.</p>
					</div>
					<div class="profile-btn">
						<button class="createbtn" onclick="location.href='createpost.jsp'" type="button" >
							<i class="fa fa-plus"></i>Create post
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
						<li onclick="tabs(0)" class="user-post active">Posts</li>
						<li onclick="tabs(1)" class="user-review">Reviews</li>
						<li onclick="tabs(2)" class="user-setting">Settings</li>
					</ul>
				</div>
				<div class="profile-body">
					<div class="profile-posts tab">
						<h1>Your Posts</h1>
						<% for(Post p : u.getPosts()) { 
							ArrayList<AttachedContent> ac = p.getAttachedContent();
						%>
							<div class="col-lg-12">
							    <div class="blog-post">
							    	<% if(ac.size() > 0) { %>
								        <div class="blog-thumb">
								            <img src="<%= ac.get(0).getContent()  %>" alt="">
							        	</div>
									<% } %>
							        <div class="down-content">
							            <span>Academic</span>
							            <a href="post.jsp?postid=<%= p.getId() %>"><h4><%= p.getTitle() %></h4></a>
							            <ul class="post-info">
							                <li><a href=""><%= u.getName() %></a></li>
							                <li><a href=""><%= p.getDate() %></a></li>
							                <li><a href="post.jsp?postid=<%= p.getId() %>"><%= p.getComments().size() %> Comments</a></li>
							            </ul>
							            <p><%= p.getMessage() %>
							            </p>
							            <div class="post-options">
							                <div class="row">
							                    <div class="col-6">
							                        <ul class="post-tags">
							                            <li><i class="fa fa-tags"></i></li>
							                            <li><%= p.getParentPost().getTitle() %></li>
							                        </ul>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</div>
						<% } %>
					</div>
					<div class="profile-review tab">
						<h1>User Reviews</h1>
						<p>Lorem ipsum dolor sit amet, consectetur, adipisicing elit. Accusamus id cupiditate libero eius dolore, inrem nulla reiciendis. Qui, vero voluptatum! Quia iusto accusamus corporis, illo, ullam quibusdam maiores assumenda explicabo illum eligendi odit fugiat a, laborum rerum architecto eum ut distincto. Rrror quos temporibus at ecpedita? Optio amet aliqum provident voluptatum minima quidem nemo harum doloremque. Est nihil quisquam quis deserunt repellat, natus, saepe laborum. Ipsum officils, nisi optio.</p>
					</div>
					<div class="profile-setting tab">
						<h1>Account Settings</h1>
						<form action="/action_page.php">
  							<label for="username">First name:</label><br>
  							<input type="text" id="username" name="firstname" placeholder="First Name"><br>
  							<label for="username2">Last name:</label><br>
  							<input type="text" id="username2" name="lastname" placeholder="Last Name"><br>
  							<label for="email">Email:</label><br>
  							<input type="email" id="email" name="email" placeholder="Email"><br>
  							<label for="password">Password:</label><br>
  							<input type="password" id="password" name="password" placeholder="Password" value=""><br>
  							<label for="lname">Date of birth:</label><br>
  							<input type="date" id="date" name="birth"><br>
  							<label for="bio">Bio:</label><br>
  							<textarea name="bio"></textarea><br>
  							<label for="fileToUpload">Profile image</label>
  							<input type="file" name="fileToUpload" id="fileToUpload"><br>
  							
  							
  							<input type="submit" value="Submit">
						</form> 
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script src='js/profile/profile.js'></script>


<%@ include file="footer.jsp" %>	


</body>
</html>