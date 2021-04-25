<%@page import="db.Database"%>
<%@page import="db.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.Role"%>
<%@page import="db.User"%>
<%@page import="utils.Utils"%>
<% 
User menubaru = Utils.getUser(request);// get the user
ArrayList<Post> categories = Database.postDao.findCategories();
%>
<!-- Top Header Start -->

<div class="wrapper row0">
    <div id="topbar" class="hoc clear"> 
        <div class="fl_left">
            <ul>
            <li><i class="fa fa-phone"></i> +000 (00) 000 0000</li>
            <li><i class="fa fa-envelope-o"></i> interblog417@gmail.com</li>
            </ul>
        </div>
        <div class="fl_right">
            <ul>
            <li><a href="index.jsp"><i class="fa fa-lg fa-home"></i></a></li>
            <% if(menubaru == null) { %>
	            <li><a href="signup.jsp?mode=login">Login</a></li>
	            <li><a href="signup.jsp?mode=signup">Sign-Up</a></li>
            <% } else { %>
            	<li><a href="userprofile.jsp">Profile</a></li>
            	<li><a href="Disconnect">Disconnect</a></li>
            <% } %>
            </ul>
        </div>
    </div>
</div>

<!-- Top Header End -->
<!-- ******************************************************************************************* -->


    <!-- Navigation/Logo bar Start -->
	<div class="bgded overlay"> 
	    <div class="wrapper row1">
	        <header id="header" class="hoc clear"> 
	
	            <div id="logo" class="fl_left">
	                <h1><a href="index.jsp">International Blog</a></h1>
	            </div>
	            <!-- Main Navigation Menu with limited view to Home, About Us & Contact use -->
	            <nav id="mainav" class="fl_right">
	                <ul class="clear">
	                <li class="active"><a href="index.jsp">Home</a></li>
	                <% if(menubaru != null) { %>
		                <li><a class="drop" href="main.jsp">Posts</a>
		                    <ul>
		                    <% for(Post c : categories) { %>
		                    	<li><a href="main.jsp?category=<%= c.getId() %>"><%= c.getTitle() %></a></li>
                			<% } %>
		                    </ul>
		                </li>
		                <!-- <li><a href="main.jsp">Posts</a></li> -->
		                <li><a href="chat.jsp">Chat</a></li>
	                <%
	                } 
	                if (menubaru != null && menubaru.getRole() == Role.ADMIN) {
	                %>
	                	<li><a href="admin.jsp">Admin</a></li>
                	<% } %>
	                <li><a href="aboutus.jsp">About Us</a></li>
	                <li><a href="ourteam.jsp">Our Team</a></li>
	                <li><a href="contactus.jsp">Contact Us</a></li>
	                </ul>
	            </nav>
	        </header>
	    </div>
    </div>
    
    

<!-- ******************************************************************************************* -->
    <!-- Java Script Start-->
    <script src="js/packages/owl.js"></script>
    <script src="js/packages/isotope.js"></script>
    <script src="js/packages/accordions.js"></script>
    <script src="js/menubar/custom.js"></script>
    <script src="js/menubar/menubar.js"></script>

    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

