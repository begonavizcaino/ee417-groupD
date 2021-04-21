
<%@page import="db.Database"%>
<%@page import="db.Post"%>
<div class="one_third ">
    <div class="col-lg-4">
        <div class="sidebar">
            <div class="row">
                <div class="col-lg-12">
                    <div class="sidebar-item search">
                        <!-- <form id="search_form" name="gs" method="GET" action="#"> -->
                        <input id="search_by_title" type="text" name="q" class="searchText" placeholder="type title to search..." autocomplete="on">
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
                                    <span>April 18, 2021</span>
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
                            		out.println("<li><a href=main.jsp?category=" + p.getId() + ">- " + p.getTitle() + "</a></li>");
                            	} %>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>