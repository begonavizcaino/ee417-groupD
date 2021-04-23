package servlets;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import db.AttachedContent;
import db.Database;
import db.User;
import utils.Utils;

/**
 * Servlet implementation class UpdateProfile
 */
@WebServlet("/UpdateProfile")
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User u = Utils.getUser(request);
		if(u == null) {
			response.sendRedirect("main.jsp");
			return;
		}
		String bio = request.getParameter("bio");
		if(bio != null) {
			u.setBio(bio);
			try {
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
				        String encodedImage = "data:" + part.getContentType() + ";base64, " + Base64.getEncoder().encodeToString(outByte.toByteArray());
//						byte[] bytes = new byte[10240];
//						part.getInputStream().read(bytes);
//						String encodedImage = Base64.getEncoder().encodeToString(bytes);
				        u.setPicture(encodedImage);
				        break;
					}
				}
				Database.userDao.update(u);
			} catch (SQLException e) {
				System.out.println("error");
				e.printStackTrace();
				request.setAttribute("error", "An error occured while accessing the database");
				request.getRequestDispatcher("userprofile.jsp").forward(request, response);
			}
			response.sendRedirect("userprofile.jsp");
		}
	}

}
