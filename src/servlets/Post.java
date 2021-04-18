package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.mysql.cj.xdevapi.JsonArray;
import com.mysql.cj.xdevapi.JsonString;

import db.AttachedContent;
import db.AttachedContentDao;
import db.Database;
import db.User;
import utils.Utils;

/**
 * Servlet implementation class Post
 */
@WebServlet("/Post")
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!Utils.isUserConnected(request)) {
			response.sendRedirect("main.jsp");
		}
		int category = request.getParameter("category") != null ? Integer.parseInt(request.getParameter("category")) : -1;
		int lastId = request.getParameter("last_id") != null ? Integer.parseInt(request.getParameter("last_id")) : Integer.MAX_VALUE;
		int count = request.getParameter("count") != null ? Integer.parseInt(request.getParameter("count")) : 3;
		
		response.setContentType("application/json");
		JSONObject json = new JSONObject();
		try {
			ArrayList<db.Post> posts = Database.postDao.findPosts(category, lastId, count);
			JSONArray arr = new JSONArray();
			for (db.Post p : posts) {
				JSONObject post = new JSONObject();
				post.put("title", p.getTitle());
				post.put("date", p.getDate());
				post.put("message", p.getMessage());
				post.put("id", p.getId());
				post.put("category", p.getParentId());
				post.put("comments", p.getComments().size());
				
				JSONArray attachedContent = new JSONArray();
				for (AttachedContent content : p.getAttachedContent()) {
					attachedContent.put(content.getContent());
				}
				post.put("attachedContent", attachedContent);
				
				User u = p.getUser();
				JSONObject user = new JSONObject();
				user.put("name", u.getFirstName() + " " + u.getLastName());
				user.put("id", u.getId());
				user.put("picture", u.getPicture());
				post.put("user", user);
				
				arr.put(post);
			}
			json.put("posts", arr);
			json.put("lastId", posts.size() > 0 ? posts.get(posts.size() - 1).getId() : -1);
		} catch (SQLException e) {
			json.put("error", "An error occured while accessing the database");
		}
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
