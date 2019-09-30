package login.summit.registration;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class developer_login
 */
@WebServlet("/developer_login")
public class developer_login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public developer_login() {
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
		// TODO Auto-generated method stub
		DAO dd = new DAOImpl();
		//String uname=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("psw");
		//String repeat_password=request.getParameter("psw-repeat");
		String submit_type = request.getParameter("submit");
		Developer d = dd.getDeveloper(email, password);
		if(submit_type.equals("login") && d!=null && d.getEmail()!=null) {
			request.setAttribute("message",d.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("emailId",email);
			//request.getRequestDispatcher("developer_dashboard.jsp").forward(request, response);
			session.setMaxInactiveInterval(300); 
			response.sendRedirect("developer_dashboard.jsp");
		
			
		}
		
		else {
			request.setAttribute("message","User Not found!! Please register");
			request.getRequestDispatcher("developer_login.jsp").forward(request, response);
		}
		
	}

}
