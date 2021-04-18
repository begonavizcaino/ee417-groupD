<%@page import="db.Post"%>
<%@page import="db.Database"%>
<%@page import="utils.Utils"%>
<%@page import="db.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
User u = Utils.getUser(request);// get the user
if(u == null) {
	response.sendRedirect("./signup.jsp");
	return;// stop the rest of the html from being sent alongside the redirect (faster + safer)
}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Create post</title>
	</head>
	<body>
		<form action="Post" method="post" enctype="multipart/form-data" multiple>
			<input type="text" placeholder="Title" name="title">
			<textarea placeholder="Message" name="message"></textarea>
			Images : <input type="file" name="picture" accept="image/png, image/jpeg">
			<select name="category">
				<% for(Post category : Database.postDao.findCategories()) { %>
					<option value="<%= category.getId() %>"><%= category.getTitle() %></option>
				<% } %>
			</select>
			<% if(request.getAttribute("error") != null) { 
				out.print(request.getAttribute("error"));
			} %>
			<input type="submit">
		</form>
	</body>
</html>