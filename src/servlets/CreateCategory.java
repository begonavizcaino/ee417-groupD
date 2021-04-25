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
import db.Role;
import db.User;
import utils.Utils;

/**
 * Servlet implementation class CreateCategory
 */
@WebServlet("/CreateCategory")
public class CreateCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		User u = Utils.getUser(request);
		if(u == null || u.getRole() != Role.ADMIN) {
			response.sendRedirect("./index.jsp");
			return;
		}
		db.Post p = new Post(u.getId(), -1, name, "");
		try {
			Database.postDao.insert(p);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("./admin.jsp");
	}

}
