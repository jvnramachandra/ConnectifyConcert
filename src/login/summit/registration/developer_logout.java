package login.summit.registration;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class developer_logout
 */
@WebServlet("/developer_logout")
public class developer_logout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public developer_logout() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		

			
			HttpSession session = request.getSession();
			session.invalidate();  
	        
	        System.out.print("You are successfully logged out!");
			//session.removeAttribute("emailId");
			
			
			//session.getMaxInactiveInterval();
			response.sendRedirect("developer_login.jsp");
		
			
		/*}
		
		else {
			request.setAttribute("message","User Not found!! Please register");
			request.getRequestDispatcher("developer_login.jsp").forward(request, response);
		}*/
		
	}

}
