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
import db.Conversation;

/**
 * Servlet implementation class CreateConversation
 */
@WebServlet("/CreateConversation")
public class CreateConversation extends HttpServlet {
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
		db.Conversation c = new Conversation(u.getId(),name,"");
		try {
			Database.conversationDao.insert(c);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("./admin.jsp");
	}

}
