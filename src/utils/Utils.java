package utils;

import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import db.Database;
import db.User;

public class Utils {
	public static boolean isUserConnected(HttpServletRequest request) {
		return getUser(request) != null;
	}
	
	public static User getUser(HttpServletRequest request) {
		return getUser(request.getSession());
	}
	
	public static User getUser(HttpSession session) {
		if(session != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("username", (String)session.getAttribute("username"));
			map.put("password", (String)session.getAttribute("password"));
			try {
				return Database.userDao.findOneBy(map);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
