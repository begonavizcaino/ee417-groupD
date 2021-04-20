package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

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
@MultipartConfig
public class Post extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!Utils.isUserConnected(request)) {
			response.sendRedirect("main.jsp");
			return;
		}
		int category = !request.getParameter("category").equals("") ? Integer.parseInt(request.getParameter("category")) : -1;
		int lastId = !request.getParameter("last_id").equals("") ? Integer.parseInt(request.getParameter("last_id")) : Integer.MAX_VALUE;
		int count = !request.getParameter("count").equals("") ? Integer.parseInt(request.getParameter("count")) : 3;
		
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
				
				JSONObject c = new JSONObject();
				c.put("id", p.getParentId());
				c.put("title", p.getParentPost().getTitle());
				
				post.put("category", c);
				
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
		User u = Utils.getUser(request);
		if(u == null) {
			response.sendRedirect("main.jsp");
			return;
		}
		int category = request.getParameter("category") != null ? Integer.parseInt(request.getParameter("category")) : -1;
		String title = request.getParameter("title");
		String message = request.getParameter("message");
		if(category != -1 && title != null && message != null) {
			db.Post p = new db.Post(u.getId(), category, title, message);
			try {
				Database.postDao.insert(p);
				Collection<Part> parts = request.getParts();
				for (Part part : parts) {
					if(part.getName().equals("picture") && (part.getContentType().equals("image/png") || part.getContentType().equals("image/jpeg"))) {
						InputStream in = part.getInputStream();
						ByteArrayOutputStream outByte = new ByteArrayOutputStream();
						byte[] buffer = new byte[1024];
				        int length = 0;
				        while ((length = in.read(buffer, 0, 1024)) != -1) {
				            outByte.write(buffer,0,length);
				        }
				        String encodedImage = Base64.getEncoder().encodeToString(outByte.toByteArray());
//						byte[] bytes = new byte[10240];
//						part.getInputStream().read(bytes);
//						String encodedImage = Base64.getEncoder().encodeToString(bytes);
						AttachedContent a = new AttachedContent(p.getId(), encodedImage);
						Database.attachedContentDao.insert(a);
					}
				}
			} catch (SQLException e) {
				System.out.println("error");
				e.printStackTrace();
				request.setAttribute("error", "An error occured while accessing the database");
				request.getRequestDispatcher("create_post.jsp").forward(request, response);
				return;
			}
		}
		response.sendRedirect("main.jsp");
		
	}

}
