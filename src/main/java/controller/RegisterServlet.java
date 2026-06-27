package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import dao.UserDAO;
import model.User;

public class RegisterServlet extends HttpServlet {

		/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

		protected void doPost(HttpServletRequest request,
								HttpServletResponse response)
										throws ServletException, IOException {
			
			String name = request.getParameter("name");
			
			String email = request.getParameter("email");
			
			String password = request.getParameter("password");
			
			User user = new User(0,name, email, password);
			
			UserDAO dao = new UserDAO();
			
			boolean status = dao.register(user);
			
			if (status) {
			
				response.sendRedirect("login.jsp");
			
			} else {
			
				response.getWriter().println("Registration Failed");
			}
		}
	}