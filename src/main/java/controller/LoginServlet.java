package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import dao.UserDAO;
import model.User;

public class LoginServlet extends HttpServlet {
		
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
						HttpServletResponse response)
								throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		String password = request.getParameter("password");
		
		UserDAO dao = new UserDAO();
		
		User user = dao.login(email, password);
		
		if (user != null) {
			
			HttpSession session =
					request.getSession();
			
			session.setAttribute("user", user);
			
			response.sendRedirect("home.jsp");
		
		} else {
			
			response.getWriter().println("Invalid Email or Password");
		}
	}
}