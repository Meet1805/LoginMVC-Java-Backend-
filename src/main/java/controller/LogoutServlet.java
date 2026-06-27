package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

import java.io.IOException;

public class LogoutServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
						HttpServletResponse response)
			
				throws ServletException, IOException {
			
			HttpSession session =
		
				request.getSession();
		
			session.invalidate();
			response.sendRedirect("login.jsp");
	}
}
