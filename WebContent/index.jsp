<%@page import="db.Role"%>
<%@page import="db.User"%>
<%@page import="utils.Utils"%>
<% 
User u = Utils.getUser(request);
if(u == null) {
	response.sendRedirect("./login.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>
<!doctype HTML>
<html>
	<head>
		<title>InterBlog</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
	</head>
	<body>
		<p>Welcome <%= u.getUsername() %></p>
		<a href="./Disconnect">Disconnect</a>
		<% if(u.getRole() == Role.ADMIN) { %>
			<a href="./admin.jsp">Admin page</a>
		<% } %>
	</body>
</html>