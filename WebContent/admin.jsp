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
	</head>
	<body>
	
	</body>
</html>