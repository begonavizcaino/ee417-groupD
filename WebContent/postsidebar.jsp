
<%@page import="db.Database"%>
<%@page import="db.Post"%>
<div class="one_third ">
    <div class="col-lg-4">
        <div class="sidebar">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sidebar-item search">
                        <!-- <form id="search_form" name="gs" method="GET" action="#"> -->
                        <input id="search_by_title" type="text" name="q" class="searchText" placeholder="Type title to search..." autocomplete="on">
                        <!-- </form> -->
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="sidebar-item recent-posts">
                        <div class="sidebar-heading">
                            <h2>Recent Posts</h2>
                        </div>
                        <div class="content">
                            <ul class="siderbar-content-ul">
                            	<% for(Post p : Database.postDao.findPosts(-1, Integer.MAX_VALUE, 3)) { %>
                            		<li><a href="post.jsp?postid=<%= p.getId() %>">
                                    <h5><%= p.getTitle() %></h5>
                                    <span><%= p.getDate() %></span>
                                </a></li>
                            	<% } %>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="sidebar-item categories">
                        <div class="sidebar-heading">
                            <h2>Categories</h2>
                        </div>
                        <div class="content">
                            <ul>
                            	<% for(Post p : Database.postDao.findCategories()) { 
                            		out.println("<li class=\"categories-li\"><a href=main.jsp?category=" + p.getId() + ">- " + p.getTitle() + "</a></li>");
                            	} %>
                            </ul>
                        </div>
                    </div>
                </div>
                <br>
                <div class="col-lg-12">
                	<div class="sidebar-item create-new-post">
                        <div class="content">
                		<button class="createbtn" onclick="location.href='createpost.jsp'" type="button" >
							<i class="fa fa-plus"></i>      Create new post
						</button>
						</div>
                	</div>
                </div>
            </div>
        </div>
    </div>
</div>