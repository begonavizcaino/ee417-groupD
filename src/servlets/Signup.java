package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.Database;
import db.Role;
import db.User;
import utils.Utils;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("mode", "signup");
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(Utils.isUserConnected(request)) {
			response.sendRedirect("./index.jsp");
			return;
		}
		String username = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm = request.getParameter("confirm");
		String firstName = request.getParameter("firstname");
		String lastName = request.getParameter("lastname");
		Date birth = Date.valueOf(request.getParameter("birth"));
		String nationality = request.getParameter("nationality");
		String studyIn = request.getParameter("studying_region");
		
		if(username != null && password != null && password.equals(confirm) && password.length() >= 4 && 
				firstName != null && lastName != null && birth != null && nationality != null && studyIn != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("username", username);
			try {
				if(Database.userDao.findOneBy(map) == null) {
					User u = new User(username, password, Role.USER, "", firstName, lastName, nationality, studyIn, birth);
					Database.userDao.insert(u);
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					response.sendRedirect("./index.jsp");
					return;
				} else {
					request.setAttribute("error", "This username is already taken!");
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("error", "A SQL error occured, please contact a server administrator");
			}
		} else {
			request.setAttribute("error", "Wrong information sent!");
		}
		doGet(request, response);
	}

}
