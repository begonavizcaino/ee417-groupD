<%@page import="db.*"%>
<%@page import="utils.Utils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<% 
User u = Utils.getUser(request);
if(u == null || u.getRole() != Role.ADMIN) {
	response.sendRedirect("./index.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
//ArrayList<Post> categories = Database.postDao.findCategories();// categories loaded by the menubar
ArrayList<Post> posts = Database.postDao.findPosts(-1, Integer.MAX_VALUE, 999);
%>
<!DOCTYPE html>
<html>
<head>
<title>Admin dashboard</title>
<meta charset="UTF-8">
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!--  link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
<link rel='stylesheet' type='text/css' media='screen' href='css/main.css'>
<link rel="stylesheet" type="text/css" media='screen' href="css/menubar.css">
<link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
<link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
<link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
<link rel='stylesheet' type='text/css' media='screen' href='css/admin.css'>
<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
<script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
<script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</head>
<body>

<body class="w3-light-grey">

<%@ include file="menubar.jsp" %>

<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-top: 5px">

  <!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h5><b> Admin Dashboard</b></h5>
  </header>

  <div class="w3-row-padding w3-margin-bottom">
    <div class="w3-quarter">
      <div class="w3-container w3-grey w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-comment w3-xxlarge"></i></div>
        <div class="w3-right">
          <h3><%= categories.size() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Categories</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-brown w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-eye w3-xxlarge"></i></div>
        <div class="w3-right">
          <h3>99</h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Visits</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-grey w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-laptop w3-xxlarge"></i></div>
        <div class="w3-right">
          <h3><%= posts.size() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Posts</h4>
      </div>
    </div>
    <div class="w3-quarter">
      <div class="w3-container w3-brown w3-text-white w3-padding-16">
        <div class="w3-left"><i class="fa fa-users w3-xxlarge"></i></div>
        <div class="w3-right">
          <h3><%= Database.userDao.findAll().size() %></h3>
        </div>
        <div class="w3-clear"></div>
        <h4>Users</h4>
      </div>
    </div>
  </div>
  
   	<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
			url="<%= Database.jdbcUrl %>"
			user="<%= Database.user %>" password="<%= Database.pass %>" />

  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third">
        <h5>Regions</h5>
        <img src="w3images/region.jpg" style="width:100%" alt="Google Regional Map">
      </div>
      <div class="w3-twothird">
        <h5>Last posts</h5>
        <table class="w3-table w3-striped w3-white">
        	<% for(Post p : posts) { %>
       			<tr>
		            <td><i class="fa fa-laptop w3-text-dark-grey w3-large"></i></td>
		            <td><%= p.getTitle() %></td>
		            <td><%= p.getDate() %></td>
		            <td><%= p.getUser().getName() %></td>
      			</tr>
        	<% } %>
        </table>
      </div>
    </div>
  </div>
  <hr>

  <div class="w3-container">
    <h5>Countries</h5>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
		<sql:query dataSource="${snapshot}" var="result">
				SELECT nationality, concat(left(100 * count(*) / (select count(*) from users), 2), "%") as count FROM users GROUP BY nationality</sql:query>
				
		<c:forEach var="row" items="${result.rows}">
			<tr>
				<td><c:out value="${row.nationality}" /></td>
				<td><c:out value="${row.count}" /></td>
			</tr>
		</c:forEach>
    </table><br>
    <button class="w3-button w3-dark-grey">More Countries  <i class="fa fa-arrow-right"></i></button>
  </div>
 
  <hr>
  <div class="w3-container">
    <h5>Recent Users</h5>
    <ul class="w3-ul w3-card-4 w3-white">
		<sql:query dataSource="${snapshot}" var="result">
				select u.username, concat(u.firstname, " ", u.lastname) as name, u.picture, p.date from posts p
				inner join users u on p.user_id = u.id
				order by date desc limit 3;</sql:query>
		<c:forEach var="row" items="${result.rows}">
			<li class="w3-padding-16">
		        <img src="${row.picture}" class="w3-left w3-circle w3-margin-right" style="width:35px">
		        <span class="w3-xlarge">${row.name}<small> - ${row.username}</small></span><br>
		      </li>
		</c:forEach>
    </ul>
  </div>
  <hr>

  <!-- <div class="w3-container">
    <h5>Recent Comments</h5>
    <div class="w3-row">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="/w3images/avatar3.png" style="width:96px;height:96px">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>John <span class="w3-opacity w3-medium">Sep 29, 2014, 9:12 PM</span></h4>
        <p>Keep up the GREAT work! I am cheering for you!! Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div>

    <div class="w3-row">
      <div class="w3-col m2 text-center">
        <img class="w3-circle" src="/w3images/avatar1.png" style="width:96px;height:96px">
      </div>
      <div class="w3-col m10 w3-container">
        <h4>Bo <span class="w3-opacity w3-medium">Sep 28, 2014, 10:15 PM</span></h4>
        <p>Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><br>
      </div>
    </div>
  </div>
  <br> -->
  
  <div class="w3-panel">
    <div class="w3-row-padding" style="margin:0 -16px">
      <div class="w3-third">
	    <h5>Categories</h5>
	    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
	      <tr>
	    	<th><b>Category</b></th>
	    	<th><b>Number of posts</b></th>
	  	  </tr>
		    <% for(Post c : categories) { %>
           		<tr>
			        <td><%= c.getTitle() %></td>
			        <td><%= c.getComments().size() %></td>
      			</tr>
	    	<% } %>
	    </table><br>
	    <button class="w3-button w3-dark-grey">Add new category</i></button>
	  </div>
  	<div class="w3-third">
	  		<canvas id="myCanvas" style="background: white;"></canvas>
  	</div>
  	<div class=w3-third">
  		 <legend for="myCanvas"></legend>
  	</div>
  </div>
  <br>

  <!-- End page content -->

</div>

<script type="text/javascript" src='js/admin/admin.js'> </script>
<%@ include file="footer.jsp" %>


</body>
</html>