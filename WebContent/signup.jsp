<%@page import="utils.Utils"%>
<% 
if(Utils.isUserConnected(request)) {
	response.sendRedirect("./index.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>
<!doctype HTML>
<html>
	<head>
		<title>InterBlog - Signup</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/common.css">
	</head>
	<body>
		<form action="./Signup" method="post">
			<% if(request.getAttribute("error") != null) { %>
			<div class="error"><%=request.getAttribute("error") %></div>
			<% } %>
			<label for="username">Username:</label>
			<input type="text" id="username" name="username"/>
			<label for="password">Password:</label>
			<input type="password" id="password" name="password"/>
			<label for="confirm">Confirm:</label>
			<input type="password" id="confirm" name="confirm"/>
			<input type="submit" />
		</form>
		<a href="./login.jsp">Login</a>
	</body>
</html>