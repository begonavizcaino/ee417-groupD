package servlets;



import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Database;
import db.Post;
import db.User;
import utils.Utils;

@WebServlet("/Comment")
public class Comment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("post.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int postId = Integer.parseInt(request.getParameter("postid"));
			String message = request.getParameter("message");
			User u = Utils.getUser(request);
			Post post = Database.postDao.findOneById(postId);
			Post postParent = post != null ? post.getParentPost() : null;
			if(post != null && postParent != null && message != null) {
				Post comment = new Post(u.getId(), post.getId(), "", message);
				Database.postDao.insert(comment);
			}
		} catch(NumberFormatException e) {
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
