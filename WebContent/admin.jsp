<%@page import="db.*"%>
<%@page import="utils.Utils"%>
<% 
User u = Utils.getUser(request);
if(u == null || u.getRole() != Role.ADMIN) {
	response.sendRedirect("./index.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>
<!doctype HTML>
<html>
	<head>
		<title>InterBlog - Admin</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
		<meta name='viewport' content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    	<link rel='stylesheet' type='text/css' media='screen' href='css/landingpage.css'>
    	<link rel="stylesheet" type="text/css" media='screen' href="css/menubar.css">
    	<link rel='stylesheet' type='text/css' media='screen' href='css/flex-slider.css'>
    	<link rel='stylesheet' type='text/css' media='screen' href='css/owl.css'>
    	<link rel='stylesheet' type='text/css' media='screen' href='css/fontawesome.css'>
    	<link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    	<script src="https://kit.fontawesome.com/60b74c23d5.js" crossorigin="anonymous"></script>
    	<script src="js/packages/jquery-3.6.0.min.js" type="text/javascript"></script>
	</head>
	
	<body>
	
	<%@ include file="menubar.jsp" %>
	
	<div class="wrapper">
		<div class = categories>
			
		
		</div>
	
	</div>
	
	
	
	<%@ include file="footer.jsp" %>
	
	</body>
</html>