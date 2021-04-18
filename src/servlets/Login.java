package servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.Database;
import db.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("mode", "login");
		request.getRequestDispatcher("signup.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if(username != null && password != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("username", username);
			map.put("password", password);
			try {
				User u = Database.userDao.findOneBy(map);
				if(u == null) {
					request.setAttribute("error", "Wrong username - password combination!");
				} else {
					HttpSession session = request.getSession();
					session.setAttribute("username", username);
					session.setAttribute("password", password);
					response.sendRedirect("./index.jsp");
					return;
				}
			} catch (SQLException e) {
				e.printStackTrace();
				request.setAttribute("error", "A SQL error occured, please contact a server administrator");
			}
			
		}
		doGet(request, response);
	}

}
