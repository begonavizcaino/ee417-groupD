<%@page import="db.AttachedContent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
User u = Utils.getUser(request);
if(u == null) {
	response.sendRedirect("signup.jsp");
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
						<p class="bio"><%= u.getBio() == null || u.getBio().equals("") ? "This user has no Bio" : u.getBio() %></p>
					</div>
					<div class="profile-btn">
						<button class="createbtn" onclick="location.href='createpost.jsp'" type="button" >
							<i class="fa fa-plus"></i>Create post
						</button>
					</div>

				</div>
			</div>
			<div class="right-side">
				<div class="nav">
					<ul>
						<li onclick="tabs(0)" class="user-post active">Posts</li>
						<li onclick="tabs(1)" class="user-setting">Settings</li>
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
								            <img src="<%= ac.get(0).getContent()%>" alt="">
							        	</div>
									<% } %>
							        <div class="down-content">
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
							            <span class ="line"></span>
							        </div>
							    </div>
							</div>
						<% } %>
					</div>
					<div class="profile-setting tab">
						<h1>Account Settings</h1>
						<div class="form">
						<form action="UpdateProfile" method="post" enctype="multipart/form-data">
  							<label for="username">First name:</label><br>
  							<input type="text" id="username" name="firstname" placeholder="First Name" value="<%= u.getFirstName() %>"><br>
  							<label for="username2">Last name:</label><br>
  							<input type="text" id="username2" name="lastname" placeholder="Last Name" value="<%= u.getLastName() %>"><br>
  							<label for="password">Password:</label><br>
  							<input type="password" id="password" name="password" placeholder="Password" value="<%= u.getPassword() %>"><br>
  							<label for="confirm">Confirm password:</label><br>
  							<input type="password" id="confirm" name="confirm" placeholder="Confirm password" value="<%= u.getPassword() %>"><br>
  							<label for="lname">Date of birth:</label><br>
  							<input type="date" id="date" name="birth" value="<%= u.getBirth() %>"><br>
  							<label for="bio">Bio:</label><br>
  							<textarea name="bio"><%= u.getBio() %></textarea><br>
  							<label for="fileToUpload">Profile image</label>
  							<input type="file" name="picture" id="fileToUpload"><br>
	                        <% if(request.getAttribute("error") != null) { %>
	                        	<p class="error"><%= request.getAttribute("error") %></p>
	                        <% } %>
  							
  							
  							<input type="submit" value="Submit">
						</form> 
						</div>
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