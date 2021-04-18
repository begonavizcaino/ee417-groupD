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
            <li><i class="fa fa-envelope-o"></i> info@internationalblog.com</li>
            </ul>
        </div>
        <div class="fl_right">
            <ul>
            <li><a href="index.jsp"><i class="fa fa-lg fa-home"></i></a></li>
            <% if(menubaru == null) { %>
	            <li><a href="signup.jsp">Login</a></li>
	            <li><a href="signup.jsp?mode=signup">Sign-Up</a></li>
            <% } else { %>
            	<li><a href="profile.jsp">Profile</a></li>
            	<li><a href="Disconnect">Disconnect</a></li>
            <% } %>
            <li id="searchform">
                <div>
                <form action="#" method="post">
                    <fieldset>
                    <legend>Quick Search:</legend>
                    <input type="text" placeholder="Enter search term&hellip;">
                    <button type="submit"><i class="fas fa-search"></i></button>
                    </fieldset>
                </form>
                </div>
            </li>
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
		                <li><a class="drop" href="main.jsp">Blogs</a>
		                    <ul>
		                    <% for(Post c : categories) { %>
		                    	<li><a href="posts.jsp?category=<%= c.getId() %>"><%= c.getTitle() %></a></li>
                			<% } %>
		                    </ul>
		                </li>
		                <li><a href="main.jsp">Posts</a></li>
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
    <!-- Java Script Start--
    <script src="script/jquery-3.6.0.js" type="text/javascript"></script>
    <script src="script/main.js" type="text/javascript"></script>

    <script src="script/custom.js"></script>
    <script src="script/owl.js"></script>
    <script src="script/slick.js"></script>
    <script src="script/isotope.js"></script>
    <script src="script/accordions.js"></script>

    <!-- Java Script End -->
<!-- ******************************************************************************************* -->

